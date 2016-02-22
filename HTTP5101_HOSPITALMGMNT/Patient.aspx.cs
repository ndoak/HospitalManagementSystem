using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Data;
using HTTP5101_HOSPITALMGMNT.AppCode;
///<summary>
///This page was made by Bethany Gwen Hynds
///This is the page where the patient information is entered into fields
///then the infromation is validated- if everything is correct the data is 
///inserted into Patient table
///</summary>

namespace HTTP5101_HOSPITALMGMNT
{
    public partial class Patient : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["cs_Temiskaming"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //This method checks if the ohip number entered already exists in our database
        private bool IsPatientExists(string ohip)
        {
            string query = "Select ohip_number from Patient Where ohip_number = @ohip_number;";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ohip_number", ohip);
                conn.Open();

                string patient = (string)cmd.ExecuteScalar();

                if (patient != null)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        //This method trims the input 
        //It checks the IsPatientExists method to check if this is a new ohip number
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            

            string patientfirstname = txtPFname.Text.Trim();
            string patientlastname = txtPLname.Text.Trim();
            string patientadmission = txtPAdmission.Text.Trim();
            string patientillness = txtPIllness.Text.Trim();
            string patientphone = txtPPhone.Text.Trim();
            string patientstreet = txtPStreet.Text.Trim();
            string patientcity = txtPCity.Text.Trim();
            string patientstate = txtPStateProv.Text.Trim();
            string patientpostal = txtPPostal.Text.Trim();
            string patientbirthdate = txtPBirthdate.Text.Trim();
            string patientohip = txtPOhip1.Text +" "+ txtPOhip2.Text +" "+txtPOhip3.Text+" "+ txtPOhip4.Text;


            if (IsPatientExists(patientohip))
            {
                lblPatient.Text = "This patient already exists.";
                lblPatient.ForeColor = Color.Red;
            }

            else
            {
                bool inserted = InsertPatient(patientfirstname, patientlastname, patientadmission, patientillness,
                    patientphone, patientstreet, patientcity, patientstate, patientpostal, patientbirthdate, patientohip);

                if (inserted)
                {

                    lblPatient.Text = "New patient was not added to the database, please try again.";
                    lblPatient.ForeColor = Color.Red;
                }
                else
                {
                    lblPatient.Text = "New patient was added to the database.";
                    lblPatient.ForeColor = Color.Green;

                    //if the entry is sucessful the textboxes are emptied
                    txtPFname.Text = "";
                    txtPLname.Text = "";
                    txtPAdmission.Text = "";
                    txtPIllness.Text = "";
                    txtPPhone.Text = "";
                    txtPStreet.Text = "";
                    txtPCity.Text = "";
                    txtPStateProv.Text = "";
                    txtPPostal.Text = "";
                    txtPBirthdate.Text = "";
                    txtPOhip1.Text = "";
                    txtPOhip2.Text = "";
                    txtPOhip3.Text = "";
                    txtPOhip4.Text = "";

                }

            }
        }

        //If the input validates and the ohip number does not already exist in database 
        //then the input is inserted into the patient table
        private bool InsertPatient(string patientfirstname, string patientlastname, string patientadmission, string patientillness,
             string patientphone, string patientstreet, string patientcity, string patientstate, string patientpostal, string patientbirthdate, string patientohip)
        {
            string query = "insert into Patient (p_first_name, p_last_name, time_come, illness, phone, address, city, state, postal_code, birthday, ohip_number)values(@patientfirstname, @patientlastname, @patientadmission, @patientillness, @patientphone, @patientstreet, @patientcity, @patientstate, @patientpostal, @patientbirthdate, @patientohip );";

            using (SqlConnection conn = new SqlConnection(cs))
            {

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@patientfirstname", patientfirstname);
                cmd.Parameters.AddWithValue("@patientlastname", patientlastname);
                cmd.Parameters.AddWithValue("@patientadmission", patientadmission);
                cmd.Parameters.AddWithValue("@patientillness", patientillness);
                cmd.Parameters.AddWithValue("@patientphone", patientphone);
                cmd.Parameters.AddWithValue("@patientstreet", patientstreet);
                cmd.Parameters.AddWithValue("@patientcity", patientcity);
                cmd.Parameters.AddWithValue("@patientstate", patientpostal);
                cmd.Parameters.AddWithValue("@patientpostal", patientpostal);
                cmd.Parameters.AddWithValue("@patientbirthdate", patientbirthdate);
                cmd.Parameters.AddWithValue("@patientohip", patientohip);
                conn.Open();

                string patient = (string)cmd.ExecuteScalar();

                if (patient != null)
                {
                    return true;
                              

                }
                else
                {
                    return false;
                }
            }

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtPAdmission.Text = Calendar2.SelectedDate.ToLongDateString();
            Calendar2.Visible = false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Calendar2.Visible = true;
        }

    }
}
    

