﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Http;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Runtime.Serialization;
using System.IO;
using TaskStoreWeb.Models;
using System.Web.Security;
using TaskStoreServerEntities;
using ServiceHelpers;

namespace TaskStoreWeb.Helpers
{
    public class ResourceHelper
    {
        /// <summary>
        /// Process the request for authentication info 
        /// </summary>
        /// <param name="req">HTTP Request</param>
        /// <returns>HTTP status code corresponding to authentication status</returns>
        public static HttpStatusCode AuthenticateUser(HttpRequestMessage req, TaskStore taskstore)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            User user = GetUserPassFromMessage(req);

            // if user/pass headers not found, return 400 Bad Request
            if (user == null)
            {
                // Log failure
                LoggingHelper.TraceError("Bad request: no user information found");
                return HttpStatusCode.BadRequest;
            }

            try
            {
                // authenticate the user
                if (Membership.ValidateUser(user.Name, user.Password) == false)
                    return HttpStatusCode.Forbidden;
                else
                    return HttpStatusCode.OK;
            }
            catch (Exception)
            {
                // username not found - return 404 Not Found
                return HttpStatusCode.NotFound;
            }
        }

        /// <summary>
        /// Process the request for authentication info 
        /// </summary>
        /// <param name="req">HTTP Request</param>
        /// <returns>HTTP status code corresponding to authentication status</returns>
        public static HttpStatusCode AuthenticateUserBAK(HttpRequestMessage req, TaskStore taskstore)
        {
            // Log function entrance
            LoggingHelper.TraceFunction(); 
            
            User user = GetUserPassFromMessage(req);

            // if user/pass headers not found, return 400 Bad Request
            if (user == null)
                return HttpStatusCode.BadRequest;

            try
            {
                // look up the user name - if doesn't exist, return 404 Not Found
                var dbUser = taskstore.Users.Single<User>(u => u.Name == user.Name);
                if (dbUser == null)
                    return HttpStatusCode.NotFound;

                try
                {
                    // authenticate both username and password - if don't match, return 403 Forbidden
                    dbUser = taskstore.Users.Single<User>(u => u.Name == user.Name && u.Password == user.Password);
                    if (dbUser == null)
                        return HttpStatusCode.Forbidden;

                    // return 200 OK and user info
                    return HttpStatusCode.OK;
                }
                catch (Exception)
                {
                    // password doesn't match - return 403 Forbidden 
                    return HttpStatusCode.Forbidden;
                }
            }
            catch (Exception)
            {
                // username not found - return 404 Not Found
                return HttpStatusCode.NotFound;
            }
        }

        /// <summary>
        /// Create a new user
        /// </summary>
        /// <param name="req">HTTP request</param>
        /// <param name="taskstore">The TaskStore database context</param>
        /// <param name="user">The new user information</param>
        /// <returns>The HTTP status code to return</returns>
        public static HttpStatusCode CreateUser(TaskStore taskstore, User user, out MembershipCreateStatus createStatus)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();
            
            try
            {
                // create the user using the membership provider
                MembershipUser mu = Membership.CreateUser(user.Name, user.Password, user.Email, null, null, true, null, out createStatus);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    // create the user in the TaskStore user table
                    User u = new User()
                    {
                        ID = (Guid)mu.ProviderUserKey /*Guid.NewGuid()*/,
                        Name = user.Name,
                        Password = user.Password,
                        Email = user.Email
                    };
                    taskstore.Users.Add(u);
                    taskstore.SaveChanges();

                    // Log new user creation
                    LoggingHelper.TraceInfo("Created new user " + user.Name);
                    return HttpStatusCode.Created;
                }
                else
                {
                    // Log failure
                    LoggingHelper.TraceError("Failed to create new user " + user.Name);
                    return HttpStatusCode.Conflict;
                }
            }
            catch (Exception)
            {
                createStatus = MembershipCreateStatus.DuplicateUserName;

                // Log new user creation
                LoggingHelper.TraceError("Failed to create new user " + user.Name);
                return HttpStatusCode.Conflict;
            }
        }

        /// <summary>
        /// Get the username/password from the message 
        /// </summary>
        /// <param name="req">HTTP request</param>
        /// <returns>User structure with filled in Name/Password</returns>
        public static User GetUserPassFromMessage(HttpRequestMessage req)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            string username = null;
            IEnumerable<string> values = new List<string>();
            if (req.Headers.TryGetValues("TaskStore-Username", out values) == true)
            {
                username = values.ToArray<string>()[0];
            }
            else
                return null;

            string password = null;
            if (req.Headers.TryGetValues("TaskStore-Password", out values) == true)
            {
                password = values.ToArray<string>()[0];
            }
            else
                return null;

            return new User() { Name = username, Password = password };
        }

        /// <summary>
        /// Common code to process a response body and deserialize the appropriate type
        /// </summary>
        /// <param name="resp">HTTP response</param>
        /// <param name="t">Type to deserialize</param>
        /// <returns>The deserialized object</returns>
        public static object ProcessRequestBody(HttpRequestMessage req, Type t)
        {
            // Log function entrance
            LoggingHelper.TraceFunction();

            if (req == null)
                return null;

            string contentType = req.Content.Headers.ContentType.MediaType;

            switch (contentType)
            {
                case "application/json":
                    DataContractJsonSerializer dcjs = new DataContractJsonSerializer(t);
                    return dcjs.ReadObject(req.Content.ContentReadStream);
                case "text/xml":
                case "application/xml":
                    DataContractSerializer dc = new DataContractSerializer(t);
                    return dc.ReadObject(req.Content.ContentReadStream);
            }

            // no transfer encodings match

            // Log error condition
            LoggingHelper.TraceError("ProcessRequestBody: content-type unrecognized: " + contentType);
            return null;
        }
    }
}