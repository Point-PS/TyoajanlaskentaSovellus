using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TyoajanlaskentaSovellus.Controllers
{
    public class RaporttiController : Controller
    {
        // GET: Raportti
        public ActionResult Index()
        {
            return View();
        }
    }
}