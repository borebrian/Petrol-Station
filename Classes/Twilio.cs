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
