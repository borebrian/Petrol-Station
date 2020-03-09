using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Petrol_Station.Agents
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string height = "100px";
            tank.Style.Add("height", height);
            this.clickArea.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(this.clickArea, string.Empty));
            if (IsPostBack && Request["__EVENTTARGET"] == clickArea.UniqueID)
            {
                clickArea_Click(clickArea, EventArgs.Empty);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label5.Text = "dshfsjfshfs";
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Clicked')", true);
        }
        protected void clickArea_Click(object sender, EventArgs e)
        {
            //Response.Write("you clicked the div clickArea");
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction","part()", true);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " twilio()", true);



        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Sales_category.aspx");

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Admin_category.aspx");

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Sales_category.aspx");

        }
        public void setTank()
        {
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("SELECT *FROM Station_registration WHERE Station_ref", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                con.Close();




            }
            else
            {
              
                con.Close();

            }
        }
    }
}