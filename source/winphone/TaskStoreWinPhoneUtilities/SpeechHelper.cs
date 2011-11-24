using System;
using System.Net;
using System.Net.Sockets;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Windows.Threading;
using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Audio;
using TaskStoreClientEntities;
using System.IO;
using System.Collections.Generic;

namespace TaskStoreWinPhoneUtilities
{
    public class SpeechHelper
    {
        private static Microphone mic = Microphone.Default;
        private static bool initializedBufferReadyEvent = false;
        private static bool speechOperationInProgress = false;
        private static byte[] speechBuffer;
        private static List<byte[]> speechBufferList = new List<byte[]>();
        private static int offset = 0;
        private static int length = 0;
        private static Delegate networkDelegate;
        private static Delegate speechStateDelegate;
        private static int numBytes = 0;

        /// <summary>
        /// State of the speech state machine
        /// </summary>
        public enum SpeechState
        {
            Initializing,
            Listening,
            Recognizing,
            Finished,
        }
        
        // delegate to call when the speech state changes
        public delegate void SpeechStateCallbackDelegate(SpeechState speechState, string message);

        // delegate to call with the recognized string
        public delegate void SpeechToTextCallbackDelegate(string textString);

        public static void CancelStreamed(Delegate networkDel)
        {
            // stop listening
            mic.Stop();

            NetworkHelper.CancelSpeech();
            networkDel.DynamicInvoke(false, null);

            speechOperationInProgress = false;
        }

        public static string SpeechStateString(SpeechState state)
        {
            switch (state)
            {
                case SpeechHelper.SpeechState.Initializing:
                    return "Initializing";
                case SpeechHelper.SpeechState.Listening:
                    return "Listening";
                case SpeechHelper.SpeechState.Recognizing:
                    return "Recognizing";
                case SpeechHelper.SpeechState.Finished:
                    return "Finished";
                default:
                    return "Unrecognized";
            }
        }

        public static void Start()
        {
            if (speechOperationInProgress == true)
                return;

            mic.BufferDuration = TimeSpan.FromSeconds(1);
            length = mic.GetSampleSizeInBytes(mic.BufferDuration);
            speechBuffer = new byte[length];
            offset = 0;

            // callback when the mic gathered 1 sec worth of data
            if (initializedBufferReadyEvent == false)
            {
                mic.BufferReady += delegate
                {
                    // reallocate if we ran out of buffer
                    if (offset >= speechBuffer.Length)
                    {
                        byte[] newBuffer = new byte[speechBuffer.Length * 2];
                        speechBuffer.CopyTo(newBuffer, 0);
                        speechBuffer = newBuffer;
                    }
                    mic.GetData(speechBuffer, offset, length);
                    offset += length;
                };
                initializedBufferReadyEvent = true;
            }

            // start listening
            speechOperationInProgress = true;
            mic.Start();
        }

        public static void StartStreamed(User user, SpeechStateCallbackDelegate del, Delegate networkDel)
        {
            // StartStreamed is not reentrant - make sure the caller didn't violate the contract
            if (speechOperationInProgress == true)
                return;

            // set the flag
            speechOperationInProgress = true;

            // store the delegates passed in
            speechStateDelegate = del;
            networkDelegate = networkDel;

            // initialize the microphone information and speech buffer
            mic.BufferDuration = TimeSpan.FromSeconds(1);
            length = mic.GetSampleSizeInBytes(mic.BufferDuration);
            speechBuffer = new byte[length];
            speechBufferList.Clear();
            numBytes = 0;

            // callback when the mic gathered 1 sec worth of data
            if (initializedBufferReadyEvent == false)
            {
                mic.BufferReady += delegate
                {
                    // get the data from the mic
                    int len = mic.GetData(speechBuffer);
                    numBytes += len;

                    // create a properly sized copy of the speech buffer
                    byte[] speechChunk = new byte[len];
                    Array.Copy(speechBuffer, speechChunk, len);

                    // send the chunk to the service
                    try
                    {
                        // get an encoded buffer
                        byte[] encodedBuf = EncodeSpeech(speechBuffer, len);

                        // invoke the network call
                        NetworkHelper.SendSpeech(encodedBuf, encodedBuf.Length, null, new NetworkDelegate(NetworkCallback));
                    }
                    catch (Exception)
                    {
                        // stop listening
                        mic.Stop();

                        speechOperationInProgress = false;
                    }

                    // add the chunk to the buffer list
                    speechBufferList.Add(speechChunk);

#if DEBUG
                    // signal the caller that the chunk has been sent
                    speechStateDelegate.DynamicInvoke(SpeechState.Listening, numBytes.ToString());
#endif
                };
                initializedBufferReadyEvent = true;
            }

            //WebServiceHelper.SpeechToTextStream(
            //    user, 
            //    new StreamCallbackDelegate(StreamCallback),
            //    del, 
            //    new NetworkDelegate(NetworkCallback));

            // connect to the web service, and once that completes successfully,
            // it will invoke the StartMic delegate to start the microphone
            NetworkHelper.BeginSpeech(
                user, 
                new StartMicDelegate(StartMic),
                new NetworkDelegate(NetworkCallback));
        }

