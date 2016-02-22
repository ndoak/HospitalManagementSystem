using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
/// <summary>
/// NATALIE DOAK'S PAGE
///ALLOWS YOU TO LOGIN WITH INFORMATION STORED ON THE DATABASE AND REDIRECTS YOU TO THE MENU PAGE 
/// </summary>
namespace HTTP5101_HOSPITALMGMNT
{
    public partial class Login : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["cs_Temiskaming"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           // string cs = ConfigurationManager.ConnectionStrings["cs_Temiskaming"].ConnectionString;
        }
        // ON BUTTON CLICK IT TRIMS YOUR PASSWORD AND USERNAME AND OPEN CONNECTION TO THE DATABASE TO CHECK YOUR INFORMATION IN THE DATABASE
        //IF YOUR INFO IS STORED THERE, YOU WILL BE REDIRECTED TO THE NEXT PAGE
        protected void btnLogin_Click(object sender, EventArgs e)
        {  
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            string query = "Select Username from users Where Username = @Username and Password = @Password;";
            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    lblMessage.Text = "Login was successful";
                    lblMessage.ForeColor = Color.Green;
                    Response.Redirect("Menu.aspx");
                }
                else
                {
                    lblMessage.Text = "Login failed. Either your username or password didn't match.";
                    lblMessage.ForeColor = Color.Red;
                }
            }
        }
    }
}