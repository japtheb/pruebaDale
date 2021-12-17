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
    public class InventariosController : ApiController
    {
        private Sistema_VentasEntities db = new Sistema_VentasEntities();

        // GET: api/Inventarios
        public IQueryable<Inventario> GetInventario()
        {
            return db.Inventario;
        }

        // GET: api/Inventarios/5
        [ResponseType(typeof(Inventario))]
        public IHttpActionResult GetInventario(int id)
        {
            Inventario inventario = db.Inventario.Find(id);
            if (inventario == null)
            {
                return NotFound();
            }

            return Ok(inventario);
        }

        // PUT: api/Inventarios/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutInventario(int id, Inventario inventario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != inventario.Id_Inventario)
            {
                return BadRequest();
            }

            db.Entry(inventario).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InventarioExists(id))
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

        // POST: api/Inventarios
        [ResponseType(typeof(Inventario))]
        public IHttpActionResult PostInventario(Inventario inventario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Inventario.Add(inventario);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = inventario.Id_Inventario }, inventario);
        }

        // DELETE: api/Inventarios/5
        [ResponseType(typeof(Inventario))]
        public IHttpActionResult DeleteInventario(int id)
        {
            Inventario inventario = db.Inventario.Find(id);
            if (inventario == null)
            {
                return NotFound();
            }

            db.Inventario.Remove(inventario);
            db.SaveChanges();

            return Ok(inventario);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool InventarioExists(int id)
        {
            return db.Inventario.Count(e => e.Id_Inventario == id) > 0;
        }
    }
}