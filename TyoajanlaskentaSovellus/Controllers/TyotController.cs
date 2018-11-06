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

       /* public JsonResult GetSingleTyo(int id)
        {

            {
                scrumDatabaseEntities entities = new scrumDatabaseEntities();
                var model = (from h in entities.Henkilot
                             where h.HenkiloId == id
                             select new
                             {
                                 HenkiloId = h.HenkiloId,
                                 Etunimi = h.Etunimi,
                                 Sukunimi = h.Sukunimi,

                             }).FirstOrDefault();

                string json = JsonConvert.SerializeObject(model);
                entities.Dispose();

                return Json(json, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Update(Henkilot henk)
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();

            bool OK = false;

            // onko kyseessä muokkaus vai uuden lisääminen?
            if (henk.HenkiloId == 0)
            {
                // kyseessä on uuden asiakkaan lisääminen, kopioidaan kentät
                Henkilot dbItem = new Henkilot()
                {

                    Etunimi = henk.Etunimi,
                    Sukunimi = henk.Sukunimi,


                };

                // tallennus tietokantaan
                entities.Henkilot.Add(dbItem);
                entities.SaveChanges();
                OK = true;
            }
            else
            {
                // muokkaus, haetaan id:n perusteella riviä tietokannasta
                Henkilot dbItem = (from h in entities.Henkilot
                                   where h.HenkiloId == henk.HenkiloId
                                   select h).FirstOrDefault();
                if (dbItem != null)
                {
                    dbItem.Etunimi = henk.Etunimi;
                    dbItem.Sukunimi = henk.Sukunimi;

                    // tallennus tietokantaan
                    entities.SaveChanges();
                    OK = true;
                }
            }
            entities.Dispose();

            return Json(OK, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Delete(int id)
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();

            // etsitään id:n perusteella asiakasrivi kannasta
            bool ok = false;
            Henkilot dbItem = (from h in entities.Henkilot
                               where h.HenkiloId == id
                               select h).FirstOrDefault();
            if (dbItem != null)
            {
                // tietokannasta poisto
                entities.Henkilot.Remove(dbItem);
                entities.SaveChanges();
                ok = true;
            }
            entities.Dispose();

            return Json(ok, JsonRequestBehavior.AllowGet);
        }
    }
}
*/
