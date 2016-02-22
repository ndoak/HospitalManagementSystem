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
/// <summary>
///This page was made by Bethany Gwen Hynds.
///This is the page where a patient can be searched up, then a doctor can be searched up
///Then the doctor can be assigned to a patient and the inforamtion is inserted
///into the admit table
/// </summary>

namespace HTTP5101_HOSPITALMGMNT
{
    public partial class Assign : System.Web.UI.Page

    {
        string cs = ConfigurationManager.ConnectionStrings["cs_Temiskaming"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //THIS IS THE PART WHERE PATIENT INFO IS LOADED 
        protected void btnLoad_Click(object sender, EventArgs e)
        {
            String patientid = Convert.ToString(txtPidAssign.Text);

            string selectQuery = "Select p_first_name, p_last_name, illness from Patient Where patient_id = @patientid;";

            SqlConnection conn = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter(selectQuery, conn);
            da.SelectCommand.Parameters.AddWithValue("@patientid", patientid);
            DataSet ds = new DataSet();

            da.Fill(ds, "Patient");
            Cache["DataSet"] = ds;
            DataTable tblProducts = ds.Tables["Patient"];
            //The patient info that is loaded is put into the text boxes
            if (tblProducts.Rows.Count == 1)
            {
                DataRow dr = tblProducts.Rows[0];
                txtPfnameAssign.Text = dr["p_first_name"].ToString();
                txtPlnameAssign.Text = dr["p_last_name"].ToString();
                txtPillnessAssign.Text = dr["illness"].ToString();
             

                lblPatient.Text = "Patient with  = " + patientid + " was found";
                lblPatient.ForeColor = Color.Green;
            }
            else
            {
                lblPatient.Text = "Patient with  = " + patientid + " was not found. Please try again.";
                lblPatient.ForeColor = Color.Red;

                txtPfnameAssign.Text = "";
                txtPlnameAssign.Text = "";
                txtPillnessAssign.Text = "";
             
            }
        }
        //THIS IS WHERE THE DOCTOR INFO IS LOADED AND PUT INTO A GRID
        protected void btnDoctor_Click(object sender, EventArgs e)
        {
            String DoctorExpertise = Convert.ToString(txtDoctor.Text);

            string selectQuery = "Select doc_first_name, doc_last_name, doctor_id from Doctor Where expertise = @expertise;";

            SqlConnection conn = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter(selectQuery, conn);
            da.SelectCommand.Parameters.AddWithValue("@expertise", DoctorExpertise);
            DataSet ds = new DataSet();
            //the doctor info that is loaded is put into the Grid
            da.Fill(ds, "Doctor");
            Cache["DataSet"] = ds;
            DataTable tblProducts = ds.Tables["Doctor"];

            if (tblProducts.Rows.Count == 1)
            {
                DataRow dr = tblProducts.Rows[0];



                lblPatientAssign.Text = "Doctor with = " + DoctorExpertise + " was found";
                lblPatientAssign.ForeColor = Color.Green;
            }
            else
            {
                lblPatientAssign.Text = "Doctor with  = " + DoctorExpertise + " was not found. Please try again.";
                lblPatientAssign.ForeColor = Color.Red;
               
                txtDoctor.Text = "";
              
            }
        }
        //THIS is where the patient that was loaded earlier can be assigned to a doctor on a button click
        protected void btnAssign_Click(object sender, EventArgs e)
        {
            int doctorid = Convert.ToInt32(txtDocidAssign.Text);
            int patientid = Convert.ToInt32(txtPidAssign.Text);
            string currentDate = DateTime.Now.ToString();

            string query = "Insert into Admit (doctor_id, patient_id, assign_date, discharge_date, diagnosise, treatment) values (@Doctorid, @Patientid, @currentDate, NULL, NULL, NULL);";

            using (SqlConnection conn = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Doctorid", doctorid);
                cmd.Parameters.AddWithValue("@Patientid", patientid);
                cmd.Parameters.AddWithValue("@currentDate", currentDate);
              
                conn.Open();

                string Admit = (string)cmd.ExecuteScalar();

                if (Admit != null)
                {
                    lblPatientAssign.Text = "Doctor was not assigned to patient, please try again.";
                    lblPatientAssign.ForeColor = Color.Red;
                }
                else
                {
                    lblPatientAssign.Text = "Doctor sucessfully assigned to patient.";
                    lblPatientAssign.ForeColor = Color.Green;
                }

            }

        }
        



    }
}