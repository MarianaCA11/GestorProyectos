using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization; 
using System.ComponentModel.DataAnnotations;

namespace FrontendBlazorApi.Models
{
    public class Archivo
    {
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public int Id { get; set; } 
        public int IdUsuario { get; set; } 
        public string Ruta { get; set; } = string.Empty;
        public string Nombre { get; set; } = string.Empty;
        public string Tipo { get; set; } = string.Empty;
        public DateTime? Fecha { get; set; }

        [NotMapped]
        [JsonIgnore]
        public string UsuarioEmail { get; set; } = string.Empty; 
        

    }
}