﻿using System;
using System.Net;
using System.Windows;
using System.IO;
using System.IO.IsolatedStorage;
using System.Runtime.Serialization;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System.Runtime.Serialization.Json;
using TaskStoreClientEntities;

namespace TaskStoreClientEntities
{
    public class WebServiceHelper
    {
        private static string baseurl = "http://taskstore.cloudapp.net:8080";

        private static string baseUrl
        {
            get
            {
                return baseurl;
            }
            set
            {
                baseurl = value;
            }
        }
        public static string BaseUrl { get { return baseUrl; } set { baseUrl = value; } }

        static HttpWebRequest request = null;

        // only one network operation at a time
        static bool isRequestInProgress = false;

        //static bool registerResult = WebRequest.RegisterPrefix("http://", WebRequestCreator.ClientHttp); 

        #region Web Service calls

        /// <summary>
        /// Create a new Tag
        /// </summary>
        /// <param name="user">User credentials to create</param>
        /// <param name="del">Delegate to callback</param>
        public static void CreateTag(User user, Tag tag, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/tags", "POST", tag, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<Tag>));
        }

        /// <summary>
        /// Create a new Task
        /// </summary>
        /// <param name="user">User credentials to create</param>
        /// <param name="del">Delegate to callback</param>
        public static void CreateTask(User user, Task task, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/tasks", "POST", task, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<Task>));
        }

        /// <summary>
        /// Create a new TaskList
        /// </summary>
        /// <param name="user">User credentials to create</param>
        /// <param name="del">Delegate to callback</param>
        public static void CreateTaskList(User user, TaskList tasklist, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/tasklists", "POST", tasklist, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<TaskList>));
        }

        /// <summary>
        /// Create a new User
        /// </summary>
        /// <param name="user">User credentials to create</param>
        /// <param name="del">Delegate to callback with the User info</param>
        public static void CreateUser(User user, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/users", "POST", user, del, netOpInProgressDel, new AsyncCallback(ProcessUser));
        }

        /// <summary>
        /// Delete a Tag
        /// </summary>
        /// <param name="user">User credentials to invoke the method</param>
        /// <param name="del">Delegate to callback</param>
        public static void DeleteTag(User user, Tag tag, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/tags/" + tag.ID, "DELETE", tag, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<Tag>));
        }

        /// <summary>
        /// Delete a Task
        /// </summary>
        /// <param name="user">User credentials to invoke the method</param>
        /// <param name="del">Delegate to callback</param>
        public static void DeleteTask(User user, Task task, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/tasks/" + task.ID, "DELETE", task, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<Task>));
        }

        /// <summary>
        /// Delete a TaskList
        /// </summary>
        /// <param name="user">User credentials to invoke the method</param>
        /// <param name="del">Delegate to callback</param>
        public static void DeleteTaskList(User user, TaskList tasklist, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/tasklists/" + tasklist.ID, "DELETE", tasklist, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<TaskList>));
        }

        /// <summary>
        /// Delete a User
        /// </summary>
        /// <param name="user">User credentials to invoke the method</param>
        /// <param name="del">Delegate to callback</param>
        public static void DeleteUser(User user, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/users/" + user.ID, "DELETE", user, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<User>));
        }

        /*
        /// <summary>
        /// Get the constants from the web service
        /// </summary>
        /// <param name="user">User credentials to invoke the method</param>
        /// <param name="del">Delegate for processing the callback; this delegate takes a Constants</param>
        public static void GetConstants(User user, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, String.Format("{0}/constants", baseUrl), "GET", null, del, netOpInProgressDel, ProcessResponse<Constants>);
        }
        */

        /// <summary>
        /// Authenticate the user credentials and return the User info to the delegate
        /// </summary>
        /// <param name="user">User structure for authorization information</param>
        /// <param name="del">Delegate to callback with the User info</param>
        public static void GetUser(User user, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/users", "GET", null, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<User>));
        }

