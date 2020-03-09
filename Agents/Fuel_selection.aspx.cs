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
    public partial class Fuel_selection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT count(Fuel_type) as total,Fuel_type FROM Station_registration group by Fuel_type", cont);
                cont.Open();

                Repeater1.DataSource = cmd1.ExecuteReader();

                Repeater1.DataBind();
                cont.Close();

            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Dashboard.aspx");

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Dashboard.aspx");

        }
        protected void SelectFuel(object sender, EventArgs e)
        {

            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            Session.Add("Fuel_type", (item.FindControl("Label1") as Label).Text);
            Response.Redirect("../Agents/Dashboard.aspx");

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Petrol_station_selection.aspx");

        }
    }
}