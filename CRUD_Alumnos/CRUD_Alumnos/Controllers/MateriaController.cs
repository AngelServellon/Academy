using CRUD_Alumnos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUD_Alumnos.Controllers
{
    public class MateriaController : Controller
    {
        // GET: Materia
        public ActionResult Index()
        {
            AlumnosContext db = new AlumnosContext();
            return View(db.Materia.ToList());
        }

        //Agregar materia
        public ActionResult Agregarmateria()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Agregarmateria(Materia m)
        {
            if (!ModelState.IsValid)
                return View();
            try
            {
                using (var db = new AlumnosContext())
                {
                    db.Materia.Add(m);
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
        //Listar los docentes para las secciones Agregar y Editar
        public ActionResult ListaDocentes()
        {
            using (var db = new AlumnosContext())
            {
                return PartialView(db.Docente.ToList());
            }
        }
        //Editar de la materia
        public ActionResult Editarmateria(int id)
        {
            try
            {
                using (var db = new AlumnosContext())
                {
                    Materia mat = db.Materia.Find(id);
                    return View(mat);
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
        public ActionResult Editarmateria(Materia m)
        {
            if (!ModelState.IsValid)
                return View();
            try
            {
                using (var db = new AlumnosContext())
                {
                    Materia mat = db.Materia.Find(m.Id_Materia);
                    mat.Nombre = m.Nombre;
                    mat.id_docente = m.id_docente;
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

        //Detalles de la materia
        public ActionResult Detallesmateria(int id)
        {
            using (var db= new AlumnosContext())
            {
                Materia mat = db.Materia.Find(id);
                return View(mat);
            }
        }
        //Mostar el nombre del docente en los detalles de la materia
        public static string NombreDocente(int id_docente)
        {
            using (var db = new AlumnosContext())
            {
                return db.Docente.Find(id_docente).NombreCompleto;
            }
        }

        //Eliminar una materia
        public ActionResult Eliminarmateria(int id)
        {
            using (var db = new AlumnosContext())
            {
                Materia mat = db.Materia.Find(id);
                db.Materia.Remove(mat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }
    }
}