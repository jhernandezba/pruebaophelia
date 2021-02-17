using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendFact.Entities
{
    public class DetalleFactura
    {
        public string Id { get; set; }
        public double Cantidad { get; set; }
        public double Valor_unitario { get; set; }
        public double Valor_Total { get; set; }
        public double Impuesto { get; set; }
        public string Id_factura { get; set; }
        public Factura Factura { get; set; }
        public string Id_producto { get; set; }
        public Producto Producto { get; set; }
    }
}
