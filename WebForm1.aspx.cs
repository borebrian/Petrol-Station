﻿using System;
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
            float a = 1;
            float b = 2;
            float c = (a / b);
            TextBox1.Text = c.ToString();
        }
    }
}