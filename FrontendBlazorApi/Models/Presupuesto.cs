using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization; 
using System.ComponentModel.DataAnnotations;

namespace FrontendBlazorApi.Models
{
    public class Presupuesto
    {
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public int Id { get; set; } 
        public int IdProyecto { get; set; } 

        [Column(TypeName = "decimal(15,2)")]
        public decimal MontoSolicitado { get; set; }
        
        public string Estado { get; set; } = "Pendiente";
        
        [Column(TypeName = "decimal(15,2)")]
        public decimal MontoAprobado { get; set; }

        public int PeriodoAnio { get; set; } 
        public DateTime FechaSolicitud { get; set; } = DateTime.Today;
        public DateTime FechaAprobacion { get; set; } = DateTime.Today.AddDays(7);
        public string Observaciones { get; set; } = string.Empty;

        [NotMapped]
        [JsonIgnore]
        public string ProyectoTitulo { get; set; } = string.Empty; 
        

    }
}