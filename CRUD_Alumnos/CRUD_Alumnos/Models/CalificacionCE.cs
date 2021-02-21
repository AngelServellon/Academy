using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CRUD_Alumnos.Models
{
    public class CalificacionCE
    {
        public int Id_Calificacion { get; set; }
        public double Nota1 { get; set; }
        public double Nota2 { get; set; }
        public double Nota3 { get; set; }
        public double Nota4 { get; set; }
        [Required]
        [Display(Name = "Alumno/a")]
        public int id_alumno { get; set; }
        [Required]
        [Display(Name = "Materia")]
        public int id_materia { get; set; }

        //Campos extra
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string NombreCompleto { get { return Nombre + " " + Apellidos; } }
        public string Asignatura { get; set; }
    }
    [MetadataType(typeof(CalificacionCE))]
    public partial class Calificacion
    {
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string NombreCompleto { get { return Nombre + " " + Apellidos; } }
        public string Asignatura { get; set; }
    }
}