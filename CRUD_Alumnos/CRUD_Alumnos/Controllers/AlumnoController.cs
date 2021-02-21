using CRUD_Alumnos.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUD_Alumnos.Controllers
{
    public class AlumnoController : Controller
    {
        // GET: Alumno
        public ActionResult Index()
        {
            try
            {
                int edad = 18;
                string sql = @"
                    select a.id, a.Nombre, a.Apellidos, a.Edad, a.Sexo, a.FechaRegistr, c.Nombre as NombreCiudad 
                    from Alumno a
                    inner join Ciudad c on a.CodCiudad = c.id";

                    //where a.Edad > @edadAlumno"; //as Ciudad se pone NombreCiudad porque asi esta en Alumno.cs
                using (var db = new AlumnosContext())
                {
                    //var data = from a in db.Alumno
                    //           join c in db.Ciudad on a.CodCiudad equals c.id
                    //           select new AlumnoCE()
                    //           {
                    //               id = a.id,
                    //               Nombre = a.Nombre,
                    //               Apellidos = a.Apellidos,
                    //               Edad = a.Edad,
                    //               NombreCiudad = c.Nombre,
                    //               FechaRegistr = a.FechaRegistr
                    //           };

                    //List<Alumno> lista = db.Alumno.Where(a => a.Edad > 18).ToList(); /*no quitar comentado*/

                    //return View(data.ToList());

                    return View(db.Database.SqlQuery<AlumnoCE>(sql/*, new SqlParameter("@edadAlumno", edad)*/).ToList());
                }
            }
            catch (Exception)
            {

                throw;
            }
            
        }
        public ActionResult Agregar()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Agregar(Alumno a)
        {
            if (!ModelState.IsValid)
                return View();
            try
            {
                using (var db = new AlumnosContext())
                {
                    a.FechaRegistr = DateTime.Now;

                    db.Alumno.Add(a);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Error al registrar Alumno - " + ex.Message);
                return View();
            }
            
        }
        public ActionResult Agregar2()
        {
            return View();
        }
        public ActionResult ListaCiudades()
        {
            using(var db = new AlumnosContext())
            {
                return PartialView(db.Ciudad.ToList());
            }
        }
        //Editar
        public ActionResult Editar(int id)
        {
            try
            {
                using (var db = new AlumnosContext())
                {
                    //Alumno al = db.Alumno.Where(a => a.id == id).FirstOrDefault();
                    Alumno alu = db.Alumno.Find(id);
                    return View(alu);
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editar(Alumno a)
        {
            if (!ModelState.IsValid)
                return View();
            try
            {
                using (var db = new AlumnosContext())
                {
                    Alumno al = db.Alumno.Find(a.id);
                    al.Nombre = a.Nombre;
                    al.Apellidos = a.Apellidos;
                    al.Edad = a.Edad;
                    al.Sexo = a.Sexo;
                    al.CodCiudad = a.CodCiudad;
                    db.SaveChanges();

                    return RedirectToAction("Index");
                }
                
            }
            catch (Exception ex)
            {

                throw;
            }
            
        }
        //Detalles
        public ActionResult Detallesalumno(int id)
        {
            using (var db = new AlumnosContext())
            {
                Alumno alu = db.Alumno.Find(id);
                return View(alu);
            }

        }
        //Eliminar
        public ActionResult EliminarAlumno(int id)
        {
            using (var db = new AlumnosContext())
            {
                Alumno alu = db.Alumno.Find(id);
                db.Alumno.Remove(alu);
                db.SaveChanges();
                return RedirectToAction("Index");

            }
        }
        //Para que aprezca el nombre de la ciudad en la vista Index
        public static string NombreCiudad(int CodCiudad)
        {
            using (var db = new AlumnosContext())
            {
                return db.Ciudad.Find(CodCiudad).Nombre;
            }
        }

        //Mostar las materias de cada alumno--------------------------------------------------------------
        public ActionResult MateriaAlumno()
        {
            var sql = @"
                    select distinct a.Nombre, a.Apellidos, m.Nombre as Asignatura, c.Nota1, c.Nota2, c.Nota3, c.Nota4 from Alumno a 
                    inner join Calificacion c 
                    on a.id = c.id_alumno
                    inner join Materia m 
                    on c.id_materia = m.Id_Materia";
            using (var db = new AlumnosContext())
            {
                return View(db.Database.SqlQuery<CalificacionCE>(sql).ToList());
            }
        }
    }
}