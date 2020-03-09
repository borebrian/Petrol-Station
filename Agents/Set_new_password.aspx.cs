using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InsertingRecords;

namespace Petrol_Station.Agents
{
    public partial class Set_new_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == TextBox5.Text)
            {
                OpenClass update = new OpenClass();
                update.inserting("UPDATE System_Users SET password='"+TextBox5.Text+ "' WHERE National_ID='" + Session["User"]+"'");
                update.inserting("UPDATE Agents_Reg SET password='" + TextBox5.Text + "' WHERE National_ID='" + Session["User"] + "'");
                Session.Clear();
                Response.Redirect("../Agents/Log_in.aspx");
            }
            else
            {
                Label2.Text = "The password do not match";
            }
        }
    }
}