using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InsertingRecords;


namespace Petrol_Station.Agents
{
    public partial class Station_reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            OpenClass OpenClass = new OpenClass();

           
                int rand = OpenClass.RandomNumber(100000, 999999);
                TextBox1.Text = rand.ToString();
            if (Session["M_ID"] == null)
            {
               

            }
            else
            {
                TextBox2.Text = Session["M_ID"].ToString();
            }
            if (Session["firepopup"] == "true")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "final() ", true);

            }
            else
            {

            }



        }



        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            OpenClass OpenClass = new OpenClass();
            OpenClass.AddToSession("ID", TextBox2.Text);
            OpenClass.AddToSession("Reff", TextBox1.Text);
            if (OpenClass.CheckIfReffExist(TextBox1.Text))
            {
                OpenClass.inserting("Insert into Station_registration(Station_ref,National_ID,Station_name,Location) VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox5.Text + "')");
                OpenClass.ClearInputs(Page.Controls);
                Response.Redirect("../Agents/Station_reg.aspx");
                Label3.Text = "Data inserted successfully!";
            }
            else
            {

                OpenClass.inserting("Insert into Station_registration(Station_ref,National_ID,Station_name,Location) VALUES('" +Session["Reff"] + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox5.Text + "')");
                OpenClass.ClearInputs(Page.Controls);
                Label3.Text = "Data inserted successfully!";

            }
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "final() ", true);

            //Response.Redirect("../Agents/Agent_registration");
        }
        protected void finish(object sender, EventArgs e)
        {

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "final() ", true);

            Response.Redirect("../Agents/Agent_registration.aspx");
        }
        protected void insertdetails(object sender, EventArgs e)
        {

            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("SELECT *FROM Fuel WHERE Station_ref='"+ DropDownList1.SelectedItem.Value + "' AND Fuel_ref='" + DropDownList2.SelectedItem.Value + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                response.Text = "You already submitted this record please confirm";
                con.Close();

            }
            else
            {
                con.Close();
                OpenClass p = new OpenClass();
                Random random = new Random();
                int rand =random.Next(100000, 999999);
               
                p.inserting("INSERT INTO  Fuel(Station_ref,Fuel_ref,Tank_capacity,Current_capacity,Price_itre) VALUES('" + DropDownList1.SelectedItem.Value + "','" + DropDownList2.SelectedItem.Value + "','" + TextBox4.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "')");
                Session["firepopup"] = null;
                response.Text = "Submitted successfully!";

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "final()", true);
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "final() ", true);

        }
        protected void clear(object sender, EventArgs e)
        {
            TextBox3.Text = "";
            TextBox5.Text = "";
        }
    }
}