using CRUD_Alumnos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CRUD_Alumnos.Controllers
{
    public class APIDocenteController : ApiController
    {
        private AlumnosContext dbContext = new AlumnosContext();

        // GET: api/APIDocente
        [HttpGet]
        public IEnumerable<Docente> Get()
        {
            return dbContext.Docente;
        }

        // GET: api/APIDocente/5
        [HttpGet]
        public Docente Get(int id)
        {
            return dbContext.Docente.FirstOrDefault(e => e.Id_Docente == id);
        }

        // POST: api/APIDocente
        [HttpPost]
        public IHttpActionResult Post([FromBody]Docente doc)
        {
            if (ModelState.IsValid)
            {
                dbContext.Docente.Add(doc);
                dbContext.SaveChanges();
                return Ok(doc);
            }
            else
            {
                return BadRequest();
            }
        }

    }
}
