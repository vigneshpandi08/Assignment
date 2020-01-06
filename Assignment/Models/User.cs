using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Assignment.Models
{
    public class User
    {
        public int UserID { get; set; }
        public string FullName { get; set; }
        public string EmailID { get; set; }
        public string PhoneNumer { get; set; }
        public string Password { get; set; }
        public string RetypePassword { get; set; }
        public string SecurityQuestions { get; set; }
        public string SecurityAnswers { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Status { get; set; }
    }

}