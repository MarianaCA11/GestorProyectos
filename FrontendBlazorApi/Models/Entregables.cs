using System.Text.Json.Serialization;

namespace FrontendBlazorApi.Models
{
    public class Entregable
    {
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public int Id { get; set; } 
        public string Codigo { get; set; } = string.Empty;
        public string Titulo { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public DateTime FechaInicio { get; set; }  = DateTime.Today;
        public DateTime FechaFinPrevista { get; set; } = DateTime.Today.AddDays(7);
        public DateTime? FechaModificacion { get; set; }
        public DateTime? FechaFinalizacion { get; set; } 

    }
}