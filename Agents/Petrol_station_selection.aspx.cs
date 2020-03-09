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
    public partial class Petrol_station_selection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT *FROM Station_registration", cont);
                cont.Open();

                Repeater1.DataSource = cmd1.ExecuteReader();

                Repeater1.DataBind();
                cont.Close();

            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Fuel_selection.aspx");

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Fuel_selection.aspx");

        }
        protected void SelectStation(object sender, EventArgs e)
        {

            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            Session.Add("Station_ref", (item.FindControl("Label3") as Label).Text);
            Response.Redirect("../Agents/Fuel_selection.aspx");

        }





    }
}