using System;
using System.Collections.Generic;
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
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "part()", true);

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
    }
}