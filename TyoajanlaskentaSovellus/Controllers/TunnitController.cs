using Newtonsoft.Json;
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
        public JsonResult HaeKaikkiTunnit()
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();

            var malli = (from h in entities.Tunnit
                         select new
                         {
                             TuntiId = h.TuntiId,
                             HenkiloId = h.HenkiloId,
                             TyoId = h.TyoId,
                             Tuntimaara = h.Tuntimaara,
                         }).ToList();

            string json = JsonConvert.SerializeObject(malli);
            entities.Dispose();

            return Json(json, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Update(Tunnit tunnit)
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();

            bool OK = false;

            // onko kyseessä muokkaus vai uuden lisääminen?
            if (tunnit.TuntiId == 0)
            {
                // kyseessä on uuden tunnin lisääminen, kopioidaan kentät
                Tunnit dbItem = new Tunnit()
                {
                    HenkiloId = tunnit.HenkiloId,
                    TyoId = tunnit.TyoId,
                    Tuntimaara = tunnit.Tuntimaara,
                };

                // tallennus tietokantaan
                entities.Tunnit.Add(dbItem);
                entities.SaveChanges();
                OK = true;
            }
            else
            {
                // muokkaus, haetaan id:n perusteella riviä tietokannasta
                Tunnit dbItem = (from h in entities.Tunnit
                                 where h.TuntiId == tunnit.TuntiId
                                 select h).FirstOrDefault();
                if (dbItem != null)
                {
                    dbItem.Tuntimaara = tunnit.Tuntimaara;

                    // tallennus tietokantaan
                    entities.SaveChanges();
                    OK = true;
                }
            }
            entities.Dispose();

            return Json(OK, JsonRequestBehavior.AllowGet);
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
            Tunnit dbItem = (from h in entities.Tunnit
                             where h.TuntiId == id
                             select h).FirstOrDefault();
            if (dbItem != null)
            {
                // tietokannasta poisto
                entities.Tunnit.Remove(dbItem);
                entities.SaveChanges();
                ok = true;
            }
            entities.Dispose();

            return Json(ok, JsonRequestBehavior.AllowGet);
        }

 
        public JsonResult GetSingleTunti(int id)
        {

            {
                scrumDatabaseEntities entities = new scrumDatabaseEntities();

                var malli = (from h in entities.Tunnit
                             where h.TuntiId == id
                             select new
                             {
                                 TuntiId = h.TuntiId,
                                 HenkiloId = h.HenkiloId,
                                 TyoId = h.TyoId,
                                 Tuntimaara = h.Tuntimaara,

                             }).FirstOrDefault();

                string json = JsonConvert.SerializeObject(malli);
                entities.Dispose();

                return Json(json, JsonRequestBehavior.AllowGet);
            }
        }
    }
}