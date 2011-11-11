using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BuiltSteadyWeb.Models;

namespace BuiltSteadyWeb.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Email model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to subscribe the user
                EmailStore store = EmailStore.Current;
                store.Emails.Add(new Email() { EmailAddress = model.EmailAddress, Date = DateTime.Now });
                int rows = store.SaveChanges();

                // set the email of the subscriber in the returned view
                ViewBag.Email = model.EmailAddress;
            }
            else
            {
                // set the invalid email in the returned view, which will get prepended to the validation error
                ViewBag.InvalidEmail = model.EmailAddress;
            }
            
            return View();
        }       

        public ActionResult About()
        {
            return View();
        }
    }
}
