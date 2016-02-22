using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;

/*
Author Ran Wang this class is used to Create a connection string and connect 
to DataBase
*/
namespace HTTP5101_HOSPITALMGMNT.AppCode
{
    public class DBConnection
    {
        private static readonly string _connString;
        static DBConnection()
        {
            _connString = WebConfigurationManager.ConnectionStrings["cs_Temiskaming"].ConnectionString;
        }

        /// <summary>
        ///  This method is used to link to DataBase. 
        /// </summary>
        /// 
        public SqlConnection GetConnection()
        {
            SqlConnection conn = new SqlConnection(_connString);
            return conn;
        }
    }
}