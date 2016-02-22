using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/*
Author Ran Wang this class is represent Doctor Table in database
*/

namespace HTTP5101_HOSPITALMGMNT.AppCode
{
    public class Doctor
    {
        private Int32 _doctorID;
        public Int32 DoctorID
        {
            get { return _doctorID; }
            set { _doctorID = value; }
        }

        private string _doctorFirstName;
        public string DoctorFirstName
        {
            get { return _doctorFirstName; }
            set { _doctorFirstName = value; }
        }

        private string _doctorLastName;
        public string DoctorLastName
        {
            get { return _doctorLastName; }
            set { _doctorLastName = value; }
        }

        private string _expertise;
        public string Expertise
        {
            get { return _expertise; }
            set { _expertise = value; }
        }

        private string _phone;
        public string Phone
        {
            get { return _phone; }
            set { _phone = value; }
        }


        private string _address;
        public string Address
        {
            get { return _address; }
            set { _address = value; }
        }

        private string _city;
        public string City
        {
            get { return _city; }
            set { _city = value; }
        }

        private string _state;
        public string State
        {
            get { return _state; }
            set { _state = value; }
        }

        private string _postal_code;
        public string Postal_code
        {
            get { return _postal_code; }
            set { _postal_code = value; }
        }
        /*
        private string _errorMassage;
        public string ErrorMassage
        {
            get { return _errorMassage; }
            set { _errorMassage = value; }
        }
        */
    }
}