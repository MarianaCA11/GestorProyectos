using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization; 
using System.ComponentModel.DataAnnotations;

namespace FrontendBlazorApi.Models
{
    public class Meta_Proyecto
    {
        public int IdMeta { get; set; } 
        public int IdProyecto{ get; set; } 
        public DateTime? FechaAsociacion { get; set; }
        
        [NotMapped]
        [JsonIgnore]
        public string MetaTitulo { get; set; } = string.Empty; 
        
        [NotMapped]
        [JsonIgnore]
        public string ProyectoTitulo { get; set; } = string.Empty; 

    }
}