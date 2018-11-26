using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace TyoajanlaskentaSovellus.ViewModels
{
    public class HenkilotModelView
    {
       public int HenkilotId { get; set; }
        public string Etunimi{ get; set; }

        public string Sukunimi { get; set; }
    }
}