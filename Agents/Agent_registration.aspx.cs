using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using  InsertingRecords;
using SMS;


namespace Petrol_Station.Agents
{

    public partial class Agent_registration : System.Web.UI.Page
    {

        Auth auth = new Auth();
        OpenClass OpenClass = new OpenClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox4.Text = "12345678";
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
        Auth p = new Auth();

            auth.login("Select *from Agents_Reg where National_ID='" + TextBox1.Text + "' or Username='" + TextBox3.Text + "'");
            if (auth.log)
            {
                Label2.Text = "Error! The user with above ID or Username already exist!.";
            }
            else
            {
                OpenClass.inserting("Insert into Agents_Reg(Station_ref,National_ID,Full_names,Username,Password,Location,Phone,Role) VALUES('"+DropDownList1.SelectedItem.Value+"','"+TextBox1.Text+"','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox7.Text + "','2')");
                TextBox4.Text = "12345678";
                Label2.Text = "Submitted successfully!";
                //SEND MESSAGE
                
                    string message1 = "Hae "+ TextBox2.Text+" ,Your have been registered as an fuel sales agent at "+ TextBox5.Text+ " fuel Station.\n";
                    message1 += "Your username is:YOUR NATIONAL ID";
                     message1 += " and your password is: "+ TextBox4.Text;
                    message1 += ".\nPlease use above credentials to log in every evening at 5:00pm and submit meter readings to the manager.You will be directed to set new strong password.\n Call 0712035642 for assistance.";
                    OpenClass send = new OpenClass();
                string Phone = TextBox7.Text;
                p.SendMessage(p.Add254(Phone), message1) ;
                OpenClass.ClearInputs(Page.Controls);


            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            OpenClass.ClearAllInputs(Page.Controls);
            TextBox4.Text = "12345678";

        }
        protected void complete(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Petrol_station_selection.aspx");

        }
    }
}