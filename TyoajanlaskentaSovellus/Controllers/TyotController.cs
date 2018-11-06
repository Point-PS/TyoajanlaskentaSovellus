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
       
    public ActionResult Update(Tyot tyot)
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();

            bool OK = false;

            // onko kyseessä muokkaus vai uuden lisääminen?
            if (tyot.TyoId == 0)
            {
                // kyseessä on uuden asiakkaan lisääminen, kopioidaan kentät
                Tyot dbItem = new Tyot()
                {

                    Tyotunniste = tyot.Tyotunniste,
                    Kuvaus = tyot.Kuvaus,


                };

                // tallennus tietokantaan
                entities.Tyot.Add(dbItem);
                entities.SaveChanges();
                OK = true;
            }
            else
            {
                // muokkaus, haetaan id:n perusteella riviä tietokannasta
                Tyot dbItem = (from t in entities.Tyot
                               where t.TyoId == tyot.TyoId
                               select t).FirstOrDefault();
                if (dbItem != null)
                {
                    dbItem.Tyotunniste = tyot.Tyotunniste;
                    dbItem.Kuvaus = tyot.Kuvaus;

                    // tallennus tietokantaan
                    entities.SaveChanges();
                    OK = true;
                }
            }
            entities.Dispose();

            return Json(OK, JsonRequestBehavior.AllowGet);
        }
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
        public ActionResult Delete(int id)
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();

            // etsitään id:n perusteella asiakasrivi kannasta
            bool ok = false;
            Tyot dbItem = (from t in entities.Tyot
                           where t.TyoId == id
                           select t).FirstOrDefault();
            if (dbItem != null)
            {
                // tietokannasta poisto
                entities.Tyot.Remove(dbItem);
                entities.SaveChanges();
                ok = true;
            }
            entities.Dispose();

            return Json(ok, JsonRequestBehavior.AllowGet);
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


    



