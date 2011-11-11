using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ServiceModel;
using System.ServiceModel.Web;
using Microsoft.ApplicationServer.Http;
using System.Net.Http;
using System.Net;
using System.Reflection;
using TaskStoreWeb.Helpers;
using TaskStoreWeb.Models;
using System.Data.Entity;
using Microsoft.Speech.Recognition;
using Microsoft.Speech.AudioFormat;
using System.IO;
using System.Net.Http.Headers;
using TaskStoreServerEntities;
using System.Threading;
using ServiceHelpers;

namespace TaskStoreWeb.Resources
{
    // singleton service, which manages thread-safety on its own
    [ServiceContract]
    [ServiceBehavior(ConcurrencyMode = ConcurrencyMode.Multiple, InstanceContextMode = InstanceContextMode.Single)]
    public class SpeechResource
    {
        private const int engines = 3;  // number of speech recognition engines to cache
        private static SpeechRecognitionEngine[] sreArray = new SpeechRecognitionEngine[engines];
        private static bool[] sreInUseArray = new bool[engines];

        private static SpeechAudioFormatInfo formatInfo = null;
        private static bool isDebugEnabled = false;
        private static object sreLock = new Object();

        public SpeechResource()
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            // enable debug flag if this is a debug build
#if DEBUG
            isDebugEnabled = true;
#endif
        }

        private TaskStore TaskStore
        {
            get
            {
                // if in a debug build, always go to the database
                if (isDebugEnabled)
                    return new TaskStore();
                else // retail build
                {
                    // use a cached context (to promote serving values out of EF cache) 
                    return TaskStore.Current;
                }
            }
        }

        /// <summary>
        /// Convert the byte array representing the speech wav format to a text string
        /// </summary>
        /// <returns>speech-to-text string</returns>
        [WebInvoke(UriTemplate = "", Method = "POST")]
        public HttpResponseMessageWrapper<string> SpeechToText(HttpRequestMessage req)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            HttpStatusCode code = ResourceHelper.AuthenticateUser(req, TaskStore);
            if (code != HttpStatusCode.OK)
                return new HttpResponseMessageWrapper<string>(req, code);  // user not authenticated

            // get a free instance of the speech recognition engine
            SpeechRecognitionEngine sre = null;
            while (sre == null)
            {
                sre = GetSpeechEngine();

                // if all SRE's are in use, wait one second and then try again
                if (sre == null)
                    Thread.Sleep(1000);
            }

