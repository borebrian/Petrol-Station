using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace InsertingRecords
{


    public partial class OpenClass : System.Web.UI.Page
    {
        public Boolean res;
        public string phone;
        public Boolean check;

        public void inserting(String sql)
        {

            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


        }

        public void testifavailable(String sql)
        {

            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                res = true;
                phone = dr["Phone"].ToString();

                con.Close();
            }
            else
            {
                res = false;
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
                con.Close();




            }
            else
            {
                res = false;
                con.Close();

            }
        }






        public void ClearInputs(ControlCollection ctrls)
        {

            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox && ctrl.ID == "TextBox1")
                {


                }
                else if (ctrl is TextBox && ctrl.ID != "TextBox1")
                    ((TextBox)ctrl).Text = string.Empty;
                else if (ctrl is DropDownList)
                    ((DropDownList)ctrl).ClearSelection();

                ClearInputs(ctrl.Controls);
            }


        }
        public void ClearAllInputs(ControlCollection ctrls)
        {

            foreach (Control ctrl in ctrls)
            {

                if (ctrl is TextBox)
                {
                    ((TextBox)ctrl).Text = string.Empty;

                }


                ClearInputs(ctrl.Controls);
            }

        }
        public void AddToSession(String SessionName, String SessionMessage)
        {
            Session.Add(SessionName, SessionMessage);
        }
        // Generate a random number between two numbers  
        public int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }

        //ADDING +254 TO NUMBERS
        public String Add254(string Phone)
        {

            string code = "+254";
            string newPhone = Phone.Remove(0, 1);
            string final = String.Concat(code, newPhone);


            return final.ToString();




        }
        public Boolean CheckIfReffExist(String Textbox)
        {
            if (Textbox != "")
            {
                return true;
            }
            else
            {

                return false;

            }
        }



        public void SendMessage(String TwitlioPhone, String To, String Sid, String Token, String Message)
        {


            TwilioClient.Init(Sid, Token);

            var message = MessageResource.Create(
                body: Message,
                from: new Twilio.Types.PhoneNumber(TwitlioPhone),
                to: new Twilio.Types.PhoneNumber(To)
            );

            Console.WriteLine(message.Sid);


        }
        public void error(string error)
        {
            Session.Add("Error", error);


            inserting("INSERT INTO Errors(Error)VALUES('" + error + "')");
            SendMessage(Session["TwilioPhone"].ToString(), "+254728083649", Session["TwilioSid"].ToString(), Session["Auth"].ToString(), error);
            {




            }
        }
        public void seting()
        {
            
            

                check = true;


            
        }
    }
}
