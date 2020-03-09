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
            if (Session["User"] == null)
            {
                Response.Redirect("../Agents/Log_in.aspx");
            }
            else
            {

                float Pixelheight = 200;
                String unit = "px";

                string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
                SqlConnection con = new SqlConnection(str);
                SqlCommand cmd = new SqlCommand("SELECT *FROM Fuel WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_type"] + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    {
                        float totalcapacity = int.Parse(dr["Tank_capacity"].ToString());
                        float currentCapacity = int.Parse(dr["Current_capacity"].ToString());
                        float toDisplay = ((currentCapacity / totalcapacity) * Pixelheight);
                        float InverseDisplay = Pixelheight - toDisplay;
                        string InverseDisplayConverted = String.Concat(InverseDisplay, unit);

                        tank.Style.Add("height", InverseDisplayConverted);

                        Label5.Text = dr["Current_capacity"].ToString();
                        Label14.Text = Session["Station_name"].ToString();
                        Label8.Text = dr["Price_itre"].ToString();
                        Label18.Text = Session["Fuel_type"].ToString();
                        Label15.Text = Session["Fuel_type"].ToString();

                        //CHANGE TANK COLOR
                        if (currentCapacity <= ((totalcapacity / 6) * 1))
                        {
                            clickArea.Style.Add("Background-color", "#D3001A;");
                            tank.Style.Add("border-bottom-left-radius", "50px");

                            tank.Style.Add("border-bottom-right-radius", "50px");
                            Label5.Text = dr["Current_capacity"].ToString();
                            Label9.Text = dr["Price_itre"].ToString();

                        }
                        else if (currentCapacity < ((totalcapacity / 6) * 2))
                        {
                            clickArea.Style.Add("Background-color", "#D34C5D");

                        }
                        else if (currentCapacity < ((totalcapacity / 6) * 3))
                        {
                            clickArea.Style.Add("Background-color", "#DA98A0");

                        }
                        else if (currentCapacity < ((totalcapacity / 6) * 4))
                        {
                            clickArea.Style.Add("Background-color", "#BAD1BC");

                        }
                        else if (currentCapacity < ((totalcapacity / 6) * 5))
                        {
                            clickArea.Style.Add("Background-color", "#BAD1BC");

                        }
                        else if (currentCapacity < ((totalcapacity / 6) * 6))
                        {
                            clickArea.Style.Add("Background-color", "#8BD99F");
                            //ammount.Style.Add("color", "white");

                        }
                        else
                        {
                            clickArea.Style.Add("Background-color", "#0F7E2C");

                        }











                        con.Close();
                        this.clickArea.Attributes.Add("onclick", Page.ClientScript.GetPostBackEventReference(this.clickArea, string.Empty));
                        if (IsPostBack && Request["__EVENTTARGET"] == clickArea.UniqueID)
                        {
                            clickArea_Click(clickArea, EventArgs.Empty);
                        }
                    }
                }
                else
                {
                    con.Close();
                    Response.Redirect("../Agents/Fuel_selection.aspx");
                }
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
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "part()", true);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " twilio()", true);



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
        void changeColor()
        {

        }
    }
}