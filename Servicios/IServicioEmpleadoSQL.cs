using Curso_UDemyWebApi.Modelo;

namespace Curso_UDemyWebApi.Servicios
{
    public interface IServicioEmpleadoSQL
    {
        public Task<IEnumerable<Empleado>> DameEmpleados();
        
        public Task <Empleado> DameEmpleado(string codEmpleado);

        public Task NuevoEmpleado(Empleado e);

        public Task ModificarEmpleado(Empleado e);

        public Task BajaEmpleado(string codEmpleado);
    }
}
