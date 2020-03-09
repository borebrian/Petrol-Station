using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration;

using InsertingRecords;
namespace Petrol_Station.Agents
{
    public partial class Log_in : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {


            Administrations Admin = new Administrations();

           
            Admin.Login("SELECT *FROM System_Users WHere Username=@Username and Password=@Password",TextBox5.Text,TextBox1.Text);
            if (Admin.test)
            {
                if (TextBox5.Text == "12345678")
                {
                    Response.Redirect("../Agents/Set_new_password.aspx");
                }
                else
                {
                    Response.Redirect("../Agents/Petrol_station_selection.aspx");

                }
            }
            else
            {
                OpenClass Clear = new OpenClass();
                Clear.ClearInputs(Page.Controls);
                Label4.Text = "Invalid credentials";
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Reset_pass.aspx");

        }
       
    }
}