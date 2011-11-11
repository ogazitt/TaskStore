using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;
using Microsoft.Web.Mvc;

namespace BuiltSteadyWeb.Models
{
    public class Email
    {
        public int ID { get; set; }
        [Required, EmailAddress]
        public string EmailAddress { get; set; }
        public DateTime Date { get; set; }
    }
}
