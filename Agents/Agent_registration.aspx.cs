using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using  InsertingRecords;


namespace Petrol_Station.Agents
{
    public partial class Agent_registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            OpenClass OpenClass = new OpenClass();
            OpenClass.inserting("Insert into Agents_Reg(National_ID,Full_names,Username,Password,Location,Phone,Role,Station_ref) VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox7.Text + "','1','"+Session["Reff"]+"')");
            OpenClass.ClearInputs(Page.Controls);

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Agents/Log_in.aspx");
        }
    }
}