using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Petrol_Station
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Redirect("/Agents/Log_in.aspx");
            //TextBox1.Text = DateTime.Now.ToString("yyyy-MM-dd");
            string i = "3.45";
            float t = float.Parse(i);
            TextBox1.Text = t.ToString();

        }
    }
}