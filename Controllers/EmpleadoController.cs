using Curso_UDemyWebApi.DTO;
using Curso_UDemyWebApi.Modelo;
using Curso_UDemyWebApi.Servicios;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Curso_UDemyWebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmpleadoController : ControllerBase
    {
        private readonly IServicioEmpleadoSQL _servicioEmpleado;

        public EmpleadoController(IServicioEmpleadoSQL servicioEmpleado)
        {
            _servicioEmpleado = servicioEmpleado;
        }

        [HttpGet]
        public async  Task<IEnumerable<EmpleadoDTO>> DameEmpleados() {
            var listaEmpleados = (await _servicioEmpleado.DameEmpleados()).Select(e=>e.convertirDTO()); /*Con el Select, recorre elemento a elemento y
                                                                                                         * lo convierte en DTO
                                                                                  /*sin el select me devuelve
                                                                                   * un empleado, pero de esta forma lo estoy convirtiendo
                                                                                   * en DTO*/
            return listaEmpleados;
            // return _servicioEmpleado.DameEmpleados() aca solo me devuelve empleado

        }

        //traer un solo empleado
        [HttpGet("{codEmpleado}")]
        public async Task <ActionResult<EmpleadoDTO>> DameEmpleado(string codEmpleado)
            /*La declaración ActionResult<EmpleadoDTO> permite devolver tanto el objeto EmpleadoDTO como códigos de estado HTTP asociados 
             * (por ejemplo, 200 OK si se encuentra el empleado, 404 Not Found si no se encuentra). 
             * Si el empleado no se encuentra, se devuelve NotFound(), 
             * que es un atajo proporcionado por ASP.NET Core para devolver una respuesta HTTP 404.*/
        {
            var empleado = (await _servicioEmpleado.DameEmpleado(codEmpleado)).convertirDTO();
            if(empleado is null)
            {
                return NotFound("Empleado no encontrado para codigo solicitado");
            }
            return empleado;
        }

        [HttpPost]
        public async Task <ActionResult<EmpleadoDTO>> NuevoEmpleado(EmpleadoDTO e) 
        {
            Empleado empleado = new Empleado
            {

                CodEmpleado = e.CodEmpleado,
                Nombre = e.Nombre,
                Email = e.Email,
                Edad = e.Edad,
                FechaAlta = DateTime.Now
            };

            await _servicioEmpleado.NuevoEmpleado(empleado);
            return empleado.convertirDTO();
        }

        [HttpPut]
        public async Task<ActionResult<EmpleadoDTO>> ModificarEmpleado(EmpleadoDTO e)
        {
            var empleadoAux = await _servicioEmpleado.DameEmpleado(e.CodEmpleado);
            if(empleadoAux is null)
            {
                return NotFound("Empleado no encontrado para codigo solicitado");
            }
            empleadoAux.CodEmpleado = e.CodEmpleado;
            empleadoAux.Nombre = e.Nombre;
            empleadoAux.Email = e.Email;
            empleadoAux.Edad = e.Edad;

            await _servicioEmpleado.ModificarEmpleado(empleadoAux);

            return e;
        }

        [HttpDelete]
        public async Task <ActionResult> BorrarEmpleado(string codEmpleado)
        {
            var empleadoAux = await _servicioEmpleado.DameEmpleado(codEmpleado);
            if (empleadoAux is null)
            {
                return NotFound("Empleado no encontrado para codigo solicitado");
            }
            await _servicioEmpleado.BajaEmpleado(empleadoAux.CodEmpleado);
            return Ok();
        }

    }


}
