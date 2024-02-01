using System.ComponentModel.DataAnnotations;

namespace Curso_UDemyWebApi.DTO
{
    public class EmpleadoDTO
    {
        /*aca es donde utilizo la dto para que mi usuario no vea cierta informaccion de mi empleado*/
        //agregar validaciones
        [Required(ErrorMessage = "Obligario")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "Obligario")]
        [MaxLength(4, ErrorMessage = "Maximo 4 digitos")]
        public string CodEmpleado { get; set; }

        [Required(ErrorMessage = "Obligario")]
        [EmailAddress(ErrorMessage = "Formato Incorrecto")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Obligario")]
        [Range(16,100, ErrorMessage ="la edad debe estar entre los 16 y los 100 años")]
        public int Edad { get; set; }
    

    }
}
