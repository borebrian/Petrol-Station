using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


namespace Administration 
{
    public partial class Administrations : System.Web.UI.Page 
    {
        public bool test;
        public void Login(String sql, String Username, String Pass)
        {


            string strcon = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            {

                using (SqlCommand StrQuer = new SqlCommand(sql, con))
                {
                    StrQuer.Parameters.AddWithValue("@Username", Username);
                    StrQuer.Parameters.AddWithValue("@password", Pass);
                    StrQuer.Connection.Open();

                    SqlDataReader myDataReadert = StrQuer.ExecuteReader();


                    if (myDataReadert.Read())
                    {
                        test = true;
                        Session.Add("User", myDataReadert["Username"]);
                        Session.Add("National_ID", myDataReadert["National_ID"]);
                        Session.Add("Role", myDataReadert["Role"]);
                        Session.Add("Name", myDataReadert["Full_names"]);



                        //Session.Add("Reff", myDataReadert["Station_ref"]);

                    }
                    else
                    {
                         test = false;
                    }


                }
            }
        }

        public void LoginaAgents(String sql, String Username, String Pass)
        {


            string strcon = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            //create new sqlconnection and connection to database by using connection string from web.config file  
            SqlConnection con = new SqlConnection(strcon);
            {

                using (SqlCommand StrQuer = new SqlCommand(sql, con))
                {
                    StrQuer.Parameters.AddWithValue("@Username", Username);
                    StrQuer.Parameters.AddWithValue("@password", Pass);
                    StrQuer.Connection.Open();

                    SqlDataReader myDataReadert = StrQuer.ExecuteReader();


                    if (myDataReadert.Read())
                    {
                        test = true;
                        Session.Add("User", myDataReadert["Username"]);
                        Session.Add("National_ID", myDataReadert["National_ID"]);
                        Session.Add("Role", myDataReadert["Role"]);
                        Session.Add("Name", myDataReadert["Full_names"]);
                        Session.Add("Station_ref", myDataReadert["Station_ref"]);


                        //Session.Add("Reff", myDataReadert["Station_ref"]);

                    }
                    else
                    {
                        test = false;
                    }


                }
            }
        }

    }
}