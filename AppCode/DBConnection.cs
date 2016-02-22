using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace DoctorPage.AppCode
{
    public class DBConnection
    {
        private static readonly string _connString;
        static DBConnection()
        {
            _connString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

        public SqlConnection getConnection()
        {
            SqlConnection conn = new SqlConnection(_connString);
            return conn;
        }
    }
}