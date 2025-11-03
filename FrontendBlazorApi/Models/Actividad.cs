using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization; 
using System.ComponentModel.DataAnnotations;

namespace FrontendBlazorApi.Models
{
    public class Actividad
    {
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public int Id { get; set; } 
        public int IdEntregable { get; set; } 
        public string Titulo { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public DateTime FechaInicio { get; set; }  = DateTime.Today;
        public DateTime FechaFinPrevista { get; set; } = DateTime.Today.AddDays(7);
        public DateTime? FechaModificacion { get; set; }
        public DateTime? FechaFinalizacion { get; set; } 
        public int Prioridad { get; set; } 
        public int PorcentajeAvance { get; set; }

        [NotMapped]
        [JsonIgnore]
        public string EntregableTitulo { get; set; } = string.Empty; 
        

    }
}