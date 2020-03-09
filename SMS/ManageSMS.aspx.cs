using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InsertingRecords;


namespace Petrol_Station.SMS
{
    public partial class ManageSMS : System.Web.UI.Page
    {
        public Boolean exist;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
            else
            {
                refresh();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " twilio()", true);

                
            }
            }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (exist)
            {
                OpenClass Send = new OpenClass();
                Send.inserting("Insert into Twilio_config(Twilio_Auth,Twilio_SID,Twilio_phone) VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "')");
                Label1.ForeColor = System.Drawing.Color.Green;
                Label1.Text = "Submitted successfully!";

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " twilio()", true);
            }
            else
            {
                OpenClass Send = new OpenClass();
                Send.inserting("update  Twilio_config SET Twilio_Auth='" + TextBox1.Text + "' ,Twilio_SID='" + TextBox2.Text + "',Twilio_phone='" + TextBox3.Text + "'");
                Label1.ForeColor = System.Drawing.Color.Green;
                Label1.Text = "Updated successfully!";

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " twilio()", true);
            }
        }
        protected void validate(object sender, EventArgs e)
        {
            if (TextBox4.Text == "bore100000")
            {

            }
            else
            {
                Label2.Text = "Invalid password!!";
                Label2.ForeColor = System.Drawing.Color.Red;

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " twilio()", true);

            }
        }

        public void refresh()
        {
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select *from Twilio_config", con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                TextBox1.Text = myDataReadert["Twilio_Auth"].ToString();
                TextBox2.Text = myDataReadert["Twilio_SID"].ToString();
                TextBox3.Text = myDataReadert["Twilio_phone"].ToString();
                exist = true;
                con.Close();
            }
            else
            {
                con.Close();

            }
        }
    }
}