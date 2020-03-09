using System;
using System.Collections.Generic;
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
            }
            else
            {

                OpenClass.inserting("Insert into Station_registration(Station_ref,National_ID,Station_name,Location) VALUES('" +Session["Reff"] + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox5.Text + "')");
                OpenClass.ClearInputs(Page.Controls);
            }
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Agent_registration");
        }
        protected void clear(object sender, EventArgs e)
        {
            TextBox3.Text = "";
            TextBox5.Text = "";
        }
    }
}