        public static void Stop(User user, SpeechToTextCallbackDelegate del, Delegate networkDel)
        {
            // stop listening
            mic.Stop();
            WebServiceHelper.SpeechToText(
                user,
                speechBuffer,
                del,
                networkDel);
            speechOperationInProgress = false;
        }

        public static void StopStreamed(SpeechToTextCallbackDelegate del)
        {
            // get the last chunk of speech 
            int len = mic.GetData(speechBuffer);

            // stop listening
            mic.Stop();

            // create a properly sized copy of the last buffer
            byte[] lastBuf = new byte[len];
            Array.Copy(speechBuffer, lastBuf, len);

            // add the last speech buffer to the list
            speechBufferList.Add(lastBuf);

            // get an encoded buffer
            byte[] encodedBuf = EncodeSpeech(lastBuf, len);

            // send the terminator and receive the response
            //NetworkHelper.EndSpeech(lastBuf, len, del, new NetworkDelegate(NetworkCallback));
            NetworkHelper.EndSpeech(encodedBuf, encodedBuf.Length, del, new NetworkDelegate(NetworkCallback));

            // repeat the sentence back to the user
            PlaybackSpeech();
        }

        #region Delegates

        public delegate void StartMicDelegate();
        private static void StartMic()
        {
            // update the speech state
            speechStateDelegate.DynamicInvoke(SpeechState.Listening, "Mic started");

            // start getting data from the mic
            mic.Start();
        }

        public delegate void NetworkDelegate(bool operationInProgress, bool? operationSuccessful);
        private static void NetworkCallback(bool operationInProgress, bool? operationSuccessful)
        {
            // if the network operation returned, clean up resources
            if (operationSuccessful != null)
            {
                if ((bool)operationSuccessful == false)
                {
                    // stop listening
                    mic.Stop();
                }

                // indicate speech operation no longer in progress
                speechOperationInProgress = false;
            }

            // invoke the caller-supplied network delegate
            networkDelegate.DynamicInvoke(operationInProgress, operationSuccessful);
        }

        #endregion

        #region Helpers

        private static byte[] EncodeSpeech(byte[] buf, int len)
        {
            return buf;
        }

        private static void PlaybackSpeech()
        {
            // create a sound effect instance
            DynamicSoundEffectInstance effect = new DynamicSoundEffectInstance(mic.SampleRate, AudioChannels.Mono);
            
            // submit all the buffers to the instance
            foreach (var buf in speechBufferList)
                effect.SubmitBuffer(buf);
            speechBufferList.Clear();

            // create an event handler to stop playback when all the buffers have been consumed
            effect.BufferNeeded += delegate
            {
                if (effect.PendingBufferCount == 0)
                    effect.Stop();
            };

            // play the speech
            FrameworkDispatcher.Update();
            effect.Play();
        }

        #endregion
    }

    #region XNA scaffolding

    public class XNAFrameworkDispatcherService : IApplicationService
    {
        private DispatcherTimer frameworkDispatcherTimer;

        public XNAFrameworkDispatcherService()
        {
            this.frameworkDispatcherTimer = new DispatcherTimer();
            this.frameworkDispatcherTimer.Interval = TimeSpan.FromTicks(333333);
            this.frameworkDispatcherTimer.Tick += frameworkDispatcherTimer_Tick;
            FrameworkDispatcher.Update();
        }

        void frameworkDispatcherTimer_Tick(object sender, EventArgs e) { FrameworkDispatcher.Update(); }

        void IApplicationService.StartService(ApplicationServiceContext context) { this.frameworkDispatcherTimer.Start(); }

        void IApplicationService.StopService() { this.frameworkDispatcherTimer.Stop(); }
    }

    #endregion
}
