using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoctorPage.AppCode;

namespace DoctorPage
{
    public partial class DoctorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtDoctorId.Text);
            DoctorOperation docOP = new DoctorOperation();
            gvShowAllDoctor.DataSource = docOP.searchDoctorById(id);
            gvShowAllDoctor.DataBind();
            
        }

        protected void clear()
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



        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            Doctor doctor = new Doctor();
            /*doctor.DoctorID = Int32.Parse(txtDoctorId.Text);*/
            doctor.DoctorFirstName = txtDoctorFName.Text;
            doctor.DoctorLastName = txtDoctorLName.Text;
            doctor.Expertise = txtExpertise.Text;
            doctor.Phone = txtPhone.Text;
            doctor.Address = txtAddress.Text;
            doctor.City = txtCity.Text;
            doctor.State = txtState.Text;
            doctor.Postal_code = txtPostalCode.Text;
            DoctorOperation doctorOperation = new DoctorOperation();
            lblMessage.Text = doctorOperation.addDoctor(doctor);
            
        }

        protected void btnShowDoctors_Click(object sender, EventArgs e)
        {
            DoctorOperation docOP = new DoctorOperation();
            gvShowAllDoctor.DataSource = docOP.searchDoctor();
            gvShowAllDoctor.DataBind();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(txtId.Text);
            DoctorOperation docOP = new DoctorOperation();
            docOP.deleteDoctor(id);
            gvShowAllDoctor.DataSource = docOP.searchDoctor();
            gvShowAllDoctor.DataBind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}