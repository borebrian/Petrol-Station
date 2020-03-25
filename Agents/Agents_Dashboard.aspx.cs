using InsertingRecords;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using SMS;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;

namespace Petrol_Station.Agents

{
    public partial class Agents_Dashboard : System.Web.UI.Page
    {
        private OpenClass general = new OpenClass();
        private Auth generalClass = new Auth();
        private string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();

        protected void changeStfinishSubmisiionation(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Petrol_station_selection.aspx");

            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Clicked')", true);
        }

        protected void MakeDatatable(string sql1)
        {
            DataTable dt = new DataTable();
            string queryString = sql1;
            Session.Add("sql", queryString);
            string conn = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            var table = new DataTable();
            using (SqlConnection sql = new SqlConnection(conn))
            {
                SqlCommand command = new SqlCommand(queryString, sql);
                sql.Open();
                SqlDataAdapter da = new SqlDataAdapter(command);
                da.Fill(table);
                sql.Close();
                da.Dispose();
            }
            dt = table;

            Session["Data"] = dt;
        }

        protected void filterRecords(object sender, EventArgs e)
        {
            string newDate = DropDownList1.SelectedItem.Value;
            string newMonth = DropDownList2.SelectedItem.Value;
            string newYear = DropDownList3.SelectedItem.Value;

            generalClass.testFilters("SELECT * FROM Sales_records Where Station_ref = '" + Session["Station_ref"] + "' AND MONTH = '" + newMonth + "' AND DATE = '" + newDate + "' AND YEAR = '" + newYear + "'");
            if (generalClass.testFilter)
            {
                LinkButton9.Visible = true;
                Label30.ForeColor = System.Drawing.Color.Green;
                Label30.Text = "Results";
            }
            else
            {
                Label30.Text = "No records found!.";

                Label30.ForeColor = System.Drawing.Color.Red;

                LinkButton9.Visible = false;
            }
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "' AND MONTH='" + DropDownList2.SelectedItem.Value + "' AND DATE='" + DropDownList1.SelectedItem.Value + "' AND YEAR='" + DropDownList3.SelectedItem.Value + "'", cont);
                cont.Open();

                SqlDataReader dr = cmd1.ExecuteReader();

                Repeater2.DataSource = dr;
                Repeater2.DataBind();
                Session.Add("sql", "SELECT *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "' AND MONTH='" + DropDownList2.SelectedItem.Value + "' AND DATE='" + DropDownList1.SelectedItem.Value + "' AND YEAR='" + DropDownList3.SelectedItem.Value + "'");
                MakeDatatable(Session["sql"].ToString());
                cont.Close();
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "sales1()", true);
        }

        protected void searchrecords(object sender, EventArgs e)
        {
            LinkButton9.Visible = true;
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT TOP 10  *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "'", cont);
                cont.Open();

                SqlDataReader dr = cmd1.ExecuteReader();

