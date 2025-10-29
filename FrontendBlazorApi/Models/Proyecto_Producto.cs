using System.ComponentModel.DataAnnotations.Schema; 
using System.Text.Json.Serialization; 
using System.ComponentModel.DataAnnotations;

namespace FrontendBlazorApi.Models
{
   
    public class Proyecto_Producto
    {

        public int IdProyecto { get; set; } 
        public int IdProducto { get; set; } 
        public DateTime? FechaAsociacion { get; set; } 

        
        [NotMapped]
        [JsonIgnore]
        public string ProyectoTitulo { get; set; } = string.Empty; 
        
        [NotMapped]
        [JsonIgnore] 
        public string ProductoTitulo { get; set; } = string.Empty; 
    }
}