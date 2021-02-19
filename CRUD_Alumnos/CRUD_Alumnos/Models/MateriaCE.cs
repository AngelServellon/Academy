using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CRUD_Alumnos.Models
{
    public class MateriaCE
    {
        [Required]
        public string Nombre { get; set; }
        [Required]
        [Display(Name = "Docente")]
        public int id_docente { get; set; }
    }
    [MetadataType(typeof(MateriaCE))]
    public partial class Materia
    {

    }

}