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
            if (Session["User"] == null)
            {

                Response.Redirect("../Agents/Log_in.aspx");
            }
            else
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
        }



        //protected void LinkButton3_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("../Agents/Fuel_selection.aspx");

        //}
        protected void SelectStation(object sender, EventArgs e)
        {

            RepeaterItem item = (sender as LinkButton).NamingContainer as RepeaterItem;
            Session.Add("Station_ref", (item.FindControl("Label3") as Label).Text);
            Session.Add("Station_name", (item.FindControl("Label1") as Label).Text);
            //Response.Redirect("../Agents/Fuel_selection.aspx");
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT *FROM Fuel where Station_ref='" + Session["Station_ref"] + "'", cont);
                //SqlCommand cmd2 = new SqlCommand("SELECT Fuel_type FROM Station_registration where Station_ref='" + Session["Station_ref"] + "'  group by Fuel_type", cont);

                cont.Open();


                SqlDataReader d = cmd1.ExecuteReader();
                if (d.Read())
                {
                    cont.Close();

                    Response.Redirect("../Agents/Fuel_selection.aspx");

                }
                else
                {
                    cont.Close();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "seting()", true);
                }
                //}
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "seting()", true);

            }
        }

        protected void LinkButton16_Click(object sender, EventArgs e)
        {
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT *FROM Station_registration where Station_name like'%"+ TextBox1.Text+ "%' OR Location='%" + TextBox1.Text+"%'", cont);
                cont.Open();

                Repeater1.DataSource = cmd1.ExecuteReader();

                Repeater1.DataBind();
                cont.Close();

            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT *FROM Station_registration where Station_name like'%" + TextBox1.Text + "%' OR Location='%" + TextBox1.Text + "%'", cont);
                cont.Open();

                Repeater1.DataSource = cmd1.ExecuteReader();

                Repeater1.DataBind();
                cont.Close();

            }
        }
        protected void set(object sender, EventArgs e)
        {
            Session.Add("firepopup", "true");
            Response.Redirect("../Agents/Station_reg.aspx");


        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "seting()", true);

        }
    }
}