using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BackendFact.Entities
{
    public class Cliente
    {
        public string Id { get; set; }
        public string Nombre { get; set; }
        public DateTime Fecha_nacimiento { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string correo { get; set; }
        public List<Factura> Facturas { get; set; }

    }
}
