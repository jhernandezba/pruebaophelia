using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendFact.Entities
{
    public class Producto
    {
        public string Id { get; set; }
        public string Nombre { get; set; }
        public double Valor { get; set; }
        public double Cantidad { get; set; }
        public double Impuesto { get; set; }
        public double Stock { get; set; }
        public List<DetalleFactura> DetalleFacturas { get; set; }

    }
}
