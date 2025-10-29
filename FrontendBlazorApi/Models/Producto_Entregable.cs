using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization; 
using System.ComponentModel.DataAnnotations;

namespace FrontendBlazorApi.Models
{
    
    public class Producto_Entregable
    {

        public int IdProducto { get; set; } 
        public int IdEntregable { get; set; } 
        public DateTime? FechaAsociacion { get; set; } 

        
        [NotMapped]
        [JsonIgnore]
        public string EntregableTitulo { get; set; } = string.Empty; 
        
        [NotMapped]
        [JsonIgnore] 
        public string ProductoTitulo { get; set; } = string.Empty; 
    }
}