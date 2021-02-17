using BackendFact.Context;
using BackendFact.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ApiFact.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController : ControllerBase
    {

        private readonly ApplicationDbContext context;
        public ProductosController(ApplicationDbContext context)
        {
            this.context = context;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Producto>> Get()
        {
            return context.Productos.ToList();
        }

        [HttpGet("{id}", Name = "ObtenerProducto")]
        public ActionResult<Producto> Get(string id)
        {
            var productos = context.Productos.FirstOrDefault(x => x.Id == id);
            if (productos == null)
            {
                return NotFound();
            }
            return productos;
        }
    }



    
}
