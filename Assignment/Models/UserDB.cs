using Assignment.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Assignment.Models
{
    public class UserDB
    {
        private SqlConnection con;

        public void Connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["getconnection"].ToString();
            con = new SqlConnection(constr);
        }
        public List<User> ListAll()
        {
            Connection();
            List<User> lst = new List<User>();
            SqlCommand cmd = new SqlCommand("sp_Select", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            da.Fill(dt);
            con.Close();
            foreach(DataRow dr in dt.Rows)
            {
                lst.Add(new User
                {
                    UserID = Convert.ToInt32(dr["UserID"]),
                    FullName = dr["FullName"].ToString(),
                    EmailID = dr["EmailID"].ToString(),
                    City = dr["City"].ToString(),
                    Country = dr["Country"].ToString(),
                    Status = dr["Status"].ToString()
                });     

            }
            return lst;
        }

        public bool Add(User usr)
        {
            Connection();
            SqlCommand cmd = new SqlCommand("sp_InsertUpdate", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", usr.UserID);
            cmd.Parameters.AddWithValue("@FullName", usr.FullName);
            cmd.Parameters.AddWithValue("@EmailID", usr.EmailID);
            cmd.Parameters.AddWithValue("@City", usr.City);
            cmd.Parameters.AddWithValue("@Country", usr.Country);
            cmd.Parameters.AddWithValue("@Status", usr.Status);
            cmd.Parameters.AddWithValue("@Action", "Insert");
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if(i>1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool Update(User usr)
        {
            Connection();
            SqlCommand cmd = new SqlCommand("sp_InsertUpdate", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@UserID", usr.UserID);
            cmd.Parameters.AddWithValue("@FullName", usr.FullName);
            cmd.Parameters.AddWithValue("@EmailID", usr.EmailID);
            cmd.Parameters.AddWithValue("@City", usr.City);
            cmd.Parameters.AddWithValue("@Country", usr.Country);
            cmd.Parameters.AddWithValue("@Status", usr.Status);
            cmd.Parameters.AddWithValue("@Action", "Update");
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i > 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}