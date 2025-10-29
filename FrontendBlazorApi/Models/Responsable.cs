using System.Text.Json.Serialization;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations; 

namespace FrontendBlazorApi.Models
{
    public class Responsable
    {
        // Usamos [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)] 
        // para que no se envíe el 0 en la creación (Id autoincremental)
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)] 
        public int Id { get; set; }
        
        [Required]
        public int IdTipoResponsable { get; set; }
        
        [Required]
        public int IdUsuario { get; set; }
        
        [Required]
        public string Nombre { get; set; } = string.Empty;

        
        [NotMapped]
        [JsonIgnore]
        public string TipoResponsableTitulo { get; set; } = string.Empty;
        
        [NotMapped]
        [JsonIgnore] 
        public string UsuarioEmail { get; set; } = string.Empty;
    }
}