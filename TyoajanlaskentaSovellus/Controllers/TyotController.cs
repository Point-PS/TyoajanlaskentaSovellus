using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using TyoajanlaskentaSovellus;
using TyoajanlaskentaSovellus.Models;

namespace TyoajanlaskentaSovellus.Controllers
{
    public class TyotController : Controller
    { 

         public JsonResult GetSingleTyo(int id)
    {

        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();
            var model = (from t in entities.Tyot
                         where t.TyoId == id
                         select new
                         {
                             TyoId = t.TyoId,
                             Tyotunniste = t.Tyotunniste,
                             Kuvaus = t.Kuvaus,

                         }).FirstOrDefault();

            string json = JsonConvert.SerializeObject(model);
            entities.Dispose();

            return Json(json, JsonRequestBehavior.AllowGet);
        }
    }
    
        public ActionResult Index()
        {
            return View();
        }
        
        public JsonResult HaeKaikkiTyot()
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();

            var malli = (from t in entities.Tyot
                         select new
                         {
                             TyoId = t.TyoId,
                             Tyotunniste = t.Tyotunniste,
                             Kuvaus = t.Kuvaus
                         }).ToList();

            string json = JsonConvert.SerializeObject(malli);
            entities.Dispose();

            return Json(json, JsonRequestBehavior.AllowGet);
        }
    }
}




