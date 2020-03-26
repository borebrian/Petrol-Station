using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
namespace SMS
{

    public partial class Auth : System.Web.UI.Page
    {
        public Boolean check;
        public Boolean log;
        public Boolean testFuelAvaillability;
        public string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
        public Boolean testFilter;
        public Boolean testIfNegative;
        public Boolean testIfNegativeFinal;

        public void testYesterMeter(string sql)
        {
            SqlConnection cont = new SqlConnection(str);
            SqlCommand cmdt = new SqlCommand(sql, cont);
            cont.Open();
            SqlDataReader myDataReadertt = cmdt.ExecuteReader();
            if (myDataReadertt.Read())
            {
                testFuelAvaillability = true;
                Session.Add("testFuelAvaillability", "true");
            }
            else
            {
                testFuelAvaillability = false;
                Session.Add("testFuelAvaillability", "false");

            }
        }
        public void InitTwilio()
        {
            //LETS GET TWILIO CREDENTIALS
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select *from Twilio_config", con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                Session.Add("Auth", myDataReadert["Twilio_Auth"]);
                Session.Add("TwilioPhone", myDataReadert["Twilio_phone"]);
                Session.Add("TwilioSid", myDataReadert["Twilio_SID"]);

                con.Close();

            }
            else
            {
                con.Close();

            }


        }
        public void getYesterMeter(string sql)
        {
            //LETS GET TWILIO CREDENTIALS
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                // ADD YESTERSAYS METER TO SESSION
                Session.Add("yesterdayTodayMeter", myDataReadert["Current_meter"]);
                con.Close();

            }
            else
            {
                con.Close();

            }


        }
        //public void testIfNegative1(string sql)
        //{
        //    //LETS GET TWILIO CREDENTIALS
        //    string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
        //    SqlConnection con = new SqlConnection(str);
        //    SqlCommand cmd = new SqlCommand(sql, con);
        //    con.Open();
        //    SqlDataReader myDataReadert = cmd.ExecuteReader();
        //    if (myDataReadert.Read())
        //    {
        //        // ADD YESTERSAYS METER TO SESSION
        //        testIfNegative = true;
        //        con.Close();
        //        Session.Add("RemainingAmmount", myDataReadert["Current_capacity"]);
        //    }
        //    else
        //    {
        //        testIfNegative = false;
        //        con.Close();

        //    }

        //     }
        //public void testIfNegativeFinal1(string sql)
        //{
        //    if (testIfNegative)
        //    {
        //        //LETS GET TWILIO CREDENTIALS
        //        string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
        //        SqlConnection con = new SqlConnection(str);
        //        SqlCommand cmd = new SqlCommand(sql, con);
        //        con.Open();
        //        SqlDataReader myDataReadert = cmd.ExecuteReader();
        //        if (myDataReadert.Read())
        //        {
        //            // ADD YESTERSAYS METER TO SESSION
              
        //            con.Close();
        //            Session.Add("RemainingAmmount", myDataReadert["Current_capacity"]);
        //        }
        //        else
        //        {
        //            testIfNegative = false;
        //            con.Close();

        //        }
        //    }
        //    else
        //    {

        //    }

        //}
        public void testFilters(string sql)
        {
            //LETS GET TWILIO CREDENTIALS
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                // ADD YESTERSAYS METER TO SESSION
                testFilter = true;
                con.Close();

            }
            else
            {
                testFilter = false;

                con.Close();

            }


        }
        public void test(float tester)
        {
            //LETS GET TWILIO CREDENTIALS
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select *from fuel where Station_ref='"+Session["Station_ref"]+ "' and Fuel_type='"+Session["Fuel_type"] +"'", con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                if (tester > int.Parse(myDataReadert["Tank_capacity"].ToString()))
                {
                    check = true;
                }
                else
                {
                    check = false;
                }
            }
            else
            {
                con.Close();

            }


        }
        public void login(String sql)
        {

            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                log = true;
                con.Close();
            }
            else
            {
                log = false;
                con.Close();

            }


        }
        public void inserting(String sql)
        {

            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


        }
        public String Add254(string Phone)
        {

            string code = "+254";
            string newPhone = Phone.Remove(0, 1);
            string final = String.Concat(code, newPhone);


            return final.ToString();




        }
        public void SendMessage(String number,String message)
        {
            InitTwilio();

              TwilioClient.Init(Session["TwilioSid"].ToString(), Session["Auth"].ToString());

                var message1 = MessageResource.Create(
                    body: message,
                    from: new Twilio.Types.PhoneNumber(Session["TwilioPhone"].ToString()),
                    to: new Twilio.Types.PhoneNumber(number)
                );

                Console.WriteLine(message1.Sid);


            
        }
    }
}
