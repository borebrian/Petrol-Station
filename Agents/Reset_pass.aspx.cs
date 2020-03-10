using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InsertingRecords;


namespace Petrol_Station.Agents
{
    public partial class Reset_pass : System.Web.UI.Page
    {
        public Boolean reset;

        public Boolean verify;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Visible = false;
                LinkButton3.Visible = false;
                LinkButton2.Visible = false;
            }



            getSms();
          


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Log_in.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if(!reset)
            {
                
                getSms();
                send();
            }
            else
            {
                if (Session["Random"] == TextBox5.Text)
                {
                    Response.Redirect("../Reset_pass.aspx");
                }
                else
                {
                    Label2.Text = "Invalid code consider resending if you didnt receive.";
                }
            }
           

            //Response.Redirect("../Agents/Set_new_password.aspx");

        }
        void send()
        {
            OpenClass p = new OpenClass();
            p.testifavailable("SELECT *FROM System_Users where  National_ID='" + TextBox5.Text + "'");
            if (p.res)
            {
                var random = new Random();
                int randomnumber = random.Next(9999);
                string message = "Fuela password verification code:" + randomnumber;
                Session.Add("Random", randomnumber);
                p.SendMessage(Session["TwilioPhone"].ToString(), p.phone, Session["TwilioSid"].ToString(), Session["Auth"].ToString(), message);
                verify = true;
                p.seting();
                sent();
                Session.Add("User", TextBox5.Text);
          


                p.ClearInputs(Page.Controls);
            }
            else if(!p.res)
            {
                p.testifavailable("SELECT *FROM Agents_Reg WHERE National_ID='" + TextBox5.Text + "'");
                if (p.res)
                {
                    var random = new Random();
                    int randomnumber = random.Next(9999);
                    string message = "Fuela password verification code:" + randomnumber;
                    Session.Add("Random", randomnumber);
                    p.SendMessage(Session["TwilioPhone"].ToString(), p.phone, Session["TwilioSid"].ToString(), Session["Auth"].ToString(), message);

                    sent();
                    Session.Add("User", TextBox5.Text);
                p.seting();
            

                   


                }
                else
                {
                Session.Add("check", "2");

                    Label2.Text = "ID not found!! Please check and try again!";

                }

            }
            else
            {

            }

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            OpenClass p = new OpenClass();
            getSms();
            send1();

        }
        public void getSms()
        {
            //LETS GET TWILIO CREDENTIALS
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select *from Twilio_config", con);
            con.Open();
            try
            {
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
            catch (Exception ex)
            {
                


            }
        }
        void send1()
        {
            getSms();
            OpenClass p = new OpenClass();
            p.testifavailable("SELECT *FROM System_Users where  National_ID='" + Session["User"] + "'");
            if (p.res)
            {
                var random = new Random();
                int randomnumber = random.Next(9999);
                string message = "Fuela password verification code:" + randomnumber;
                Session.Add("Random", randomnumber);
                p.SendMessage(Session["TwilioPhone"].ToString(), p.phone, Session["TwilioSid"].ToString(), Session["Auth"].ToString(), message);
                verify = true;
                p.seting();
                sent();
               



                p.ClearInputs(Page.Controls);
            }
            else if (!p.res)
            {
                p.testifavailable("SELECT *FROM Agents_Reg WHERE National_ID='" + Session["User"] + "'");
                if (p.res)
                {
                    var random = new Random();
                    int randomnumber = random.Next(1000,9999);
                    string message = "Fuela password verification code:" + randomnumber;
                    Session.Add("Random", randomnumber);
                    p.SendMessage(Session["TwilioPhone"].ToString(), p.phone, Session["TwilioSid"].ToString(), Session["Auth"].ToString(), message);

                    sent();
                   
                    p.seting();





                }
                else
                {
                    Session.Add("check", "2");

                    Label2.Text = "Id not found!! Please check and try again!";

                }

            }
            else
            {

            }

        }
        void sent()
        {

            TextBox1.Visible = true;
            LinkButton3.Visible = true;
            LinkButton4.Visible = false;
            
            LinkButton2.Visible = true;
            TextBox5.Visible = false;
            Label2.Text = "We have sent an SMS containing four digits verification code to the number used during registration! Please use the number to verify its you.";



        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            if (Session["Random"].ToString() == TextBox1.Text)
            {
                Response.Redirect("../Agents/Set_new_password.aspx");
            }
            else
            {
                Label2.Text = "Wrong verification code";
            }
        }
    }
}