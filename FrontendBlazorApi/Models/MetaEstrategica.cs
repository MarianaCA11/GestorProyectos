using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using System.ComponentModel.DataAnnotations;
 
namespace FrontendBlazorApi.Models
{
    public class MetaEstrategica
    {
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public int Id { get; set; }
        public int IdObjetivo{ get; set; }
        public string Titulo { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
 
        [NotMapped]
        [JsonIgnore]
        public string ObjetivoTitulo { get; set; } = string.Empty;
       
 
    }
}