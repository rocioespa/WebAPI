using Curso_UDemyWebApi.Modelo;
using Dapper;
using System.Data;
using System.Data.SqlClient;

namespace Curso_UDemyWebApi.Servicios
{
    public class ServicioUsuarioAPI : IServicioUsuarioAPI
    {
        private string CadenaConexion;

        public ServicioUsuarioAPI(ConexionBaseDatos conex)
        {
            CadenaConexion = conex.CadenaConexionSQL; //iniciada la base de datos en el servicio
        }

        private SqlConnection conexion()
        {
            return new SqlConnection(CadenaConexion);
        }


        public async Task<UsuarioAPI> DameUsuario(LoginAPI login)
        {
            SqlConnection sqlConxion = conexion();
            UsuarioAPI u = null;
            try
            {
                sqlConxion.Open();
                var param = new DynamicParameters();
                param.Add("@UsuarioApi", login.usuarioAPI, DbType.String, ParameterDirection.Input, 500);
                param.Add("@PassApi", login.passAPI, DbType.String, ParameterDirection.Input, 500);
                u = await sqlConxion.QueryFirstOrDefaultAsync<UsuarioAPI>("UsuarioApiObtener", param, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw new Exception("Se produjo un error al obtener dato del usuario de login" + ex.Message);
            }
            finally
            {
                sqlConxion.Close();
                sqlConxion.Dispose(); //para liberar recursos
            }
            return u;
        }
    }
    }

