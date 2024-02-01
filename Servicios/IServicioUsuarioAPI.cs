using Curso_UDemyWebApi.Modelo;

namespace Curso_UDemyWebApi.Servicios
{
    public interface IServicioUsuarioAPI
    {
        Task<UsuarioAPI> DameUsuario(LoginAPI loginAPI);
    }
}
