using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CRUD_Alumnos.Models
{
    public class DocenteCE
    {
        [Required]
        public string Nombres { get; set; }
        [Required]
        public string Apellidos { get; set; }
        [Required]
        public int Edad { get; set; }
        [Required]
        public string Sexo { get; set; }
    }
    [MetadataType(typeof(DocenteCE))]
    public partial class Docente
    {
        [JsonIgnore]
        public string NombreCompleto { get { return Nombres + " " + Apellidos; } }
    }

}