        /// <summary>
        /// Send a bytestream of the wav to the service and retrieve the extracted text as a string
        /// </summary>
        /// <param name="user">User structure for authorization information</param>
        /// <param name="del">Delegate to callback with the User info</param>
        /// <param name="ms">MemoryStream of the speech wav</param>
        /// <param name="netOpInProgressDel"></param>
        public static void SpeechToText(User user, byte[] bytes, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/speech", "POST", bytes, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<string>));
        }

        /// <summary>
        /// Update a Tag
        /// </summary>
        /// <param name="user">User credentials to invoke the method</param>
        /// <param name="originalAndNewTasks">The original and new tags.  The Service will use original and new values to resolve conflicts</param>
        /// <param name="del">Delegate to callback</param>
        public static void UpdateTag(User user, List<Tag> originalAndNewTags, Delegate del, Delegate netOpInProgressDel)
        {
            if (originalAndNewTags == null || originalAndNewTags.Count != 2)
                return;
            InvokeWebServiceRequest(user, baseUrl + "/tags/" + originalAndNewTags[0].ID, "PUT", originalAndNewTags, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<Tag>));
        }

        /// <summary>
        /// Update a Task
        /// </summary>
        /// <param name="user">User credentials to invoke the method</param>
        /// <param name="originalAndNewTasks">The original and new tasks.  The Service will use original and new values to resolve conflicts</param>
        /// <param name="del">Delegate to callback</param>
        public static void UpdateTask(User user, List<Task> originalAndNewTasks, Delegate del, Delegate netOpInProgressDel)
        {
            if (originalAndNewTasks == null || originalAndNewTasks.Count != 2)
                return;
            InvokeWebServiceRequest(user, baseUrl + "/tasks/" + originalAndNewTasks[0].ID, "PUT", originalAndNewTasks, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<Task>));
        }

        /// <summary>
        /// Update a TaskList
        /// </summary>
        /// <param name="user">User credentials to invoke the method</param>
        /// <param name="tasklist">The original and new tasks.  The Service will use original and new values to resolve conflicts</param>
        /// <param name="del">Delegate to callback</param>
        public static void UpdateTaskList(User user, List<TaskList> originalAndNewTaskLists, Delegate del, Delegate netOpInProgressDel)
        {
            if (originalAndNewTaskLists == null || originalAndNewTaskLists.Count != 2)
                return;
            InvokeWebServiceRequest(user, baseUrl + "/tasklists/" + originalAndNewTaskLists[0].ID, "PUT", originalAndNewTaskLists, del, netOpInProgressDel, new AsyncCallback(ProcessResponse<TaskList>));
        }
        
        /// <summary>
        /// Verify the user credentials and process the HTTP response code for further action
        /// </summary>
        /// <param name="user">User structure for authorization information</param>
        /// <param name="del">Delegate to callback with the HTTP status code</param>
        public static void VerifyUserCredentials(User user, Delegate del, Delegate netOpInProgressDel)
        {
            InvokeWebServiceRequest(user, baseUrl + "/users", "GET", null, del, netOpInProgressDel, new AsyncCallback(ProcessUser));
        }

        #endregion

        #region Helper methods

        /// <summary>
        /// Common code to process a response body and deserialize the appropriate type
        /// </summary>
        /// <param name="resp">HTTP response</param>
        /// <param name="t">Type to deserialize</param>
        /// <returns>The deserialized object</returns>
        private static object DeserializeResponseBody(HttpWebResponse resp, Type t)
        {
            if (resp == null || resp.ContentType == null)
                return null;

            // get the first component of the content-type header
            // string contentType = resp.Headers["Content-Type"].Split(';')[0];
            string contentType = resp.ContentType.Split(';')[0];
            switch (contentType)
            {
                case "application/json":
                    DataContractJsonSerializer dcjs = new DataContractJsonSerializer(t);
                    return dcjs.ReadObject(resp.GetResponseStream());
                case "text/xml":
                case "application/xml":
                    DataContractSerializer dc = new DataContractSerializer(t);
                    return dc.ReadObject(resp.GetResponseStream());
                default:  // unknown format (some debugging code below)
                    StreamReader sr = new StreamReader(resp.GetResponseStream());
                    string str = sr.ReadToEnd();
                    return null;
            }
        }

        /// <summary>
        /// Common code for all callbacks to get the WebResponse 
        /// </summary>
        /// <param name="result"></param>
        /// <returns></returns>
        private static HttpWebResponseWrapper<T> GetWebResponse<T>(IAsyncResult result)
        {
            HttpWebResponse resp = null;

            // get response and mark request as not in progress
            try
            {
                resp = (HttpWebResponse)request.EndGetResponse(result);
                isRequestInProgress = false;
                if (resp == null)
                    return null;
            }
            catch (Exception ex)
            {
                // communication exception
                isRequestInProgress = false;
                return null;
            }

            // create and initialize a new response wrapper
            HttpWebResponseWrapper<T> wrapper = new HttpWebResponseWrapper<T>(resp);
            
            return wrapper;
        }

        /// <summary>
        /// Common code for invoking all the web service calls.  GET requests will be served directly from this method,
        /// whereas POST/PUT/DELETE requests are served from the InvokeWebServiceRequest_Inner method (which is an async callback)
        /// </summary>
        /// <param name="user">User structure for authorization information</param>
        /// <param name="url">URL to invoke</param>
        /// <param name="verb">Verb to use (e.g. GET / POST)</param>
        /// <param name="obj">Object to serialize on the request</param>
        /// <param name="del">Delegate supplied by caller to invoke when the operation completes</param>
        /// <param name="callback">Web Service-specific callback that will be invoked when the network operation completes</param>
        private static void InvokeWebServiceRequest(User user, string url, string verb, object obj, Delegate del, Delegate netOpInProgressDel, AsyncCallback callback)
        {
            // this code is non-reentrant
            if (isRequestInProgress == true)
                return;

            //bool registerResult = WebRequest.RegisterPrefix("http://", WebRequestCreator.ClientHttp);

            request = (HttpWebRequest) HttpWebRequest.Create(url);
            request.Accept = "application/json";
            request.UserAgent = "TaskStore-WinPhone";
            request.Method = verb == null ? "GET" : verb;
            if (user != null)
            {
                request.Headers["TaskStore-Username"] = user.Name;
                request.Headers["TaskStore-Password"] = user.Password;
            }

            // if this is a GET request, we can execute from here
            if (request.Method == "GET")
            {
                // execute the web request and get the response
                try
                {
                    WebServiceState reqState = new WebServiceState() 
                    { 
                        Delegate = del, 
                        NetworkOperationInProgressDelegate = netOpInProgressDel
                    };
                    IAsyncResult result = request.BeginGetResponse(callback, reqState);
                    if (result != null)
                        isRequestInProgress = true;
                }
                catch (Exception)
                {
                    isRequestInProgress = false;
                }
            }
            else
            {
                // this is a request that contains a body (PUT, POST, DELETE)
                // need to nest another async call - this time to get the request stream
                try
                {
                    IAsyncResult result = request.BeginGetRequestStream(
                        new AsyncCallback(InvokeWebServiceRequest_Inner),
                        new WebInvokeServiceState()
                        {
                            Callback = callback,
                            Delegate = del,
                            NetworkOperationInProgressDelegate = netOpInProgressDel,
                            RequestBody = obj
                        });
                   if (result != null)
                        isRequestInProgress = true;
                }
                catch (Exception)
                {
                    isRequestInProgress = false;
                }
            }
        }

        /// <summary>
        /// Async callback called from InvokeWebServiceRequest for non-GET requests 
        /// which need to set a request body
        /// </summary>
        /// <param name="res"></param>
        private static void InvokeWebServiceRequest_Inner(IAsyncResult res)
        {
            WebInvokeServiceState state = res.AsyncState as WebInvokeServiceState;
            if (state == null)
                throw new Exception("Web Service State not found");

            Stream stream = request.EndGetRequestStream(res);

            // serialize a request body if one was passed in (and the verb will take it)
            if (state.RequestBody != null && request.Method != "GET")
            {
                request.UserAgent = "TaskStore-WinPhone";
                if (state.RequestBody.GetType() == typeof(byte[]))
                {
                    byte[] bytes = (byte[])state.RequestBody;
                    stream.Write(bytes, 0, bytes.Length);
                }
                else
                {
                    request.ContentType = "application/json";
                    DataContractJsonSerializer ser = new DataContractJsonSerializer(state.RequestBody.GetType());
                    ser.WriteObject(stream, state.RequestBody);
                }
                stream.Flush();
                stream.Close();
            }

            // execute the web request and get the response
            try
            {
                WebServiceState reqState = new WebServiceState() 
                { 
                    Delegate = state.Delegate, 
                    NetworkOperationInProgressDelegate = state.NetworkOperationInProgressDelegate 
                };
                IAsyncResult result = request.BeginGetResponse(state.Callback, reqState);
                if (result != null)
                    isRequestInProgress = true;
            }
            catch (Exception)
            {
                isRequestInProgress = false;
                
                // signal the operation is done and unsuccessful
                state.NetworkOperationInProgressDelegate.DynamicInvoke(false, false);
            }
        }

        /// <summary>
        /// Common code to process the response from any web service call.  This is invoked from the callback 
        /// method for the web service, and passed a Type for deserializing the response body. 
        /// This method will also invoke the delegate with the result of the Web Service call
        /// </summary>
        /// <param name="result"></param>
        private static void ProcessResponse<T>(IAsyncResult result)
        {
            WebServiceState state = result.AsyncState as WebServiceState;
            if (state == null)
                return; 

            Delegate netOpStatusDel = state.NetworkOperationInProgressDelegate as Delegate;
            if (netOpStatusDel == null)
                return;  // if no delegate was passed, the results can't be processed

            // get the method-specific delegate
            Delegate del = state.Delegate as Delegate;
            if (del == null)
                return;  // if no delegate was passed, the results can't be processed

            // get the web response and make sure it's not null (failed)
            HttpWebResponseWrapper<T> resp = GetWebResponse<T>(result);
            if (resp == null)
            {
                // signal that the network operation completed unsuccessfully
                netOpStatusDel.DynamicInvoke(false, false);
                return;
            }
            else
            {
                // signal that the network operation completed and whether it completed successfully
                if (resp.StatusCode == HttpStatusCode.OK || resp.StatusCode == HttpStatusCode.Created || resp.StatusCode == HttpStatusCode.Accepted)
                    netOpStatusDel.DynamicInvoke(false, true);
                else
                    netOpStatusDel.DynamicInvoke(false, false);
            }

            // invoke the delegate with the response body
            try
            {
                T resultObject = resp.GetBody();
                del.DynamicInvoke(resultObject);
            }
            catch (Exception)
            {
                del.DynamicInvoke(null);
            }
        }

        /// <summary>
        /// Process User-related operations (the delegate takes both a User and an HttpStatusCode)
        /// </summary>
        /// <param name="result"></param>
        private static void ProcessUser(IAsyncResult result)
        {
            WebServiceState state = result.AsyncState as WebServiceState;
            if (state == null)
                return;

            Delegate netOpStatusDel = state.NetworkOperationInProgressDelegate as Delegate;
            if (netOpStatusDel == null)
                return;  // if no delegate was passed, the results can't be processed

            // get the method-specific delegate
            Delegate del = state.Delegate as Delegate;
            if (del == null)
                return;  // if no delegate was passed, the results can't be processed

            HttpWebResponseWrapper<User> resp = GetWebResponse<User>(result);
            if (resp == null)
            {
                // signal that the network operation completed unsuccessfully
                netOpStatusDel.DynamicInvoke(false, false);
                return;
            }
            else
            {
                // signal that the network operation completed and whether it completed successfully
                if (resp.StatusCode == HttpStatusCode.OK || resp.StatusCode == HttpStatusCode.Created || resp.StatusCode == HttpStatusCode.Accepted)
                    netOpStatusDel.DynamicInvoke(false, true);
                else
                    netOpStatusDel.DynamicInvoke(false, false);
            }

            // invoke the operation-specific delegate
            if (resp == null)
            {
                del.DynamicInvoke(null, null);
            }
            else
                del.DynamicInvoke(resp.GetBody(), resp.StatusCode);
        }


        // some classes which assist in faking out an HttpWebResponse that can extract the StatusCode from the message body
        // this is to overcome limitations in the WP7 HttpWebResponse which can't handle StatusCodes outside of the 200 family
        [DataContract(Namespace="")]
        public class HttpMessageBodyWrapper<T>
        {
            // define one additional property - the status code from the message
            [DataMember]
            public HttpStatusCode StatusCode { get; set; }

            [DataMember]
            public T Value { get; set; }
        }

        private class HttpWebResponseWrapper<T> 
        {
            public HttpWebResponseWrapper(HttpWebResponse resp)
            {
                // capture inner object
                innerResponse = resp;

                // deserialize the message body into the HttpMessageBodyWrapper clas
                DeserializeMessageBody();
            }

            public T GetBody()
            {
                return bodyWrapper.Value;
            }

            // status code extracted out of the message body
            private HttpMessageBodyWrapper<T> bodyWrapper;

            // inner object to delegate to
            private HttpWebResponse innerResponse;

            // delegate this property (and this property only) to the Wrapper implementation
            public HttpStatusCode StatusCode
            {
                get
                {
                    return bodyWrapper.StatusCode;
                }
            }

            // deserialize the status code out of the message body, and reset the stream
            private void DeserializeMessageBody()
            {
                // get the status code out of the response
                bodyWrapper = (HttpMessageBodyWrapper<T>) DeserializeResponseBody(innerResponse, typeof(HttpMessageBodyWrapper<T>));
            }

            // delegate all other overridable public methods or properties to the inner object
            public void Close()
            {
                innerResponse.Close();
            }

            public long ContentLength
            {
                get
                {
                    return innerResponse.ContentLength;
                }
            }

            public string ContentType
            {
                get
                {
                    return innerResponse.ContentType;
                }
            }

            public CookieCollection Cookies
            {
                get
                {
                    return innerResponse.Cookies;
                }
            }

            public bool Equals(object obj)
            {
                return innerResponse.Equals(obj);
            }

            public int GetHashCode()
            {
                return innerResponse.GetHashCode();
            }

            public Stream GetResponseStream()
            {
                return innerResponse.GetResponseStream();
            }

            public WebHeaderCollection Headers
            {
                get
                {
                    return innerResponse.Headers;
                }
            }

            public string Method
            {
                get
                {
                    return innerResponse.Method;
                }
            }

            public Uri ResponseUri
            {
                get
                {
                    return innerResponse.ResponseUri;
                }
            }

            public string StatusDescription
            {
                get
                {
                    return innerResponse.StatusDescription;
                }
            }

            public string ToString()
            {
                return innerResponse.ToString();
            }
        }

        private class WebInvokeServiceState
        {
            public AsyncCallback Callback { get; set; }  // callback for the GetResponse
            public Delegate Delegate { get; set; }  // delegate passed in by the caller
            public Delegate NetworkOperationInProgressDelegate { get; set; }  // delegate passed in by the caller
            public object RequestBody { get; set; }  // object to serialize on the request
        }

        private class WebServiceState
        {
            public Delegate Delegate { get; set; }  // delegate passed in by the caller
            public Delegate NetworkOperationInProgressDelegate { get; set; }  // delegate passed in by the caller
        }

        #endregion
    }
}