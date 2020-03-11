using System;
using System.Collections.Generic;
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

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            auth.login("Select *from Agents_Reg where National_ID='" + TextBox1.Text + "' or Username='" + TextBox3.Text + "'");
            if (auth.log)
            {
                Label2.Text = "Error! The user with above ID or Username already exist!.";
            }
            else
            {
                OpenClass.inserting("Insert into Agents_Reg(Station_ref,National_ID,Full_names,Username,Password,Location,Phone,Role) VALUES('"+DropDownList1.SelectedItem.Value+"','"+TextBox1.Text+"','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox7.Text + "','2')");
                OpenClass.ClearInputs(Page.Controls);
                TextBox4.Text = "12345678";
                Label2.Text = "Submitted successfully!";

            }

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            OpenClass.ClearAllInputs(Page.Controls);
            TextBox4.Text = "12345678";

        }
    }
}