using Curso_UDemyWebApi.Modelo;

namespace Curso_UDemyWebApi.Servicios
{
    public interface IServicioEmpleado
    {
        public IEnumerable<Empleado> DameEmpleados();
        /*IEnumerable<Empleado>: Es el tipo de retorno del método. 
         * IEnumerable es una interfaz en .NET que define un método GetEnumerator 
         * que permite iterar sobre una colección de elementos. 
         * <Empleado> especifica que la colección que se va a devolver será de objetos 
         * de tipo Empleado*/

        public Empleado DameEmpleado(string codEmpleado);

        public void NuevoEmpleado(Empleado e);

        public void ModificarEmpleado(Empleado e);

        public void BajaEmpleado(string codEmpleado);
    }
}
