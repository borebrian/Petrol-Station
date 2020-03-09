using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Petrol_Station
{
    public partial class ErroeHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Label1.Text = Session["Error"].ToString();
            }
            catch(Exception ex)
            {
                Label1.Text = ex.ToString();
            }
        }
    }
}