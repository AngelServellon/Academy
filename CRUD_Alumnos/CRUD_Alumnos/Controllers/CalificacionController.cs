using CRUD_Alumnos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUD_Alumnos.Controllers
{
    public class CalificacionController : Controller
    {
        // GET: Calificacion
        public ActionResult Index()
        {
            AlumnosContext db = new AlumnosContext();
            return View(db.Calificacion.ToList());
        }

        //AGREGAR calificaciones-------------------------------------------
        public ActionResult Agregarcalificacion()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Agregarcalificacion(Calificacion c)
        {
            if (!ModelState.IsValid)
                return View();
            try
            {
                using (var db = new AlumnosContext())
                {
                    db.Calificacion.Add(c);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Error - " + ex.Message);
                return View();
            }
        }
        //Listar los alumnos registrados
        public ActionResult ListarAlumnos()
        {
            using (var db = new AlumnosContext())
            {
                return PartialView(db.Alumno.ToList());
            }
        }
        //Listar las materias registradas
        public ActionResult ListarMaterias()
        {
            using (var db = new AlumnosContext())
            {
                return PartialView(db.Materia.ToList());
            }
        }

        //EDITAR calificacion---------------------------------------
        public ActionResult Editarcalificacion(int id)
        {
            try
            {
                using (var db = new AlumnosContext())
                {
                    Calificacion cal = db.Calificacion.Find(id);
                    return View(cal);
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Error - " + ex.Message);
                return View();
            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editarcalificacion(Calificacion c)
        {
            try
            {
                using (var db = new AlumnosContext())
                {
                    Calificacion cal = db.Calificacion.Find(c.Id_Calificacion);
                    cal.id_alumno = c.id_alumno;
                    cal.id_materia = c.id_materia;
                    cal.Nota1 = c.Nota1;
                    cal.Nota2 = c.Nota2;
                    cal.Nota3 = c.Nota3;
                    cal.Nota4 = c.Nota4;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", "Error - " + ex.Message);
                return View();
            }
        }

        //DETALLES de calificacion------------------------------------------
        public ActionResult Detllescalificacion(int id)
        {
            using (var db = new AlumnosContext())
            {
                Calificacion cal = db.Calificacion.Find(id);
                return View(cal);
            }
        }
        //Mostar el nombre completo del alumno
        public static string NombreAlumno(int id_alumno)
        {
            using (var db = new AlumnosContext())
            {
                return db.Alumno.Find(id_alumno).NombreCompleto;
            }
        }
        //Mostar el nombre de la materia
        public static string NombreMateria(int id_materia)
        {
            using (var db = new AlumnosContext())
            {
                return db.Materia.Find(id_materia).Nombre;
            }
        }

        //ELIMINAR una calificacion
        public ActionResult Eliminarcalificacion(int id)
        {
            using (var db = new AlumnosContext())
            {
                Calificacion cal = db.Calificacion.Find(id);
                db.Calificacion.Remove(cal);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }

        
    }
}