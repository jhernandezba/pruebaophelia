using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendFact.Entities
{
    public class Factura
    {

        public string Id { get; set; }        
        public DateTime Fecha { get; set; }
        public double Subtotal { get; set; }
        public double Total { get; set; }
        public double Impuesto { get; set; }
        public string Id_Cliente { get; set; }
        public Cliente Cliente { get; set; }
        public List<DetalleFactura> DetalleFacturas { get; set; }
    }
}
