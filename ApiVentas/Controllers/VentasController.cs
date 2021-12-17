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
using System.Web.Http.Cors;
using ApiVentas.Models;

namespace ApiVentas.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]

    public class VentasController : ApiController
    {

        private Sistema_VentasEntities db = new Sistema_VentasEntities();

        // GET: api/Ventas
        public IQueryable<Ventas> GetVentas()
        {
            return db.Ventas;
        }

        // GET: api/Ventas/5
        [ResponseType(typeof(Ventas))]
        public IHttpActionResult GetVentas(int id)
        {
            Ventas ventas = db.Ventas.Find(id);
            if (ventas == null)
            {
                return NotFound();
            }

            return Ok(ventas);
        }

        // PUT: api/Ventas/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutVentas(int id, Ventas ventas)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != ventas.Id_Venta)
            {
                return BadRequest();
            }

            db.Entry(ventas).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VentasExists(id))
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

        // POST: api/Ventas
        [ResponseType(typeof(Ventas))]
        public IHttpActionResult PostVentas(Ventas ventas)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Ventas.Add(ventas);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = ventas.Id_Venta }, ventas);
        }

        // DELETE: api/Ventas/5
        [ResponseType(typeof(Ventas))]
        public IHttpActionResult DeleteVentas(int id)
        {
            Ventas ventas = db.Ventas.Find(id);
            if (ventas == null)
            {
                return NotFound();
            }

            db.Ventas.Remove(ventas);
            db.SaveChanges();

            return Ok(ventas);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool VentasExists(int id)
        {
            return db.Ventas.Count(e => e.Id_Venta == id) > 0;
        }
    }
}