            try
            {
#if KILL
            string msg = WriteSpeechFile(user, speechToParse);
            if (msg != null)
                return new HttpResponseMessageWrapper<string>(req, msg, HttpStatusCode.OK);
#endif

                DateTime start = DateTime.Now;
                string responseString = null;
                sre.SetInputToAudioStream(req.Content.ContentReadStream, formatInfo);

                var result = sre.Recognize();
                //ms = null;

                if (result == null)
                    responseString = "[unrecognized]";
                else
                    responseString = result.Text;

                DateTime end = DateTime.Now;
                TimeSpan ts = end - start;

                // trace the recognized speech
                string timing = String.Format(" {0}.{1} seconds", ts.Seconds.ToString(), ts.Milliseconds.ToString());
                LoggingHelper.TraceLine(String.Format("Recognized '{0}' in{1}", responseString, timing), LoggingHelper.LogLevel.Detail);

                responseString += timing;
                var response = new HttpResponseMessageWrapper<string>(req, responseString, HttpStatusCode.OK);
                response.Headers.CacheControl = new CacheControlHeaderValue() { NoCache = true };

                // reset the speech engine (this is time-consuming so do it on a new thread)
                //ParameterizedThreadStart threadStart = new ParameterizedThreadStart(ResetSpeechEngine);
                //Thread thread = new Thread(threadStart);
                //thread.Start(new SpeechInfo() { Engine = sre, SpeechByteArray = speechToParse });

                // release engine instance
                ReleaseSpeechEngine(sre);

                // return the response
                return response;
            }
            catch (Exception ex)
            {
                // speech failed
                LoggingHelper.TraceError("Speech recognition failed: " + ex.Message);

                // release engine instance
                ReleaseSpeechEngine(sre);

                return new HttpResponseMessageWrapper<string>(req, HttpStatusCode.InternalServerError);
            }
        }

        SpeechRecognitionEngine GetSpeechEngine()
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            // this code must be thread safe
            lock (sreLock)
            {
                int i;
                for (i = 0; i < sreInUseArray.Length; i++)
                    if (sreInUseArray[i] == false)
                        break;

                if (sreInUseArray[i] == true)
                    return null;

                if (sreArray[i] == null)
                {
                    sreArray[i] = new SpeechRecognitionEngine();
                    InitializeSpeechEngine(sreArray[i]);
                }

                // set the in use flag and return the SRE
                sreInUseArray[i] = true;

                // log the speech engine used
                LoggingHelper.TraceLine(String.Format("Using SpeechEngine[{0}]", i), LoggingHelper.LogLevel.Detail);

                // return speech engine
                return sreArray[i];
            }
        }

        void InitializeGrammar(string grammarPath, string appDataPath, string fileName)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            // construct App Root directory using drive letter from appDataPath and the approot path
            string appRootDir = appDataPath.Substring(0, 1) + @":\approot\Content\grammars";
            try
            {
                // if the file exists, do nothing
                FileStream fs = File.OpenRead(grammarPath);
                fs.Close();
            }
            catch (DirectoryNotFoundException)
            {
                LoggingHelper.TraceError("Directory " + appDataPath + " not found");
                // if the directory doesn't exist, move it over from the approot
                if (Directory.Exists(appRootDir))
                {
                    LoggingHelper.TraceInfo("Creating " + appDataPath);
                    try
                    {
                        Directory.CreateDirectory(appDataPath);
                        InitializeGrammarCopyFiles(appDataPath, fileName, appRootDir);
                    }
                    catch (Exception ex)
                    {
                        LoggingHelper.TraceError("Create Directory " + appDataPath + " failed: " + ex.Message);
                    }
                }
                else
                    LoggingHelper.TraceError("Directory " + appRootDir + " does not exist - cannot initialize grammar");
            }
            catch (FileNotFoundException)
            {
                LoggingHelper.TraceError("File " + grammarPath + " not found");
                InitializeGrammarCopyFiles(appDataPath, fileName, appRootDir);
            }
            catch (Exception ex)
            {
                LoggingHelper.TraceError("Cannot find grammars: " + ex.Message);
            }
        }

        private static void InitializeGrammarCopyFiles(string appDataPath, string fileName, string appRootDir)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            if (File.Exists(Path.Combine(appRootDir, fileName)))
            {                
                LoggingHelper.TraceInfo("Copying " + appRootDir + " to " + appDataPath);
                try
                {
                    foreach (var file in Directory.EnumerateFiles(appRootDir))
                    {
                        string fname = Path.GetFileName(file);
                        LoggingHelper.TraceInfo("Copying " + Path.Combine(appRootDir, fname) + " to " + Path.Combine(appDataPath, fname));
                        File.Copy(Path.Combine(appRootDir, fname), Path.Combine(appDataPath, fname));
                    }
                }
                catch (Exception ex)
                {
                    LoggingHelper.TraceError("Copy file failed: " + ex.Message);
                }
            }
            else
                LoggingHelper.TraceError("File " + Path.Combine(appRootDir, fileName) + " does not exist - cannot initialize grammar");
        }

        void InitializeSpeechEngine(SpeechRecognitionEngine sre)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            try
            {
                // initialize and cache format info
                int sampleRate = 16000;  // hardcode for now
                formatInfo = new SpeechAudioFormatInfo(sampleRate, AudioBitsPerSample.Sixteen, AudioChannel.Mono);

                // initialize and cache speech engine
                sre.UpdateRecognizerSetting("AssumeCFGFromTrustedSource", 1);

                string fileName = @"TELLME-SMS-LM.cfgp";
                string appDataPath = HttpContext.Current.Server.MapPath("~/Content/grammars");
                string grammarPath = Path.Combine(appDataPath, fileName);
                LoggingHelper.TraceInfo("Grammar path: " + grammarPath);

                // make sure the grammar files are copied over from the approot directory to the appDataPath
                InitializeGrammar(grammarPath, appDataPath, fileName);

                // initialize and load the grammar
                Grammar grammar = new Grammar(grammarPath);
                grammar.Enabled = true;
                sre.LoadGrammar(grammar);
            }
            catch (Exception ex)
            {
                LoggingHelper.TraceError("Speech Engine initialization failed: " + ex.Message);            
            }
        }

        static void ReleaseSpeechEngine(SpeechRecognitionEngine sre)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            // this code must be thread safe
            lock (sreLock)
            {
                int i;
                for (i = 0; i < sreArray.Length; i++)
                    if (sreArray[i] == sre)
                        break;

                // this cannot happen, but check anyway
                if (sreArray[i] != sre)
                    return;

                // reset the in use flag on this SRE instance
                sreInUseArray[i] = false;
            }
        }

        static void ResetSpeechEngine(object obj)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            SpeechInfo si = (SpeechInfo)obj;
            SpeechRecognitionEngine sre = si.Engine;
            byte[] speechByteArray = si.SpeechByteArray;
            MemoryStream ms = new MemoryStream(speechByteArray);
            sre.SetInputToAudioStream(ms, formatInfo);

            // run the recognition again (which will take longer, but then reset the recognizer to 
            // a state where it runs quickly on the next invocation)
            sre.Recognize();
            ReleaseSpeechEngine(sre);
        }

        string WriteSpeechFile(User user, byte[] bytes)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            try
            {
                //Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/files"));
                DateTime tod = DateTime.Now;
                string filename = String.Format("{0}{1}-{2}.wav",
                    HttpContext.Current.Server.MapPath("~/files/"),
                    user.Name,
                    tod.Ticks);
                FileStream fs = File.Create(filename);
                if (fs == null)
                    return "file not created";
                fs.Write(bytes, 0, bytes.Length);
                fs.Flush();
                fs.Close();
                return null;
            }
            catch (Exception ex)
            {
                LoggingHelper.TraceError("Write speech file failed: " + ex.Message);
                return ex.Message;
            }
        }

        class SpeechInfo
        {
            public SpeechRecognitionEngine Engine { get; set; }
            public byte[] SpeechByteArray { get; set; }
        }
    }
}