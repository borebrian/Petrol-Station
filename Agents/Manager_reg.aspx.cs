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
    public partial class Manager_reg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Add("M_ID", TextBox1.Text);
            Session.Add("M_Fname", TextBox1.Text);
            Session.Add("M_Fname", TextBox1.Text);
            Session.Add("M_ID", TextBox1.Text);
            Session.Add("M_Fname", TextBox1.Text);
            Session.Add("M_Fname", TextBox1.Text);
            Session.Add("M_ID", TextBox1.Text);
            Session.Add("M_Fname", TextBox1.Text);
            Session.Add("M_Fname", TextBox1.Text);



            OpenClass p =new  OpenClass();
            p.inserting("Insert into System_Users(National_ID,Full_names,Username,Password,Location,Phone,Role) VALUES('"+TextBox1.Text+ "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox7.Text + "','1')");
            Response.Redirect("../Agents/Station_reg.aspx");
            p.ClearInputs(Page.Controls);

            
        }


    }

}