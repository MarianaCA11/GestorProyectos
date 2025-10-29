using System.Text.Json.Serialization;

namespace FrontendBlazorApi.Models
{
    // NO uses 'partial' si está en un solo archivo
public class RespuestaApi<T>
{
    public T Datos { get; set; } = default!;
    public string Mensaje { get; set; } = string.Empty;
}
}