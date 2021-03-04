using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using CRUD_Alumnos.Models;

namespace CRUD_Alumnos.Controllers
{
    public class APIMateriaController : ApiController
    {
        private AlumnosContext db = new AlumnosContext();

        // GET: api/APIMateria
        public IQueryable<Materia> GetMateria()
        {
            return db.Materia;
        }

        // GET: api/APIMateria/5
        [ResponseType(typeof(Materia))]
        public IHttpActionResult GetMateria(int id)
        {
            Materia materia = db.Materia.Find(id);
            if (materia == null)
            {
                return NotFound();
            }

            return Ok(materia);
        }

        // POST: api/APIMateria
        [ResponseType(typeof(Materia))]
        public IHttpActionResult PostMateria(Materia materia)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Materia.Add(materia);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = materia.Id_Materia }, materia);
        }

        
    }
}