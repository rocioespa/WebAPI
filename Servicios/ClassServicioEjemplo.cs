namespace Curso_UDemyWebApi.Servicios
{
    //Esta clase va a implementar el metodo que defini en la interfaz del servicio
    public class ClassServicioEjemplo : IServicioEjemplo
    {
        public string Ejemplo()
        {
           return "Ejemplo de inyeccion de dependencias";
        }
    }
}
