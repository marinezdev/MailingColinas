﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRM.Models
{
    public class Subclasificacion
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int IdClasificacion { get; set; }

    }
}