﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.ApplicationServer.Http.Description;
using Microsoft.ApplicationServer.Http.Activation;
using System.Data.Entity;
using TaskStoreWeb.Models;
using TaskStoreWeb.Resources;

namespace TaskStoreWebMvc3
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }

        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            // map the MVC UI route (note the route constraint as the last controller passed in)
            // http://codebetter.com/howarddierking/2011/05/09/using-serviceroute-with-existing-mvc-routes/
            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional }, // Parameter defaults
//                new { controller = new NotInValuesConstraint(new[] { "constants", "listtypes", "tags", "tasklists", "users" }) }
                new { controller = new NotInValuesConstraint(new[] { "constants", "listtypes", "speech", "tags", "tasks", "tasklists", "users" }) }
            );

            //HttpServiceHostFactory httpServiceHostFactory = new HttpServiceHostFactory();
            //httpServiceHostFactory.Configuration = new HttpConfiguration
            //{
            //    TransferMode = TransferMode.Streamed
            //};           
 
            // map the WCF WebApi service routes
            RouteTable.Routes.MapServiceRoute<ConstantsResource>("constants", null);
            RouteTable.Routes.MapServiceRoute<ListTypeResource>("listtypes", null);
            RouteTable.Routes.MapServiceRoute<SpeechResource>("speech", null);
            RouteTable.Routes.MapServiceRoute<TagResource>("tags", null);
            RouteTable.Routes.MapServiceRoute<TaskResource>("tasks", null);
            RouteTable.Routes.MapServiceRoute<TaskListResource>("tasklists", null);
            RouteTable.Routes.MapServiceRoute<UserResource>("users", null);
        }

        public class NotInValuesConstraint : IRouteConstraint
        {
            public NotInValuesConstraint(params string[] values) { _values = values; }
            private string[] _values;
            public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values, RouteDirection routeDirection)
            {
                string value = values[parameterName].ToString();
                return !_values.Contains(value, StringComparer.CurrentCultureIgnoreCase);
            }
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RegisterGlobalFilters(GlobalFilters.Filters);
            RegisterRoutes(RouteTable.Routes);
        }
    }
}