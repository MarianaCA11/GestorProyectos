using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization; 
using System.ComponentModel.DataAnnotations;

namespace FrontendBlazorApi.Models
{
    public class EjecucionPresupuesto
    {
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public int Id { get; set; } 
        public int IdPresupuesto{ get; set; } 
        public int Anio{ get; set; } 

        [Column(TypeName = "decimal(15,2)")]
        public decimal MontoPlaneado{ get; set; }
        
        [Column(TypeName = "decimal(15,2)")]
        public decimal MontoEjecutado { get; set; }

        public string Observaciones { get; set; } = string.Empty;

        [NotMapped]
        [JsonIgnore]
        public string PresupuestoAprobado { get; set; } = string.Empty; 
        

    }
}