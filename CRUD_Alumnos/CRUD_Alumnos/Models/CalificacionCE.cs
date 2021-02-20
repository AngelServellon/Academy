using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CRUD_Alumnos.Models
{
    public class CalificacionCE
    {
        [Required]
        [Display(Name = "Alumno/a")]
        public int id_alumno { get; set; }
        [Required]
        [Display(Name = "Materia")]
        public int id_materia { get; set; }
    }
    [MetadataType(typeof(CalificacionCE))]
    public partial class Calificacion
    {

    }
}