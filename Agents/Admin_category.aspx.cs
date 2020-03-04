using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Petrol_Station.Agents
{
    public partial class Admin_category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Manage_agents.aspx");

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Manager_reg.aspx");

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Manage_petrol_station.aspx");

        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {

        }
    }
}