
using Curso_UDemyWebApi.Modelo;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using System.Linq.Expressions;

namespace Curso_UDemyWebApi.Servicios
{
    public class ServicioEmpleadoSQL : IServicioEmpleadoSQL
    {

        private string CadenaConexion;

        public ServicioEmpleadoSQL(ConexionBaseDatos conex)
        {
            CadenaConexion = conex.CadenaConexionSQL; //iniciada la base de datos en el servicio
        }

        private SqlConnection conexion()
        {
            return new SqlConnection(CadenaConexion);
        }

        //TODOS LOS METODOS AHORA VAN A SER ASINCRONOS PARA TRABAJAR CON PROGRAMACION ASINCRONCA
        public async Task BajaEmpleado(string codEmpleado) //public void BajaEmpleado(string codEmpleado)
        {
            SqlConnection sqlConxion = conexion();
            try
            {
                sqlConxion.Open();
                var param = new DynamicParameters();
                param.Add("@CodEmpleado", codEmpleado, DbType.String, ParameterDirection.Input, 4);
               //sqlConxion.ExecuteScalar("EmpleadoBorrar", param, commandType: CommandType.StoredProcedure);
               await sqlConxion.ExecuteScalarAsync("EmpleadoBorrar", param, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw new Exception("Se produjo un error al bajar empleado" + ex.Message);
            }
            finally
            {
                sqlConxion.Close();
                sqlConxion.Dispose(); //para liberar recursos
            }

        }

        public async Task<Empleado> DameEmpleado(string codEmpleado)
        {
            SqlConnection sqlConxion = conexion();
            Empleado e = null;
            try
            {
                sqlConxion.Open();
                var param = new DynamicParameters();
                param.Add("@CodEmpleado", codEmpleado, DbType.String, ParameterDirection.Input, 4);
                e = await sqlConxion.QueryFirstOrDefaultAsync<Empleado>("EmpleadoObtener", param, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw new Exception("Se produjo un error al obtener al empleado" + ex.Message);
            }
            finally
            {
                sqlConxion.Close();
                sqlConxion.Dispose(); //para liberar recursos
            }
            return e;
        }

        public async Task<IEnumerable<Empleado>> DameEmpleados()
        {
            SqlConnection sqlConxion = conexion();
            List<Empleado> empleados = new List<Empleado>();
            try
            {
                sqlConxion.Open();
                var r = await sqlConxion.QueryAsync<Empleado>("EmpleadoObtener", commandType: CommandType.StoredProcedure);
                empleados = r.ToList();

            }
            catch (Exception ex)
            {
                throw new Exception("Se produjo un error al obtener a los empleados" + ex.Message);
            }
            finally
            {
                sqlConxion.Close();
                sqlConxion.Dispose(); //para liberar recursos
            }
           
            return empleados;
        }

        public async Task ModificarEmpleado(Empleado e)
        {
            SqlConnection sqlConxion = conexion();
            try
            {
                sqlConxion.Open();
                var param = new DynamicParameters();
                param.Add("@Nombre", e.Nombre, DbType.String, ParameterDirection.Input, 500);
                param.Add("@CodEmpleado", e.CodEmpleado, DbType.String, ParameterDirection.Input, 4);
                param.Add("@Email", e.Email, DbType.String, ParameterDirection.Input, 255);
                param.Add("@Edad", e.Edad, DbType.Int32, ParameterDirection.Input);
                await sqlConxion.ExecuteScalarAsync("EmpleadoModificar", param, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw new Exception("Se produjo un error al modificar empleado" + ex.Message);
            }
            finally
            {
                sqlConxion.Close();
                sqlConxion.Dispose(); //para liberar recursos
            }
        }

        public async Task NuevoEmpleado(Empleado e)
        {
            SqlConnection sqlConxion = conexion();
            try
            { 
                sqlConxion.Open();
                var param = new DynamicParameters();
                param.Add("@Nombre", e.Nombre, DbType.String, ParameterDirection.Input, 500);
                param.Add("@CodEmpleado", e.CodEmpleado, DbType.String, ParameterDirection.Input, 4);
                param.Add("@Email", e.Email, DbType.String, ParameterDirection.Input, 255);
                param.Add("@Edad", e.Edad, DbType.Int32, ParameterDirection.Input);
                param.Add("@FechaAlta", e.FechaAlta, DbType.DateTime, ParameterDirection.Input);

                await sqlConxion.ExecuteScalarAsync("EmpleadoAlta", param, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                throw new Exception("Se produjo un error al dar de alta" + ex.Message);
            }
            finally { 
                sqlConxion.Close(); 
                sqlConxion.Dispose(); //para liberar recursos
            } 

        }
    }
}
