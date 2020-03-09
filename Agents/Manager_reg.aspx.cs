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
    
    public partial class Manager_reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //Session.Add("M_ID", TextBox1.Text);
            //Session.Add("M_Fname", TextBox1.Text);
            //Session.Add("M_Fname", TextBox1.Text);
            //Session.Add("M_ID", TextBox1.Text);
            //Session.Add("M_Fname", TextBox1.Text);
            //Session.Add("M_Fname", TextBox1.Text);
            Session.Add("M_ID", TextBox1.Text);
            //Session.Add("M_Fname", TextBox1.Text);
            //Session.Add("M_Fname", TextBox1.Text);



            OpenClass p =new  OpenClass();
            p.inserting("Insert into System_Users(National_ID,Full_names,Username,Password,Location,Phone,Role) VALUES('"+TextBox1.Text+ "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" +TextBox5.Text + "','" + p.Add254(TextBox7.Text) + "','1')");

            //LETS GET TWILIO CREDENTIALS
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select *from Twilio_config", con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                string message1 = "Welcome to Fuela Petrol Stattion Management System";
                string message2 = "Your Username is:";
                string message3 = ",Password is:";
                string message4 = "Please use the credentials above to log in.NB:Remember to delete this message after recording it in a safe place!.";
                OpenClass send = new OpenClass();
                send.SendMessage(myDataReadert["Twilio_phone"].ToString(), p.Add254(TextBox7.Text), myDataReadert["Twilio_SID"].ToString(), myDataReadert["Twilio_Auth"].ToString(), "Hae " + TextBox2.Text + message1 + "." + message2 + TextBox3.Text + "," + message3 + TextBox4.Text + "." + message4);
                con.Close();
                
            }
            else
            {
                con.Close();

            }

            Response.Redirect("../Agents/Station_reg.aspx");
            p.ClearInputs(Page.Controls);

            
        }


    }

}