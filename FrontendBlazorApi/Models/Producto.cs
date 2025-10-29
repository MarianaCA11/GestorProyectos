using System.Text.Json.Serialization;
using System.ComponentModel.DataAnnotations.Schema; 
using System.ComponentModel.DataAnnotations; 

namespace FrontendBlazorApi.Models
{
        
    public class Producto
    {
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public int Id { get; set; }
        public int IdTipoProducto { get; set; }        
        public string Codigo { get; set; } = string.Empty;
        public string Titulo { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public DateTime? FechaInicio { get; set; }
        public DateTime? FechaFinPrevista { get; set; }
        public DateTime? FechaModificacion { get; set; }
        public DateTime? FechaFinalizacion { get; set; }
        public string RutaLogo { get; set; } = string.Empty;

        [NotMapped] 
        [JsonIgnore] 
        public string? TipoProductoNombre { get; set; }
    }

}