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
using ApiVentas.Models;
using System.Web.Http.Cors;

namespace ApiVentas.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class Tipos_DocumentoController : ApiController
    {
        private Sistema_VentasEntities db = new Sistema_VentasEntities();

        // GET: api/Tipos_Documento
        public IQueryable<Tipos_Documento> GetTipos_Documento()
        {
            return db.Tipos_Documento;
        }

        // GET: api/Tipos_Documento/5
        [ResponseType(typeof(Tipos_Documento))]
        public IHttpActionResult GetTipos_Documento(int id)
        {
            Tipos_Documento tipos_Documento = db.Tipos_Documento.Find(id);
            if (tipos_Documento == null)
            {
                return NotFound();
            }

            return Ok(tipos_Documento);
        }

        // PUT: api/Tipos_Documento/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTipos_Documento(int id, Tipos_Documento tipos_Documento)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tipos_Documento.Id)
            {
                return BadRequest();
            }

            db.Entry(tipos_Documento).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Tipos_DocumentoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Tipos_Documento
        [ResponseType(typeof(Tipos_Documento))]
        public IHttpActionResult PostTipos_Documento(Tipos_Documento tipos_Documento)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Tipos_Documento.Add(tipos_Documento);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tipos_Documento.Id }, tipos_Documento);
        }

        // DELETE: api/Tipos_Documento/5
        [ResponseType(typeof(Tipos_Documento))]
        public IHttpActionResult DeleteTipos_Documento(int id)
        {
            Tipos_Documento tipos_Documento = db.Tipos_Documento.Find(id);
            if (tipos_Documento == null)
            {
                return NotFound();
            }

            db.Tipos_Documento.Remove(tipos_Documento);
            db.SaveChanges();

            return Ok(tipos_Documento);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Tipos_DocumentoExists(int id)
        {
            return db.Tipos_Documento.Count(e => e.Id == id) > 0;
        }
    }
}