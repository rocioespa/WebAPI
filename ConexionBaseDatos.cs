﻿namespace Curso_UDemyWebApi
{

    public class ConexionBaseDatos
    {
        private string cadenaConexionSql;
        public string CadenaConexionSQL { get => cadenaConexionSql; }

        public ConexionBaseDatos(string ConexionSql)
        {
            cadenaConexionSql = ConexionSql;
        }

    }

}
