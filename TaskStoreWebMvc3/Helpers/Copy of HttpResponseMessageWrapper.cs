using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Http;
using Microsoft.ApplicationServer.Http;
using System.Net.Http.Headers;

namespace TaskStoreWeb.Helpers
{
    public class MessageWrapper<T> : T
    {
        public MessageWrapper() : base() { }

        // create a generic copy constructor
        public MessageWrapper(T type) 
        {
            foreach (var pi in typeof(T).GetProperties())
            {
                pi.SetValue(this, pi.GetValue(type, null), null);
            }
        }

        // add a status code field to the type
        public HttpStatusCode StatusCode { get; set; }
    }

    public class HttpResponseMessageWrapper<T> : HttpResponseMessage<MessageWrapper<T>>
    {
        public HttpResponseMessageWrapper(HttpRequestMessage msg, HttpStatusCode statusCode)
            : base(statusCode)
        {
            var winPhone = msg.Headers.UserAgent.FirstOrDefault(pi => pi.Product.Name == "TaskStore-WinPhone");
            if (winPhone != null)
            {
                MessageWrapper<T> messageWrapper = new MessageWrapper<T>() { StatusCode = statusCode };
                this.StatusCode = HttpStatusCode.OK;
                this.Content = new ObjectContent<MessageWrapper<T>>(messageWrapper);
            }
        }

        public HttpResponseMessageWrapper(HttpRequestMessage msg, MessageWrapper<T> mw, HttpStatusCode statusCode)
            : base(mw, statusCode)
        {
            var winPhone = msg.Headers.UserAgent.FirstOrDefault(pi => pi.Product.Name == "TaskStore-WinPhone");
            if (winPhone != null)
            {
                mw.StatusCode = statusCode;
                this.StatusCode = HttpStatusCode.OK;
                this.Content = new ObjectContent<MessageWrapper<T>>(mw);
            }
        }
    }
}