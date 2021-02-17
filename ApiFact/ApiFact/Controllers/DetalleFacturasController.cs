using BackendFact.Context;
using Microsoft.AspNetCore.Mvc;
using BackendFact.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiFact.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DetalleFacturasController : ControllerBase
    {

        private readonly ApplicationDbContext context;
        public DetalleFacturasController(ApplicationDbContext context)
        {
            this.context = context;
        }

        [HttpGet("{id}", Name = "ObtenerDetalleFactura")]
        public ActionResult<DetalleFactura> Get(string id)
        {
            var detallefactura = context.DetalleFacturas.FirstOrDefault(x => x.Id == id);
            if (detallefactura == null)
            {
                return NotFound();
            }
            return detallefactura;
        }

        [HttpPost]
        public ActionResult Post([FromBody] DetalleFactura detallefactura)
        {
            context.DetalleFacturas.Add(detallefactura);
            context.SaveChanges();
            return new CreatedAtRouteResult("ObtenerDetalleFactura", new { id = detallefactura.Id }, detallefactura);
        }


    }
}
