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
    public class FacturasController : ControllerBase
    {       

        private readonly ApplicationDbContext context;
        public FacturasController(ApplicationDbContext context)
        {
            this.context = context;
        }
        [HttpGet("Ultima")]
        public ActionResult<Factura> Get()
        {
            return context.Facturas.Last();
        }

        [HttpGet("{id}", Name = "ObtenerFactura")]
        public ActionResult<Factura> Get(string id)
        {
            var factura = context.Facturas.FirstOrDefault(x => x.Id == id);
            if (factura == null )
            {
                return NotFound();
            }
            return factura;
        }

        [HttpPost]
        public ActionResult Post([FromBody] Factura factura)
        {

            context.Facturas.Add(factura);
            context.SaveChanges();
            return new CreatedAtRouteResult("ObtenerFactura", new {id = factura.Id }, factura);
         

        }

    }
}
