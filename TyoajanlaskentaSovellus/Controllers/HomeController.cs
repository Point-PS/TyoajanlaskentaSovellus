using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using TyoajanlaskentaSovellus.Models;

namespace TyoajanlaskentaSovellus.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Henkilot()
        {
            return View();
        }

        public ActionResult HenkilotTesti()
        {
            return View();
        }

        public ActionResult HenkilotEmma()
        {
            return View();
        }

        public ActionResult HenkilotDisa()
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();
            List<Henkilot> model = entities.Henkilot.ToList();
            entities.Dispose();
            return View(model);

            public ActionResult Delete(string id)
            {
                int HenkiloId = int.Parse(id);

                scrumDatabaseEntities entities = new scrumDatabaseEntities();

                //id:n perusteella rivi kannasta-->
                bool OK = false;

                Henkilot dbItemn = (from h in entities.Henkilot
                                    where h.HenkiloId == HenkiloId
                                    select h).FirstOrDefault();

                if (dbItem != null)
                {
                    //tietokannasta poisto-->
                    entities.Henkilot.Remove(dbItem);
                    entities.SaveChanges();
                    OK = true;

                }


                entities.Dispose();
                return Json(OK, JsonRequestBehavior.AllowGet);

            }
        }
        public ActionResult HenkilotBo()
        {
            return View();
        }

        public ActionResult HenkilotHenri()
        {
            return View();
        }

        public ActionResult Henkilot2()
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();
            List<Henkilot> model = entities.Henkilot.ToList();
            entities.Dispose();
            return View(model);
        }




        public JsonResult HaeKaikkiHenkilot()
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities(); 

            var malli = (from h in entities.Henkilot
                         select new
                         {
                             HenkiloId = h.HenkiloId,
                             Etunimi = h.Etunimi,
                             Sukunimi = h.Sukunimi
                         }).ToList();

            string json = JsonConvert.SerializeObject(malli);
            entities.Dispose();

            return Json(json, JsonRequestBehavior.AllowGet);
        }



    }
}