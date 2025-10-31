using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.ComponentModel.DataAnnotations;
 
namespace FrontendBlazorApi.Models
{
   
    public class Archivo_Entregable
    {
 
        public int IdArchivo { get; set; }
        public int IdEntregable { get; set; }
 
       
        [NotMapped]
        [JsonIgnore]
        public string ArchivoNombre { get; set; } = string.Empty;
       
        [NotMapped]
        [JsonIgnore]
        public string EntregableTitulo { get; set; } = string.Empty;
    }
}