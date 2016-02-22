
///<summary>
///Author: Fatemeh Abdizadeh
///Discharging a patient.You need to enter a discharge date and a description for diagnosis and treatment and update the Admit table
///</summary>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace HTTP5101_HOSPITALMGMNT
{
    public partial class Discharge : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["cs_Temiskaming"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Some of the text boxes and buttons are disables until the user enters the ohip number and clicks btnsearch
            if (!IsPostBack)
            {
                RequiredDischargeDate.Enabled = false;
                RequiredDiagnosis.Enabled = false;
                RequiredTreatment.Enabled = false;

                btnUpdate.Enabled = false;
                txtDischarge.Enabled = false;
                txtDiagnosis.Enabled = false;
                txtTreatment.Enabled = false;
                lbDischarge.Enabled = false;
            }
        }
        //On the button click the ohip number entered is searched to confirm if it exists in the database
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int integer;
            if (txtOhip1.Text == "" || txtOhip2.Text == "" || txtOhip3.Text == "" || txtOhip4.Text == "")
            {
                lblOhipMessage.Text = "Please enter the ohip number completely.";
                lblOhipMessage.ForeColor = Color.Red;
            }
            else if (!(Int32.TryParse(txtOhip1.Text, out integer)) || !(Int32.TryParse(txtOhip2.Text, out integer)) || !(Int32.TryParse(txtOhip3.Text, out integer)))
            {
                lblOhipMessage.Text = "Please enter the ohip number correctly in this format(1234 567 891 AA)";
                lblOhipMessage.ForeColor = Color.Red;
            }
            else
            {
                lblOhipMessage.Text = "";
                RequiredDischargeDate.Enabled = false;
                RequiredDiagnosis.Enabled = false;
                RequiredTreatment.Enabled = false;
                string ohipNumber = txtOhip1.Text + " " + txtOhip2.Text + " " + txtOhip3.Text + " " + txtOhip4.Text;
                //I only selected thoes paitents who has not be discharged.
                string selectQuery = "Select p_first_name, p_last_name,assign_date from Admit A,Patient P Where ohip_number = @OhipNumber AND A.patient_id=P.patient_id AND discharge_date IS NULL;";
                SqlConnection conn = new SqlConnection(cs);
                SqlDataAdapter da = new SqlDataAdapter(selectQuery, conn);
                da.SelectCommand.Parameters.AddWithValue("@OhipNumber", ohipNumber);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DataTable tblsPatientAdmit = ds.Tables[0];
             
                if (tblsPatientAdmit.Rows.Count == 1)
                {
                    RequiredDischargeDate.Enabled = true;
                    RequiredDiagnosis.Enabled = true;
                    RequiredTreatment.Enabled = true;

                    DataRow dr = tblsPatientAdmit.Rows[0];
                    txtFirstName.Text = dr["p_first_name"].ToString();
                    txtLastName.Text = dr["p_last_name"].ToString();
                    txtAssign.Text = dr["assign_date"].ToString();
                    lblMessage.Text = "Patient with Ohip Number = " + ohipNumber + " was found.";
                    lblMessage.ForeColor = Color.Green;

                    btnUpdate.Enabled = true;
                    txtDischarge.Enabled = true;
                    txtDiagnosis.Enabled = true;
                    txtTreatment.Enabled = true;
                    lbDischarge.Enabled = true;
                }
                else
                {
                    RequiredDischargeDate.Enabled = false;
                    RequiredDiagnosis.Enabled = false;
                    RequiredTreatment.Enabled = false;

                    lblMessage.Text = "Patient with Ohip Number = " + ohipNumber + " was not found or he/she is already discharged. Please try again";
                    lblMessage.ForeColor = Color.Red;

                    txtFirstName.Text = "";
                    txtLastName.Text = "";
                    txtAssign.Text = "";
                    txtDischarge.Text = "";
                    txtDiagnosis.Text = "";
                    txtTreatment.Text = "";
                }
            }
        }
        //This method gets patient's ohip number and returns patient's id 
        private int GetPatient_id(string ohip_number)
        {
            string selectQuery = "Select P.patient_id from Admit A,Patient P Where ohip_number = @OhipNumber AND A.patient_id=P.patient_id AND discharge_date IS NULL;";
            SqlConnection conn = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter(selectQuery, conn);
            da.SelectCommand.Parameters.AddWithValue("@OhipNumber", ohip_number);
            DataSet ds = new DataSet();

            da.Fill(ds);

            DataTable tblsPatientAdmit = ds.Tables[0];

            if (tblsPatientAdmit.Rows.Count == 1)
            {
                DataRow dr = tblsPatientAdmit.Rows[0];
                int patientId = Convert.ToInt32(dr["patient_id"]);
                return patientId;
            }
            else
                return -1;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

            string ohipNumber = txtOhip1.Text + " " + txtOhip2.Text + " " + txtOhip3.Text + " " + txtOhip4.Text;
            int patientId = GetPatient_id(ohipNumber);
            if (patientId == -1)
            {
                lblMessage.Text = "Patient with Ohip Number = " + ohipNumber + " was not found or he/she is already discharged.Please try again";
                lblMessage.ForeColor = Color.Red;

                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtAssign.Text = "";
                txtDischarge.Text = "";
                txtDiagnosis.Text = "";
                txtTreatment.Text = "";
            }
            else
            {
                string selectQuery = "Select assign_id,patient_id,assign_date,discharge_date,diagnosise,treatment from Admit Where patient_id = @paitentId AND discharge_date IS NULL;";
                SqlConnection conn = new SqlConnection(cs);
                SqlDataAdapter da = new SqlDataAdapter(selectQuery, conn);
                da.SelectCommand.Parameters.AddWithValue("@paitentId", patientId);
                DataSet ds = new DataSet();

                da.Fill(ds);

                DataTable tblAdmit = ds.Tables[0];

                if (tblAdmit.Rows.Count == 1)
                {
                    DataRow dr = tblAdmit.Rows[0];
                    dr["discharge_date"] = txtDischarge.Text;
                    dr["diagnosise"] = txtDiagnosis.Text;
                    dr["treatment"] = txtTreatment.Text;

                    SqlCommandBuilder builder = new SqlCommandBuilder(da);

                    int rowsInserted = da.Update(ds);

                    if (rowsInserted == 1)
                    {
                        lblMessage.Text = "Patient with Ohip Number = " + ohipNumber + " was updated to the database";
                        lblMessage.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblMessage.Text = "Patient with Ohip Number = " + ohipNumber + " was not updated to the database";
                        lblMessage.ForeColor = Color.Red;
                    }
                }
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Calendar1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            txtDischarge.Text = Calendar1.SelectedDate.ToLongDateString();
            Calendar1.Visible = false;
        }

        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            
        }
    }
}