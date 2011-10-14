using System;
using System.Net;
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

namespace TaskStoreWinPhoneUtilities
{
    public class SpeechHelper
    {
        private static Microphone mic = Microphone.Default;
        private static bool initializedBufferReadyEvent = false;
        private static bool speechOperationInProgress = false;
        private static byte[] speechBuffer;
        private static int offset = 0;
        private static int length = 0;
        private static Stream speechStream;
        private static Delegate networkDelegate;

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

        public delegate void SpeechToTextCallbackDelegate(string textString);

        public static void StartStreamed(User user, SpeechToTextCallbackDelegate del, Delegate networkDel)
        {
            if (speechOperationInProgress == true)
                return;

            mic.BufferDuration = TimeSpan.FromSeconds(1);
            length = mic.GetSampleSizeInBytes(mic.BufferDuration);
            speechBuffer = new byte[length];
            speechStream = null;

            // callback when the mic gathered 1 sec worth of data
            if (initializedBufferReadyEvent == false)
            {
                mic.BufferReady += delegate
                {
                    mic.GetData(speechBuffer);
                    if (speechStream != null)
                    {
                        try
                        {
                            speechStream.Write(speechBuffer, 0, length);
                        }
                        catch (Exception)
                        {
                            // stop listening
                            mic.Stop();

                            speechOperationInProgress = false;
                        }
                    }
                };
                initializedBufferReadyEvent = true;
            }

            networkDelegate = networkDel;

            // start listening
            speechOperationInProgress = true;

            WebServiceHelper.SpeechToTextStream(
                user, 
                new StreamCallbackDelegate(StreamCallback),
                del, 
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

        public static void StopStreamed()
        {
            // stop listening
            mic.Stop();
            
            // close the stream
            speechStream.Close();
            speechOperationInProgress = false;
        }

        public delegate void StreamCallbackDelegate(Stream stream);
        private static void StreamCallback(Stream stream)
        {
            // save the stream to write the speech data to
            speechStream = stream;

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

                    // close the stream
                    speechStream.Close();
                }

                // indicate speech operation no longer in progress
                speechOperationInProgress = false;
            }

            // invoke the caller-supplied network delegate
            networkDelegate.DynamicInvoke(operationInProgress, operationSuccessful);
        }
    }

    // XNA scaffolding

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
}
