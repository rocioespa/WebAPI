using Curso_UDemyWebApi.DTO;
using Curso_UDemyWebApi.Modelo;
using System.Runtime.CompilerServices;

namespace Curso_UDemyWebApi
{
    public static class Utilidades
    {
        /*esta clase lo que va a hacer es convertir un objeto en tipo empleado a tipo empleado dto*/
        public static EmpleadoDTO convertirDTO(this Empleado e) //se le pone this para que lo lea como una extension de la clase empleado
        {
            if( e != null) 
            {
                return new EmpleadoDTO
                {
                    Nombre = e.Nombre,
                    CodEmpleado = e.CodEmpleado,
                    Email = e.Email,
                    Edad = e.Edad
                };
            }
            return null; 
        }


        public static UsuarioApiDTO convertirDTO(this UsuarioAPI u)
        {
            if (u != null)
            {
                return new UsuarioApiDTO
                {
                    Token = u.Token,
                    Usuario = u.Usuario
                };
            }
            return null;
        }
    }

 
}

