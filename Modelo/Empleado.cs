namespace Curso_UDemyWebApi.Modelo
{
    public class Empleado
    {
        public int Id { get; init; } /*el init es solo para cuando quiero inicializar el objeto 
                                      * y luego no se pueda cambiar. En mi base de datos va a tener
                                      * un id de incremento*/
        public string Nombre { get; set; }
        public string CodEmpleado { get; set; }
        public string Email { get; set; }
        public int Edad { get; set; }
        public DateTime FechaAlta { get; set; }
        public DateTime? /*acepta nulo*/ FechaBaja { get; set; }

    }
}
