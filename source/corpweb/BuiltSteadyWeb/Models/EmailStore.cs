using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace BuiltSteadyWeb.Models
{
    public class EmailStore : DbContext
    {
        // the default constructor loads the Connection appsetting (from web.config) 
        // which is the alias of the correct connection string (also from web.config)
        public EmailStore() : base(WebConfigurationManager.AppSettings["Connection"]) { }

        public EmailStore(string connstr) : base(connstr) { }

        private static EmailStore current;
        public static EmailStore Current
        {
            get
            {
                // only return a new context if one hasn't already been created
                if (current == null)
                {
                    current = new EmailStore();
                }
                return current;
            }
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }

        // email table
        public DbSet<Email> Emails { get; set; }
    }
}