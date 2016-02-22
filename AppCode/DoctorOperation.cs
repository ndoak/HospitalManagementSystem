using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace DoctorPage.AppCode
{
    /// <summary>
    ///  This class is used do all the database operation including 
    /// insert update select developer can add any database operation in
    /// this class
    /// </summary>
    public class DoctorOperation
    {

        /// <summary>
        ///  This method is used to get all doctors information. 
        /// </summary>
        public List<Doctor> searchDoctor()
        {
            List<Doctor> allDoctor = new List<Doctor>();
            SqlConnection conn = new DBConnection().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Doctor", conn);

            try
            {
                conn.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    Doctor doctor = new Doctor();
                    doctor.DoctorID = Convert.ToInt32(sdr["doctor_id"].ToString());
                    doctor.DoctorFirstName = sdr["doc_first_name"].ToString();
                    doctor.DoctorLastName = sdr["doc_last_name"].ToString();
                    doctor.Expertise = sdr["expertise"].ToString();
                    doctor.Phone = sdr["phone"].ToString();
                    doctor.Address = sdr["address"].ToString();
                    doctor.City = sdr["city"].ToString();
                    doctor.State = sdr["state"].ToString();
                    doctor.Postal_code = sdr["postal_code"].ToString();
                    doctor.ErrorMassage = "Successful";
                    allDoctor.Add(doctor);

                }

                return allDoctor;
            }
            catch (Exception ex)
            {
                allDoctor.Clear();
                Doctor doctor = new Doctor();
                doctor.ErrorMassage = "Seerver Error(DB):" + ex.Message.ToString();
                return allDoctor;
            }
            finally
            {
                conn.Close();
            }

        }


        /// <summary>
        ///  This method is used to get doctors information by id. 
        /// </summary>
        /// 
        public List<Doctor> searchDoctorById(int id)
        {
            List<Doctor> allDoctor = new List<Doctor>();
            SqlConnection conn = new DBConnection().getConnection();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Doctor WHERE doctor_id=" + id, conn);

            try
            {
                conn.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                while (sdr.Read())
                {
                    Doctor doctor = new Doctor();
                    doctor.DoctorID = Convert.ToInt32(sdr["doctor_id"].ToString());
                    doctor.DoctorFirstName = sdr["doc_first_name"].ToString();
                    doctor.DoctorLastName = sdr["doc_last_name"].ToString();
                    doctor.Expertise = sdr["expertise"].ToString();
                    doctor.Phone = sdr["phone"].ToString();
                    doctor.Address = sdr["address"].ToString();
                    doctor.City = sdr["city"].ToString();
                    doctor.State = sdr["state"].ToString();
                    doctor.Postal_code = sdr["postal_code"].ToString();
                    doctor.ErrorMassage = "Successful";
                    allDoctor.Add(doctor);

                }

                return allDoctor;
            }
            catch (Exception ex)
            {
                allDoctor.Clear();
                Doctor doctor = new Doctor();
                doctor.ErrorMassage = "Seerver Error(DB):" + ex.Message.ToString();
                allDoctor.Add(doctor);
                return allDoctor;
            }
            finally
            {
                conn.Close();
            }

        }

        /// <summary>
        ///  This method is used to add doctors information. 
        /// </summary>
        /// 
        public string addDoctor(Doctor doctor)
        {
            string dbCommand = "INSERT INTO Doctor(doc_first_name, doc_last_name, expertise, phone, address, city, state, postal_code)" +
                "VALUES(@DocFN, @DocLN, @Experise, @Phone, @Address, @City, @State, @Postal_code)";
            SqlConnection conn = new DBConnection().getConnection();
            SqlCommand cmd = new SqlCommand(dbCommand, conn);
            /*cmd.Parameters.AddWithValue("@DocID", doctor.DoctorID);*/
            cmd.Parameters.AddWithValue("@DocFN", doctor.DoctorFirstName);
            cmd.Parameters.AddWithValue("@DocLN", doctor.DoctorLastName);
            cmd.Parameters.AddWithValue("@Experise", doctor.Expertise);
            cmd.Parameters.AddWithValue("@Phone", doctor.Expertise);
            cmd.Parameters.AddWithValue("@Address", doctor.Address);
            cmd.Parameters.AddWithValue("@City", doctor.City);
            cmd.Parameters.AddWithValue("@State", doctor.State);
            cmd.Parameters.AddWithValue("@Postal_code", doctor.Postal_code);
            try
            {
                conn.Open();
                int num = cmd.ExecuteNonQuery();
                return checkSuccess(num);
            }
            catch (Exception ex)
            {
                return "Server Error(DB):" + ex.Message.ToString();
            }

            finally
            {
                conn.Close();
            }

        }

        /// <summary>
        ///  This method is used to update doctors information. 
        /// </summary>
        /// 

        public string updateDoctor(Doctor doctor)
        {
            string dbCommand = "UPDATE Doctor SET" +
                "doc_first_name=@DocFN, doc_last_name=@DocLN, expertise=@Expertise, phone=@Phone, address=@Address, city=@City, state =@State, postal_code=@Postal_code"
                + "WHERE doctor_id=@DocID";
            SqlConnection conn = new DBConnection().getConnection();
            SqlCommand cmd = new SqlCommand(dbCommand, conn);
            cmd.Parameters.AddWithValue("@DocID", doctor.DoctorID);
            cmd.Parameters.AddWithValue("@DocFN", doctor.DoctorFirstName);
            cmd.Parameters.AddWithValue("@DocLN", doctor.DoctorLastName);
            cmd.Parameters.AddWithValue("@Experise", doctor.Expertise);
            cmd.Parameters.AddWithValue("@Phone", doctor.Expertise);
            cmd.Parameters.AddWithValue("@Address", doctor.Address);
            cmd.Parameters.AddWithValue("@City", doctor.City);
            cmd.Parameters.AddWithValue("@State", doctor.State);
            cmd.Parameters.AddWithValue("@Postal_code", doctor.Postal_code);
            try
            {
                conn.Open();
                int num = cmd.ExecuteNonQuery();
                return checkSuccess(num);
            }
            catch (Exception ex)
            {
                return "Server Error(DB):" + ex.Message.ToString();
            }

            finally
            {
                conn.Close();
            }
        }

        /// <summary>
        ///  This method is used to update doctors information. 
        /// </summary>
        /// 

        public string deleteDoctor(int id)
        {
            string dbCommand = "DELETE FROM Doctor WHERE doctor_id=@DocID";
            SqlConnection conn = new DBConnection().getConnection();
            SqlCommand cmd = new SqlCommand(dbCommand, conn);
            cmd.Parameters.AddWithValue("@DocID", id);

            try
            {
                conn.Open();
                int num = cmd.ExecuteNonQuery();
                return checkSuccess(num);
            }
            catch (Exception ex)
            {
                return "Server Error(DB):" + ex.Message.ToString();
            }

            finally
            {
                conn.Close();
            }
        }

        private string checkSuccess(int value)
        {
            string msg;
            if (value == 1)
            {
                msg = "<span style='color:green;'>Success</span>";
            }
            else
            {
                msg = "<span style='color:red;'>Failed</span>";
            }
            return msg;
        }


    }
}