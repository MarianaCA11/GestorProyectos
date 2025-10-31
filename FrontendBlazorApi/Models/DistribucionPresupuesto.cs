using System.Text.Json.Serialization;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
 
namespace FrontendBlazorApi.Models
{
       
    public class DistribucionPresupuesto
    {
        [JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
        public int Id { get; set; }
        public int IdPresupuestoPadre { get; set; }
        public int IdProyectoHijo{ get; set; } 
       
        [Column(TypeName = "decimal(15,2)")]
        public decimal MontoAsignado { get; set; }      
       
        [NotMapped]
        [JsonIgnore]
        public string? ProyectoTitulo { get; set; }
 
        [NotMapped]
        [JsonIgnore]
        public string? PresupuestoAprobado { get; set; }
 
 
    }
 
}