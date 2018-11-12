using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TyoajanlaskentaSovellus.Controllers
{
    public class HenkilotController : Controller
    {
        
        public ActionResult Index()
        {

            scrumDatabaseEntities entities = new scrumDatabaseEntities();
            List<Henkilot> model = entities.Henkilot.ToList();
            entities.Dispose();

            return View(model);
        }

        public JsonResult GetList()
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();

            var model = (from h in entities.Henkilot
                         select new
                         {
                             HenkiloId = h.HenkiloId,
                             Etunimi = h.Etunimi,
                             Sukunimi = h.Sukunimi,
                          
                         }).ToList();

            string json = JsonConvert.SerializeObject(model);
            entities.Dispose();

            return Json(json, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetSingleHenkilot(string id)
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();

            int HenkiloId = int.Parse(id);

            var model = (from h in entities.Henkilot
                         where h.HenkiloId == HenkiloId
                         select new
                         {
                             HenkiloId = h.HenkiloId,
                             Etunimi = h.Etunimi,
                             Sukunimi = h.Sukunimi
                             
                         }).FirstOrDefault();

            string json = JsonConvert.SerializeObject(model);
            entities.Dispose();

            return Json(json, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Update(Henkilot henk)              
        {
            scrumDatabaseEntities entities = new scrumDatabaseEntities();
            //string id = henk.HenkiloId;

            bool OK = false;

            if (henk.HenkiloId == 0)
            {
                Henkilot dbItem = new Henkilot()
                {

                    Etunimi = henk.Etunimi,
                    Sukunimi = henk.Sukunimi,
                };

                //tallennus tietokantaan
                entities.Henkilot.Add(dbItem);
                entities.SaveChanges();

                OK = true;
                entities.Dispose();
                return Json(OK);

            }
            else //päivitys
            {
                Henkilot dbItem = (from h in entities.Henkilot
                                   where h.HenkiloId == henk.HenkiloId
                                   select h).FirstOrDefault();
                if (dbItem != null)
                {
                    dbItem.Etunimi = henk.Etunimi;     
                    dbItem.Sukunimi = henk.Sukunimi;

                    //tallennus tietokantaan
                    entities.SaveChanges();

                };
                OK = true;
                entities.Dispose();
                return Json(OK, JsonRequestBehavior.AllowGet);


            }

        }

        public ActionResult Delete(string id)
        {
            int HenkiloId = int.Parse(id);

            scrumDatabaseEntities entities = new scrumDatabaseEntities();

            //etsitään id:n perusteella kannasta
            bool OK = false;

            Henkilot dbItem = (from h in entities.Henkilot
                               where h.HenkiloId == HenkiloId
                               select h).FirstOrDefault();
            if (dbItem != null)
            {
                //tietokannasta poisto
                entities.Henkilot.Remove(dbItem);
                entities.SaveChanges();
                OK = true;

            }

            entities.Dispose();
            return Json(OK, JsonRequestBehavior.AllowGet);

        }

    }
}