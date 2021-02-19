using CRUD_Alumnos.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUD_Alumnos.Controllers
{
    public class DocenteController : Controller
    {
        // GET: Docente
        public ActionResult Index()
        {
            AlumnosContext db = new AlumnosContext();

            return View(db.Docente.ToList());
        }

        //Agregar docentes
        public ActionResult Agregardocente()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Agregardocente(Docente d)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            try
            {
                using (var db = new AlumnosContext())
                {
                    db.Docente.Add(d);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", "Error al agregar el alumno - " + e.Message);
                return View();
            }
            
        }

        //Editar docentes
        public ActionResult Editardocente(int id)
        {
            try
            {
                using (var db = new AlumnosContext())
                {
                    Docente doc = db.Docente.Find(id);
                    return View(doc);
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", "Error - " + e.Message);
                return View();
            }

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Editardocente(Docente d)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            try
            {
                using (var db = new AlumnosContext())
                {
                    Docente doc = db.Docente.Find(d.Id_Docente);
                    doc.Nombres = d.Nombres;
                    doc.Apellidos = d.Apellidos;
                    doc.Edad = d.Edad;
                    doc.Sexo = d.Sexo;

                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", "Error - " + e.Message);
                return View();
            }
        }

        //Detalles del docente
        public ActionResult Detallesdocente(int id)
        {
            using (var db = new AlumnosContext())
            {
                Docente doc = db.Docente.Find(id);
                return View(doc);
            }
        }

        //Eliminar docente
        public ActionResult Eliminardocente(int id)
        {
            using (var db = new AlumnosContext())
            {
                Docente doc = db.Docente.Find(id);
                db.Docente.Remove(doc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }
    }
}