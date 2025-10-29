using System.ComponentModel.DataAnnotations.Schema; // La que generaba advertencia
using System.Text.Json.Serialization; // La que generaba advertencia
using System.ComponentModel.DataAnnotations;

namespace FrontendBlazorApi.Models
{
    // 2. CORREGIR EL NOMBRE DE LA CLASE: De 'Estado' a 'Estado_Proyecto'
    public class Estado_Proyecto
    {

        public int IdProyecto { get; set; } 
        public int IdEstado { get; set; } 


        
        [NotMapped]
        [JsonIgnore]
        public string Titulo { get; set; } = string.Empty; 
        
        [NotMapped]
        [JsonIgnore] 
        public string Nombre { get; set; } = string.Empty; 
    }
}