﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRM.Models.Models
{
    /// <summary>
    /// Modelo para todo lo que tiene que ver con el usuario
    /// </summary>
    public class UsuariosRoles
    {
        public Clasificacion Clasificacion { get; set; }
        public ClassSubClassEtiquetas ClassSubClassEtiquetas { get; set; }
        public Configuracion Configuracion { get; set; }
        public Usuarios Usuarios { get; set; }
        public Roles Roles { get; set; }
        public RolesUsuarios RolesUsuarios { get; set; }
        public Subclasificacion SubClasificacion { get; set; }
        public UDN UDN { get; set; }
        

        public UsuariosRoles()
        {
            Clasificacion = new Clasificacion();
            ClassSubClassEtiquetas = new ClassSubClassEtiquetas();
            Configuracion = new Configuracion();
            Usuarios = new Usuarios();
            Roles = new Roles();
            RolesUsuarios = new RolesUsuarios();
            SubClasificacion = new Subclasificacion();
            UDN = new UDN();
        }
    }
}