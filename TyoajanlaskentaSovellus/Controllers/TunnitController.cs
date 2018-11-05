using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TyoajanlaskentaSovellus.Controllers
{
    public class TunnitController : Controller
    {
        // GET: Tunnit
        public ActionResult Index()
        {
            return View();
        }
    }
}