/*
  Author Ran Wang finish Search Doctor, Add Doctor,
  Delete Doctor function in project, I also do some Jquery css and HTML
  to make the page look nice. 
*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HTTP5101_HOSPITALMGMNT.AppCode;
using System.Drawing;

namespace HTTP5101_HOSPITALMGMNT
{
    public partial class DoctorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblDeleteMessage.Text = string.Empty;
            lblDocIDMessage.Text = string.Empty;
            lblMessage.Text = string.Empty;
            lblMessage1.Text = string.Empty;
          
        }

        /// <summary>
        ///  method of Search button onclick event. 
        /// </summary>
        /// 
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                lblSearchError.Text = "";
                int id = Convert.ToInt32(txtDoctorId.Text);


                DoctorOperation docOP = new DoctorOperation();
                if (docOP.SearchDoctorById(id).Count == 0)
                {
                    lblSearchError.ForeColor = Color.Red;
                    lblSearchError.Text = "Id errors !! check Doctor id";
                }
                else
                {
                    gvSearch.DataSource = docOP.SearchDoctorById(id);
                    gvSearch.DataBind();
                }
            }

            catch
            {
                lblSearchError.ForeColor = Color.Red;
                lblSearchError.Text = "must be a number";
            }

        }

        /// <summary>
        ///  Clear all the textbox  
        /// </summary>
        /// 
        protected void Clear()
        {
            txtAddress.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtDoctorFName.Text = string.Empty;
            txtDoctorLName.Text = string.Empty;
            txtExpertise.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtState.Text = string.Empty;
            txtPostalCode.Text = string.Empty;
           
        }


        /// <summary>
        ///  addDoctor on click button event 
        /// </summary>
        /// 

        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            bool check = true;
            Doctor doctor = new Doctor();
            /*doctor.DoctorID = Int32.Parse(txtDoctorId.Text);*/
           
            try {
             
              ulong num=Convert.ToUInt64(txtPhone.Text);
                if(num.ToString().Length != 10)
                {
                    check = false;
                    lblMessage.ForeColor = Color.Red;
                    lblMessage.Text = "phone number must be a number and 10 digits";
                }

            }
            catch
            {
                check = false;
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "phone number must be a number and 10 digits";
            }
            if (check)
            {
                doctor.DoctorFirstName = txtDoctorFName.Text;
                doctor.DoctorLastName = txtDoctorLName.Text;
                doctor.Expertise = txtExpertise.Text;
                doctor.Phone = txtPhone.Text;
                doctor.Address = txtAddress.Text;
                doctor.City = txtCity.Text;
                doctor.State = txtState.Text;
                doctor.Postal_code = txtPostalCode.Text;
                DoctorOperation doctorOperation = new DoctorOperation();
                lblMessage.Text = doctorOperation.AddDoctor(doctor);
            }
            
        }

        /// <summary>
        ///  Show doctor button on click evnet 
        /// </summary>
        /// 

        protected void btnShowDoctors_Click(object sender, EventArgs e)
        {
            DoctorOperation docOP = new DoctorOperation();
            gvShowAllDoctor.DataSource = docOP.SearchDoctor();
            gvShowAllDoctor.DataBind();
        }

        /// <summary>
        ///  Delete doctor button on click evnet 
        /// </summary>
        ///

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try {
                Convert.ToInt32(txtId.Text);
                int id = Convert.ToInt32(txtId.Text);
                DoctorOperation docOP = new DoctorOperation();
                lblDeleteMessage.Text = docOP.DeleteDoctor(id);
                gvShowAllDoctor.DataSource = docOP.SearchDoctor();
                gvShowAllDoctor.DataBind();    
            }
            catch
            {

                lblDeleteMessage.ForeColor = Color.Red;
                lblDeleteMessage.Text = "Id errors !! check Doctor id";
            }
           
        }

        /// <summary>
        /// Clear button on click evnet 
        /// </summary>
        ///

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        /// <summary>
        /// Modify Doctors 
        /// </summary>
        ///
        protected void btnModify_Click(object sender, EventArgs e)
        {
            lblDocIDMessage.Text = "";
            lblMessage.Text = "";
            bool check = true;
            Doctor doctor = new Doctor();
            DoctorOperation doctorOperation = new DoctorOperation();
            /*doctor.DoctorID = Int32.Parse(txtDoctorId.Text);*/
            try
            {
                int id = Convert.ToInt32(txtDocID.Text);
                if (doctorOperation.SearchDoctorById(id).Count == 0)
                {
                    lblDocIDMessage.ForeColor = Color.Red;
                    lblDocIDMessage.Text = "Id errors !! check Doctor id";
                }

            }
            catch
            {
                check = false;
                lblDocIDMessage.ForeColor = Color.Red;
                lblDocIDMessage.Text = "Id errors !! must be number";
            }

            try
            {
                
                ulong num = Convert.ToUInt64(txtPhone1.Text);
                if (num.ToString().Length != 10)
                {
                    check = false;
                    lblMessage1.ForeColor = Color.Red;
                    lblMessage1.Text = "phone number must be a number and 10 digits";
                }

            }
            catch
            {
                check = false;
                lblMessage1.ForeColor = Color.Red;
                lblMessage1.Text = "phone number must be a number and 10 digits";
            }
            if (check)
            {
                doctor.DoctorID = Convert.ToInt32(txtDocID.Text);
                doctor.DoctorFirstName = txtDoctorFName1.Text;
                doctor.DoctorLastName = txtDoctorLName1.Text;
                doctor.Expertise = txtExpertise1.Text;
                doctor.Phone = txtPhone1.Text;
                doctor.Address = txtAddress1.Text;
                doctor.City = txtCity1.Text;
                doctor.State = txtState1.Text;
                doctor.Postal_code = txtPostalCode1.Text;
                //DoctorOperation doctorOperation = new DoctorOperation();
                lblMessage1.Text = doctorOperation.UpdateDoctor(doctor);
            }

        }
    }
}