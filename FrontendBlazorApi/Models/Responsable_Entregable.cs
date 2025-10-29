using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization; 
using System.ComponentModel.DataAnnotations;

namespace FrontendBlazorApi.Models
{
    
    public class Responsable_Entregable
    {

        public int IdResponsable { get; set; } 
        public int IdEntregable { get; set; } 
        public DateTime? FechaAsociacion { get; set; } 

        
        [NotMapped]
        [JsonIgnore]
        public string EntregableTitulo { get; set; } = string.Empty; 
        
        [NotMapped]
        [JsonIgnore] 
        public string ResponsableNombre { get; set; } = string.Empty; 
    }
}