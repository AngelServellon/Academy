using CRUD_Alumnos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace CRUD_Alumnos.Controllers
{
    public class APIAlumnoController : ApiController
    {
        private AlumnosContext dbContext = new AlumnosContext();
        
        //Ver los registros
        [HttpGet]
        public IEnumerable<Alumno> Get()
        {
             return dbContext.Alumno;
            
        }
        //Ver solo un registro
        [HttpGet]
        [ResponseType(typeof(Alumno))]
        public Alumno Get(int id)
        {
            return dbContext.Alumno.FirstOrDefault(e => e.id == id);
            
        }

        //Agregar nuevos registros
        [HttpPost]
        public IHttpActionResult AgregaAlumno([FromBody]Alumno alu)
        {
            if (ModelState.IsValid)
            {
                dbContext.Alumno.Add(alu);
                dbContext.SaveChanges();
                return Ok(alu);
            }
            else
            {
                return BadRequest();
            }
        }

        

    }
}

    
