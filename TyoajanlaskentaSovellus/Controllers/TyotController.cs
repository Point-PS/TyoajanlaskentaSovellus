using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TyoajanlaskentaSovellus.Controllers
{
    public class TyotController : Controller
    {
        // GET: Tyot
        public ActionResult Index()
        {
            return View();
        }
    }
}