                Repeater2.DataSource = dr;
                Repeater2.DataBind();
                //GridView1.DataSource = cmd1.ExecuteReader();
                //GridView1.DataBind();
                cont.Close();
            }
            Session.Add("sql", "SELECT TOP 10  *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "'");
            MakeDatatable(Session["sql"].ToString());

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "sales1()", true);
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Sales_category.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Sales_category.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Admin_category.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("../Agents/Log_in.aspx");
            }
            else
            {
                //INITIALIZE TWILIO AUTH
                Auth s = new Auth();
                s.InitTwilio();
                actions();
                populateFuel();
                Label9.Text = Session["name"].ToString();
                Label1.Text = Session["National_ID"].ToString();
                //actionTab.Visible = false;
            }
        }

        protected void testtt(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);
        }

        protected void logout(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("../Agents/Log_in.aspx");
        }

        protected void submitdiesel(object sender, EventArgs e)
        {
            try
            {
                Session.Add("Fuel_category", "DIESEL");

                //CHECK IF TODAY SALES HAVE BEEN SUBMITTED
                string today = DateTime.Now.ToString("dd");
                string month = DateTime.Now.ToString("MM");
                string year = DateTime.Now.ToString("yyyy");
                string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
                SqlConnection con = new SqlConnection(str);
                SqlCommand cmd = new SqlCommand("SELECT *from Sales where Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_category"] + "' AND Month='" + month + "' AND Date='" + today + "' AND Year='" + year + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                //TODAYS RECORDS EXISTS LETS NOTIFY USER THAT HE HAS SUBMITTED
                if (dr.Read())
                {
                    populatefinal(Session["Fuel_category"].ToString());

                    //Label35.Text = "You have already submitted todays sales please contact manager for more details.";
                    alreadySubmitted("DIESEL");
                    table1.Visible = false;
                    table2.Visible = false;
                    table3.Visible = false;
                    table6.Visible = false;
                    tableconfirm.Visible = true;
                }

                //TODAYS RECORDS DOES NOT EXISTS
                else
                {
                    //CHECK IF ITS FIRST TIME TRANSACTION
                    SqlConnection con1 = new SqlConnection(str);
                    SqlCommand cmd1 = new SqlCommand("SELECT *FROM Meter_Readingss WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' ", con1);
                    con1.Open();
                    SqlDataReader dr1 = cmd1.ExecuteReader();

                    //ITS NOT FIRST TIME TRANSACTION
                    if (dr1.Read())
                    {
                        //SqlConnection con15 = new SqlConnection(str);
                        //SqlCommand cmd15 = new SqlCommand("SELECT *FROM Sales WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "'", con15);
                        //con15.Open();
                        //SqlDataReader dr15 = cmd15.ExecuteReader();
                        //if (dr15.Read())
                        //{
                        Session["testFuelAvaillability"] = "true";//-This allows submission of todays meter only.
                        //SET ONE TEXT BOX  TO BE VISIBLE
                        setLabels("DIESEL");
                        table1.Visible = false;
                        table3.Visible = true;
                        table2.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;
                    }

                    //ITS FIRST TIME TRANSACTION
                    else
                    {
                        Session["testFuelAvaillability"] = "false";//-This allows submission of first tie data.
                        //SET TWO TEXT BOX  TO BE VISIBLE
                        setLabels("DIESEL");
                        table1.Visible = true;
                        table2.Visible = false;
                        table3.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;
                    }
                    con1.Close();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Label38.Text = ex.ToString();
                Label38.ForeColor = System.Drawing.Color.Red;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
        }

        protected void submitparafin(object sender, EventArgs e)
        {
            try
            {
                Session.Add("Fuel_category", "PETROL2");

                //CHECK IF TODAY SALES HAVE BEEN SUBMITTED
                string today = DateTime.Now.ToString("dd");
                string month = DateTime.Now.ToString("MM");
                string year = DateTime.Now.ToString("yyyy");
                string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
                SqlConnection con = new SqlConnection(str);
                SqlCommand cmd = new SqlCommand("SELECT *from Sales where Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_category"] + "' AND Month='" + month + "' AND Date='" + today + "' AND Year='" + year + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                //TODAYS RECORDS EXISTS LETS NOTIFY USER THAT HE HAS SUBMITTED
                if (dr.Read())
                {
                    populatefinal(Session["Fuel_category"].ToString());

                    //Label35.Text = "You have already submitted todays sales please contact manager for more details.";
                    alreadySubmitted("PETROL2");
                    table1.Visible = false;
                    table2.Visible = false;
                    table3.Visible = false;
                    table6.Visible = false;
                    tableconfirm.Visible = true;
                }

                //TODAYS RECORDS DOES NOT EXISTS
                else
                {
                    //CHECK IF ITS FIRST TIME TRANSACTION
                    SqlConnection con1 = new SqlConnection(str);
                    SqlCommand cmd1 = new SqlCommand("SELECT *FROM Meter_Readingss WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' ", con1);
                    con1.Open();
                    SqlDataReader dr1 = cmd1.ExecuteReader();

                    //ITS NOT FIRST TIME TRANSACTION
                    if (dr1.Read())
                    {
                        //SqlConnection con15 = new SqlConnection(str);
                        //SqlCommand cmd15 = new SqlCommand("SELECT *FROM Sales WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "'", con15);
                        //con15.Open();
                        //SqlDataReader dr15 = cmd15.ExecuteReader();
                        //if (dr15.Read())
                        //{
                        Session["testFuelAvaillability"] = "true";//-This allows submission of todays meter only.
                        //SET ONE TEXT BOX  TO BE VISIBLE
                        setLabels("PETROL2");
                        table1.Visible = false;
                        table3.Visible = true;
                        table2.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;
                    }

                    //ITS FIRST TIME TRANSACTION
                    else
                    {
                        Session["testFuelAvaillability"] = "false";//-This allows submission of first tie data.
                        //SET TWO TEXT BOX  TO BE VISIBLE
                        setLabels("PETROL2");
                        table1.Visible = true;
                        table2.Visible = false;
                        table3.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;
                    }
                    con1.Close();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Label38.Text = ex.ToString();
                Label38.ForeColor = System.Drawing.Color.Red;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
        }

        protected void submitpetrol(object sender, EventArgs e)
        {
            try
            {
                Session.Add("Fuel_category", "PETROL1");

                //CHECK IF TODAY SALES HAVE BEEN SUBMITTED
                string today = DateTime.Now.ToString("dd");
                string month = DateTime.Now.ToString("MM");
                string year = DateTime.Now.ToString("yyyy");
                string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
                SqlConnection con = new SqlConnection(str);
                SqlCommand cmd = new SqlCommand("SELECT *from Sales where Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_category"] + "' AND Month='" + month + "' AND Date='" + today + "' AND Year='" + year + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                //TODAYS RECORDS EXISTS LETS NOTIFY USER THAT HE HAS SUBMITTED
                if (dr.Read())
                {
                    populatefinal(Session["Fuel_category"].ToString());

                    //Label35.Text = "You have already submitted todays sales please contact manager for more details.";
                    alreadySubmitted("PETROL1");
                    table1.Visible = false;
                    table2.Visible = false;
                    table3.Visible = false;
                    table6.Visible = false;
                    tableconfirm.Visible = true;
                }

                //TODAYS RECORDS DOES NOT EXISTS
                else
                {
                    //CHECK IF ITS FIRST TIME TRANSACTION
                    SqlConnection con1 = new SqlConnection(str);
                    SqlCommand cmd1 = new SqlCommand("SELECT *FROM Meter_Readingss WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' ", con1);
                    con1.Open();
                    SqlDataReader dr1 = cmd1.ExecuteReader();

                    //ITS NOT FIRST TIME TRANSACTION
                    if (dr1.Read())
                    {
                        //SqlConnection con15 = new SqlConnection(str);
                        //SqlCommand cmd15 = new SqlCommand("SELECT *FROM Sales WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "'", con15);
                        //con15.Open();
                        //SqlDataReader dr15 = cmd15.ExecuteReader();
                        //if (dr15.Read())
                        //{
                        Session["testFuelAvaillability"] = "true";//-This allows submission of todays meter only.
                        //SET ONE TEXT BOX  TO BE VISIBLE
                        setLabels("PETROL1");
                        table1.Visible = false;
                        table3.Visible = true;
                        table2.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;
                    }

                    //ITS FIRST TIME TRANSACTION
                    else
                    {
                        Session["testFuelAvaillability"] = "false";//-This allows submission of first tie data.
                        //SET TWO TEXT BOX  TO BE VISIBLE
                        setLabels("PETROL1");
                        table1.Visible = true;
                        table2.Visible = false;
                        table3.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;
                    }
                    con1.Close();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Label38.Text = ex.ToString();
                Label38.ForeColor = System.Drawing.Color.Red;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
        }

        private void insertingMeters()
        {
            try
            {
                var random = new Random();
                int randomnumber = random.Next(100000, 999999);
                string date = DateTime.Now.ToString("dd");
                string month = DateTime.Now.ToString("MM");
                string year = DateTime.Now.ToString("yyyy");

                //WE ALREADY HAVE YESTERDAY METER LETS UPDATE IT
                if (Session["testFuelAvaillability"] == "true")
                {
                    SqlConnection con12 = new SqlConnection(str);
                    SqlCommand cmd12 = new SqlCommand("SELECT *FROM Meter_Readingss WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' ", con12);
                    con12.Open();
                    SqlDataReader dr1 = cmd12.ExecuteReader();
                    if (dr1.Read())
                    {
                        //LETS UPDATE METER READINGS TABLE
                        generalClass.inserting("UPDATE Meter_Readingss SET Date='" + date + "',Month='" + month + "',Year='" + year + "',Meter='" + TextBox5.Text + "',Agent_ID='" + Session["National_ID"] + "',Prev_meter='" + dr1["Meter"].ToString() + "' WHERE Fuel_Type='" + Session["Fuel_category"] + "' AND Station_Ref='" + Session["Station_Ref"] + "'");
                        //1.0 LETS INSERT METER RECORDS
                        generalClass.inserting("INSERT INTO Meter_records(Station_ref,Date,Month,Year,Previous_meter,Current_meter,Agent_ID,Fuel_Type,Ref) VALUES('" + Session["Station_Ref"] + "','" + date + "','" + month + "','" + year + "','" + dr1["Meter"] + "','" + TextBox5.Text + "','" + Session["National_ID"] + "','" + Session["Fuel_category"] + "','" + randomnumber + "')");
                        Session.Add("Records_ref", randomnumber);
                        updateTank();
                        //generalClass.inserting("UPDATE Meter_Readingss SET Date='" + date + "',Month='" + month + "',Year='" + year + "',Meter='" + Label37.Text + "',Agent_ID='" + Session["National_ID"] + "' WHERE Fuel_Type='" + Session["Fuel_category"] + "' AND Station_Ref='" + Session["Station_Ref"] + "'");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);
                    }
                }
                else
                {
                    //WE DONT HAVE YESTERDAY METER LETS INSERT  IT

                    //1.0 Lets insert into metter readings
                    generalClass.inserting("INSERT INTO  Meter_Readingss(Date,Month,Year,Prev_meter,Meter,Agent_ID,Station_ref,Fuel_Type)VALUES('" + date + "','" + month + "','" + year + "','" + Label25.Text + "','" + Label26.Text + "','" + Session["National_ID"] + "','" + Session["Station_Ref"] + "','" + Session["Fuel_category"] + "')");
                    //1.1 Lets insert into meter records
                    generalClass.inserting("INSERT INTO Meter_records(Station_ref,Date,Month,Year,Previous_meter,Current_meter,Agent_ID,Fuel_type,Ref)VALUES('" + Session["Station_Ref"] + "','" + date + "','" + month + "','" + year + "','" + Label26.Text + "','" + Label25.Text + "','" + Session["National_ID"] + "','" + Session["Fuel_category"] + "','" + randomnumber + "')");
                    Session.Add("Records_ref", randomnumber);
                    updateTank();
                    //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);
                }
            }
            catch (Exception ex)
            {
                Label38.Text = ex.ToString();
                Label38.ForeColor = System.Drawing.Color.Red;
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
        }

        private void alreadySubmitted(string fuel)
        {
            Label35.Text = "You have already submitted todays " + fuel + " sales please contact manager for more information!!";
        }

        private void setLabels(String Fuel_type)
        {
            if (Fuel_type == "PETROL1")
            {
                Label35.Text = "Confirmed Tank1 petrol  meter submitted successfully!.An SMS notification has been sent to the Manager";
                Label24.Text = "Please confirm petrol meter readings before proceeding!";
                Label23.Text = "Petrol meter confirmation";
                Label22.Text = "Please enter previous day and today's meter readings of petrol as indicated below!";
                Label21.Text = "Petrol meter";
                Label27.Text = "Petrol";
                Label28.Text = "Please enter today's petrol meter readings as indicated on the fuel dispenser meter.";
                //Label36.Text = "Petrol meter readings:";
            }
            else if (Fuel_type == "DIESEL")
            {
                Label35.Text = "Confirmed diesel meter submitted successfully!.An SMS notification has been sent to the Manager";

                Label24.Text = "Please confirm diesel meter readings before proceeding!";
                Label23.Text = "diesel meter confirmation";
                Label22.Text = "Please enter previous day and today's meter readings of diesel as indicated below!";
                Label21.Text = "diesel meter";
                Label27.Text = "diesel";
                Label28.Text = "Please enter today's diesel meter readings as indicated on the fuel dispenser meter.";
                //Label36.Text = "diesel meter readings:";
            }
            else
            {
                Label35.Text = "Confirmed Tank2 petrol meter submitted successfully!.An SMS notification has been sent to the Manager";

                Label24.Text = "Please confirm PETROL2 meter readings before proceeding!";
                Label23.Text = "PETROL2 meter confirmation";
                Label22.Text = "Please enter previous day and today's meter readings of PETROL2 as indicated below!";
                Label21.Text = "PETROL2 meter";
                Label27.Text = "PETROL2";
                Label28.Text = "Please enter today's PETROL2 meter readings as indicated on the fuel dispenser meter.";
                //Label36.Text = "PETROL2 meter readings:";
            }
        }

        private void actions()
        {
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("SELECT *FROM Station_registration WHERE Station_ref='" + Session["Station_ref"] + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Label10.Text = dr["Station_name"].ToString();
                Label14.Text = dr["Location"].ToString();
                Label18.Text = dr["Station_name"].ToString();

                con.Close();
            }
            else
            {
                con.Close();
            }
        }

        private void populateFuel()
        {
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                {
                    SqlCommand cmd2 = new SqlCommand("SELECT *FROM Current_fuel_details where Station_ref='" + Session["Station_ref"] + "'", cont);
                    cont.Open();
                    Repeater1.DataSource = cmd2.ExecuteReader();
                    Repeater1.DataBind();

                    cont.Close();
                }
                {
                    using (SqlConnection cont1 = new SqlConnection(CSY))
                    {
                        SqlCommand cmd3 = new SqlCommand("SELECT *FROM Current_fuel_details where Station_ref='" + Session["Station_ref"] + "'", cont);
                        cont.Open();
                        SqlDataReader dr1 = cmd3.ExecuteReader();
                        if (dr1.Read())
                        {
                            Session.Add("myMeter", dr1["Current_capacity"]);
                            TextBox1.Text = Session["myMeter"].ToString();
                        }
                        cont.Close();
                    }
                }
            }
        }

        protected void pdf(object sender, EventArgs e)
        {
            pdfDownload();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        private void pdfDownload()
        {
            SqlConnection con12 = new SqlConnection(str);
            SqlCommand cmd12 = new SqlCommand("SELECT *FROM Station_registration WHERE  Station_Ref='" + Session["Station_ref"] + "'", con12);
            con12.Open();
            SqlDataReader dr1 = cmd12.ExecuteReader();
            if (dr1.Read())
            {
                using (StringWriter sw = new StringWriter())
                {
                    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                    {
                        //To Export all pages
                        //GridView1.AllowPaging = false;
                        //topdf.RenderControl(hw);
                        //StringReader sr = new StringReader(sw.ToString());
                        //Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                        //HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
                        //PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                        //pdfDoc.Open();
                        //htmlparser.Parse(sr);
                        //pdfDoc.Close();
                        //Response.ContentType = "application/pdf";
                        //Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
                        //Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        //Response.Write(pdfDoc);
                        //Response.End();

                        string Err = string.Empty;
                        DataTable dt = (DataTable)Session["Data"];
                        Document pdfDocument = new Document();
                        StringBuilder sb = new StringBuilder();
                        if (dt.Rows.Count > 0)
                        {
                            sb.Append("<html>< head ><title></title></head><body>");
                            string strActualRecords = string.Empty;
                            strActualRecords = "<table   style=\";font-size: 9pt\"  border=\"1\" cellspacing=\"0\" cellpadding=\"1\">";
                            strActualRecords += "<tr><td>Station:</td><td>" + dr1["Station_name"] + "</td></tr>";
                            strActualRecords += "<tr><td>Date generated:</td><td>" + DateTime.Now.ToString() + "</td></tr></table>";

                            strActualRecords += "<table style=\";font-size: 7pt; font-family: 'Century gothic';background-color:red; \" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">";
                            strActualRecords += "<tr style=\"background-color:#68213A;\" > " +
                                "<td>AGENT</td>" +
                                "<td>FUEL</td>" +

                                "<td>DATE</td>" +
                                "<td>MONTH</td>" +
                                "<td>YEAR</td>" +
                                "<td>PREV.M</td>" +
                                "<td>CURRENT.M</td>" +
                                "<td>VOLUME SOLD</td>" +
                                "<td>TOTAL Ksh.</td></tr>";
                            for (int i = 0; i < dt.Rows.Count; i++)
                            {
                                strActualRecords += "<tr><td >" + dt.Rows[i]["AGENT"].ToString() + "</td>" +
                                    "<td>" + dt.Rows[i]["FUEL"].ToString() + "</td>" +

                                    "<td>" + dt.Rows[i]["DATE"].ToString() + "</td>" +
                                    "<td >" + dt.Rows[i]["MONTH"].ToString() + "</td>" +
                                    "<td >" + dt.Rows[i]["YEAR"].ToString() + "</td>" +
                                    "<td >" + dt.Rows[i]["PREVIOUS METER"].ToString() + "</td>" +
                                    "<td >" + dt.Rows[i]["CURRENT METER"].ToString() + "</td>" +
                                    "<td >" + dt.Rows[i]["VOLUME SOLD"].ToString() + "</td>" +
                                    "<td >" + dt.Rows[i]["SALES"].ToString() + "/=</td>"; 

                                
                                strActualRecords += "</tr>";
                            }
                            strActualRecords += "</table>";
                            sb.Append(strActualRecords);
                            sb.Append("<p style=\"font-size:5pts\">Powered by Fuela</p></body></html>");
                        }
                        string pdffilename = DateTime.Now.Ticks.ToString() + ".pdf";
                        PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDocument, HttpContext.Current.Response.OutputStream);
                        pdfDocument.Open();
                        String htmlText = sb.ToString();
                        StringReader str = new StringReader(htmlText);
                        HTMLWorker htmlworker = new HTMLWorker(pdfDocument);
                        htmlworker.Parse(str);
                        pdfWriter.CloseStream = false;
                        pdfDocument.Close();
                        //Download Pdf
                        Response.Buffer = true;
                        Response.ContentType = "application/pdf";
                        Response.AppendHeader("Content-Disposition", "attachment;filename=" + pdffilename);
                        Response.Cache.SetCacheability(HttpCacheability.NoCache);
                        Response.Write(pdfDocument);
                        Response.Flush();
                        Response.End();
                    }
                }
            }
            con12.Close();
        }

        protected void next11(object sender, EventArgs e)
        {
            table1.Visible = false;
            table2.Visible = true;
            table3.Visible = false;

            Label37.Text = TextBox5.Text;
            //current meter
            Label26.Text = TextBox4.Text;
            //yesterday meter
            Label25.Text = TextBox2.Text;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
        }

        protected void prev11(object sender, EventArgs e)
        {
            table1.Visible = false;
            table2.Visible = false;
            table3.Visible = true;

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
        }

        protected void next22(object sender, EventArgs e)
        {
            table1.Visible = true;
            table2.Visible = false;
            table3.Visible = false;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
        }

        protected void backDoubleTextbox(object sender, EventArgs e)
        {
            table1.Visible = true;
            table2.Visible = false;
            table3.Visible = false;
            table6.Visible = false;
            tableconfirm.Visible = false;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
        }

        protected void finishSubmisiion(object sender, EventArgs e)
        {
           
            
            getYesterdayMeter();

            insertingMeters();
            
            populatefinal(Session["Fuel_category"].ToString());

            table1.Visible = false;
            table2.Visible = false;
            table3.Visible = false;
            table6.Visible = false;
            tableconfirm.Visible = true;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
        }
        public void getYesterdayMeter()
        {
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("SELECT *from Meter_Readingss WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                int current = int.Parse(Label37.Text.ToString());
                int prev = int.Parse(dr["Meter"].ToString());
                int sold = current - prev;
                Session.Add("sold", sold);
                TextBox1.Text = sold.ToString();
                con.Close();
            }
            else
            {
                con.Close();
            }
        }
        private void updateTank()
        {
            string today = DateTime.Now.ToString("dd");
            string month = DateTime.Now.ToString("MM");
            string year = DateTime.Now.ToString("yyyy");

            float currentMeter = int.Parse(Session["myMeter"].ToString());
            float sold = int.Parse(Session["sold"].ToString());

            float toinsert = currentMeter - sold;

            generalClass.inserting("Update FUEL set Current_capacity='" + toinsert + "' WHERE Station_ref='" + Session["Station_ref"] + "' and Fuel_type='" + Session["Fuel_category"] + "'");


        }
        void subtractMeterReadings()
        {
            int current = int.Parse(Label26.Text);
            int prev = int.Parse(Label25.Text);
            int sold = current - prev;
            Session.Add("sold", sold);
        }
        protected void excecuteCode(object sender, EventArgs e)
        {
            subtractMeterReadings();

            table1.Visible = false;
            table2.Visible = false;
            table3.Visible = false;
            table6.Visible = false;
            insertingMeters();
            populatefinal(Session["Fuel_category"].ToString());
            tableconfirm.Visible = true;
        }
       
        protected void next33(object sender, EventArgs e)
        {
            int prev = int.Parse(TextBox2.Text.ToString());
            int next = int.Parse(TextBox4.Text.ToString());
            if (prev >= next)
            {
                Label21.Text = "Warning!";
                Label22.Text = "The current meter is less than the previous meter.Please check!";
                Label22.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Label21.Text = Session["Fuel_category"].ToString();

                Label22.Text = "Please enter previous day and todays meter readings of petrol as indicated below!";
                table1.Visible = false;
                table6.Visible = true;
                table2.Visible = false;
                table3.Visible = false;
                tableconfirm.Visible = false;
                //set prevfsub
                Label25.Text = TextBox2.Text;
                //set next
                Label26.Text = TextBox4.Text;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
            }
        }

       

        public void populatefinal(String fuel)
        {
            string today = DateTime.Now.ToString("dd");
            string month = DateTime.Now.ToString("MM");
            string year = DateTime.Now.ToString("yyyy");
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("SELECT *from Sales WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' AND Date='" + today + "' AND Month='" + month + "' AND Year='" + year + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string message="Good evening "+dr["Full_names"].ToString();
                message += "Sales submitted: \n";
                message += "STATION NAME: " + dr["Station_name"].ToString() +"\n";
                message += "FUEL TYPE: " + dr["Fuel_type"] + "\n";
            

                message += "PREVIOUS METER: " + dr["Previous_meter"] + "\n";

                message += "TODAY METER: " + dr["Current_meter"] + "\n";

                message += "PRICE/Ltr: " + dr["Price_itre"] + "\n";
                message += "LITRES SOLD: " + dr["Litres_sold"] + "\n";

                message += "TOTAL SALES: " + dr["Sales"] + "\n";
                message += "AGENT NAME: " + dr["AGENT NAME"] + "\n";
                message += "REMAINING FUEL: " + dr["Current_capacity"] + "\n";
                message += "Powered by Fuela.";
                

                Label31.Text = dr["Previous_meter"].ToString();
                Label32.Text = dr["Current_meter"].ToString();
                Label34.Text = dr["Price_itre"].ToString();
                Label33.Text = dr["Sales"].ToString();
                sendMessage(message, dr["Phone"].ToString());

                con.Close();
            }
            else
            {
                con.Close();
            }
        }
        void sendMessage(string message,string phone)
        {
            generalClass.SendMessage(phone, message);
        }
    }
}