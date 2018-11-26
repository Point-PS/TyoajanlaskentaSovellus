using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;
using TyoajanlaskentaSovellus.Controllers;


namespace TyoajanlaskentaSovellus.Models
{
    public class IndexModelView
    {

        //public Henkilot Henkilot { get; set; }
        //public Tyot Tyot { get; set; }
        ////public List<Henkilot> Henkilot { get; set; }

        public IEnumerable<Henkilot> Henkilot { get; set; }
        public IEnumerable<Tyot> Tyot { get; set; }

        public IEnumerable<Tunnit> Tunnit { get; set; }


    }

}