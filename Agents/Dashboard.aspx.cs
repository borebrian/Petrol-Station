using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InsertingRecords;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using SMS;
namespace Petrol_Station.Agents
{
    public partial class Dashboard : System.Web.UI.Page
    {
        Auth generalClass = new Auth();
        string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("../Agents/Log_in.aspx");
            }
            else
            {
                //INITIALIZE TWILIO AUTH
                Auth s = new Auth();
            s.InitTwilio();
            actions();
            tableConfirming.Visible = false;

            }
        }

        protected void changeStation(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Petrol_station_selection.aspx");

            //ClientScript.RegisterStartupScript(this.GetType(), "alert", " reset()", true);
        }
        protected void addAccount(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Station_reg.aspx");

            //ClientScript.RegisterStartupScript(this.GetType(), "alert", " reset()", true);
        }
        protected void changePrice(object sender, EventArgs e)
        {
            TextBox1.Text = Session["Price_itre"].ToString();
            Label17.Text = Session["Fuel_ref"].ToString();
            tableConfirming.Visible = false;
            //Response.Write("you clicked the div clickArea");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "part()", true);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " twilio()", true);



        }
        protected void refilling(object sender, EventArgs e)
        {
            Label22.Text = Session["Fuel_ref"].ToString();
            Label28.Text = "Please enter";
            Label27.Text = "";
            Label299.Text = " ammount to add.";
            tableConfirming.Visible = false;
            LinkButton9.Visible = true;
            TextBox2.Visible = true;

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "refill()", true);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " twilio()", true);



        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Sales_category.aspx");

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
        protected void generateAll(object sender, EventArgs e)
        {
           meterList();           
        }
        protected void salesList(object sender, EventArgs e)
        {
            
        
        
        }
        void salesList()
        {
            MakeDatatable("SELECT TOP 50 *FROM Station_registration ORDER BY ");
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {

                    DataTable dt = (DataTable)Session["Data"];
                    Document pdfDocument = new Document();
                    StringBuilder sb = new StringBuilder();
                    if (dt.Rows.Count > 0)
                    {
                        sb.Append("<html>< head ><title></title></head><body>");
                        string strActualRecords = string.Empty;
                        strActualRecords = "<table   style=\";font-size: 9pt\"  border=\"1\" cellspacing=\"0\" cellpadding=\"1\">";
                        strActualRecords += "<tr><td  colspan=\"2\">List of meter records for last one month</td></tr>";
                        strActualRecords += "<tr><td>Date generated:</td><td>" + DateTime.Now.ToString() + "</td></tr></table>";

                        strActualRecords += "<table style=\";font-size: 7pt; font-family: 'Century gothic';background-color:red; \" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">";
                        strActualRecords += "<tr style=\"background-color:#68213A;\" > " +
                            "<td>Date</td>" +
                            "<td>TOWN</td>" +
                            "<td>STATION</td>" +
                            "<td>FUEL</td>" +
                            "<td>PREV.M</td>" +
                            "<td>CURRENT.M</td></tr>";

                        for (int j = 0; j < dt.Rows.Count; j++)
                        {
                            strActualRecords += "<tr>" +

                        "<td >" +
                        dt.Rows[j]["Date"].ToString() + "/" +
                        dt.Rows[j]["Month"].ToString() +
                        "/" + dt.Rows[j]["Year"].ToString() +
                        "</td>" +
                                "<td>" + dt.Rows[j]["Location"].ToString() + "</td>" +
                                "<td>" + dt.Rows[j]["Station_name"].ToString() + "</td>" +
                                "<td >" + dt.Rows[j]["Fuel_ref"].ToString() + "</td>" +
                                "<td >" + dt.Rows[j]["Previous_meter"].ToString() + "</td>" +
                                "<td >" + dt.Rows[j]["Current_meter"].ToString() + "</td>" +
                                "</tr>";
                        }
                        strActualRecords += "</table>";
                        sb.Append(strActualRecords);
                        sb.Append("<p style=\"font-size:5pts\">Powered by Fuela</p></body></html>");
                    }
                    string pdffilename = "LIST_OF_METER" + ".pdf";
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
        void meterList()
        {

            MakeDatatable("SELECT Top 30 *FROM Meter_list");
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {

                    DataTable dt = (DataTable)Session["Data"];
                    Document pdfDocument = new Document();
                    StringBuilder sb = new StringBuilder();
                    if (dt.Rows.Count > 0)
                    {
                        sb.Append("<html>< head ><title></title></head><body>");
                        string strActualRecords = string.Empty;
                        strActualRecords = "<table   style=\";font-size: 9pt\"  border=\"1\" cellspacing=\"0\" cellpadding=\"1\">";
                        strActualRecords += "<tr><td  colspan=\"2\">List of meter records for last one month</td></tr>";
                        strActualRecords += "<tr><td>Date generated:</td><td>" + DateTime.Now.ToString() + "</td></tr></table>";

                        strActualRecords += "<table style=\";font-size: 7pt; font-family: 'Century gothic';background-color:red; \" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">";
                        strActualRecords += "<tr style=\"background-color:#68213A;\" > " +
                            "<td>Date</td>" +
                            "<td>TOWN</td>" +
                            "<td>STATION</td>" +
                            "<td>FUEL</td>" +
                            "<td>PREV.M</td>" +
                            "<td>CURRENT.M</td></tr>";

                        for (int j = 0; j < dt.Rows.Count; j++)
                        {
                            strActualRecords += "<tr>" +

                        "<td >" +
                        dt.Rows[j]["Date"].ToString() + "/" +
                        dt.Rows[j]["Month"].ToString() +
                        "/" + dt.Rows[j]["Year"].ToString() +
                        "</td>" +
                                "<td>" + dt.Rows[j]["Location"].ToString() + "</td>" +
                                "<td>" + dt.Rows[j]["Station_name"].ToString() + "</td>" +
                                "<td >" + dt.Rows[j]["Description"].ToString() + "</td>" +
                                "<td >" + dt.Rows[j]["Previous_meter"].ToString() + "</td>" +
                                "<td >" + dt.Rows[j]["Current_meter"].ToString() + "</td>" +
                                "</tr>";
                        }
                        strActualRecords += "</table>";
                        sb.Append(strActualRecords);
                        sb.Append("<p style=\"font-size:5pts\">Powered by Fuela</p></body></html>");
                    }
                    string pdffilename = "LIST_OF_METER" + ".pdf";
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
        void hideBtnPdf(String sql)
        {
            string newDate = DropDownList1.SelectedItem.Value;
            string newMonth = DropDownList2.SelectedItem.Value;
            string newYear = DropDownList3.SelectedItem.Value;

            generalClass.testFilters(sql);
            if (generalClass.testFilter)
            {
                LinkButton6.Visible = true;
                Label30.ForeColor = System.Drawing.Color.Green;
                Label30.Text = "Results";
            }
            else
            {
                Label30.Text = "No records found!.";

                Label30.ForeColor = System.Drawing.Color.Red;

                LinkButton6.Visible = false;
            }
        }
        protected void todaySales(object sender, EventArgs e)
        {
           

            string today = DateTime.Now.ToString("dd");
            string month = DateTime.Now.ToString("MM");
            string year = DateTime.Now.ToString("yyyy");
            hideBtnPdf("SELECT *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "' AND Month='" + month + "' AND Date='" + today + "' AND Year='" + year + "'");
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "' AND Month='" + month + "' AND Date='" + today + "' AND Year='" + year + "'", cont);
                cont.Open();

                SqlDataReader dr = cmd1.ExecuteReader();

                Repeater2.DataSource = dr;
                Repeater2.DataBind();
               
                MakeDatatable("SELECT *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "' AND Month='" + month + "' AND Date='" + today + "' AND Year='" + year + "'");
                cont.Close();
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "sales1()", true);


        }
        protected void topten(object sender, EventArgs e)
        {
            hideBtnPdf("SELECT TOP 10 *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "'");
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT TOP 10 *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "'", cont);
                cont.Open();

                SqlDataReader dr = cmd1.ExecuteReader();

                Repeater2.DataSource = dr;
                Repeater2.DataBind();
                MakeDatatable("SELECT TOP 10 * FROM Sales_records Where Station_ref = '" + Session["Station_ref"] + "'");
                cont.Close();
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "sales1()", true);


        }
            protected void filterRecords(object sender, EventArgs e)
        {
            hideBtnPdf("SELECT *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "' AND MONTH='" + DropDownList2.SelectedItem.Value + "' AND DATE='" + DropDownList1.SelectedItem.Value + "' AND YEAR='" + DropDownList3.SelectedItem.Value + "'");
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "' AND MONTH='" + DropDownList2.SelectedItem.Value + "' AND DATE='" + DropDownList1.SelectedItem.Value + "' AND YEAR='" + DropDownList3.SelectedItem.Value + "'", cont);
                cont.Open();

                SqlDataReader dr = cmd1.ExecuteReader();

                Repeater2.DataSource = dr;
                Repeater2.DataBind();
                MakeDatatable("SELECT *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "' AND MONTH='" + DropDownList2.SelectedItem.Value + "' AND DATE='" + DropDownList1.SelectedItem.Value + "' AND YEAR='" + DropDownList3.SelectedItem.Value + "'");
                cont.Close();
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "sales1()", true);
        }
        protected void pdf(object sender, EventArgs e)
        {
            pdfDownload();
        }
        protected void choose(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Fuel_selection.aspx");
        }
        protected void log_out(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Agents/Log_in.aspx");
        }

        private void pdfDownload()
        {
            //MakeDatatable("SELECT Top 30 *FROM Meter_list");

            SqlConnection con12 = new SqlConnection(str);
            SqlCommand cmd12 = new SqlCommand("SELECT *FROM Station_registration", con12);
            con12.Open();
            SqlDataReader dr1 = cmd12.ExecuteReader();
            if (dr1.Read())
            {
                using (StringWriter sw = new StringWriter())
                {
                    using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                    {

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
                                "<td>PRICE/LITRE</td>" +
                                "<td>TOTAL Ksh.</td>" +
                            "<td>REMAINING</td></tr>";
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
                                    "<td >" + dt.Rows[i]["Price_itre"].ToString() + "</td>" +

                                    "<td >" + dt.Rows[i]["SALES"].ToString() + "/=</td>" +
                                "<td >" + dt.Rows[i]["Price_itre"].ToString() + " Ltrs</td>";



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
        void sendMessageFunction()
        {
            string today = DateTime.Now.ToString("dd");
            string month = DateTime.Now.ToString("MM");
            string year = DateTime.Now.ToString("yyyy");
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("SELECT *from Sales WHERE Fuel_ref='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' AND Date='" + today + "' AND Month='" + month + "' AND Year='" + year + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string message = "Good evening " + dr["Full_names"].ToString();
                message += "\n Fuel sales submission details: \n";
                message += "STATION NAME: " + dr["Station_name"].ToString() + "\n";
                message += "FUEL TYPE: " + dr["Fuel_ref"] + "\n";


                message += "PREVIOUS METER: " + dr["Previous_meter"] + "\n";

                message += "TODAY METER: " + dr["Current_meter"] + "\n";

                message += "PRICE/Ltr: " + dr["Price_itre"] + "\n";
                message += "LITRES SOLD: " + dr["Litres_sold"] + "\n";

                message += "TOTAL SALES: " + dr["Sales"] + "/=\n";
                message += "AGENT NAME: " + dr["AGENT NAME"] + "\n";
                message += "AGENT NUMBER: " + dr["Agent_phone"] + "\n";
                message += "AGENT Number: " + dr["AGENT NAME"] + "\n";

                message += "REMAINING FUEL: " + dr["Current_capacity"] + " Litres\n";
                message += "Powered by Fuela.";
                sendMessage(message, dr["Phone"].ToString());
            }
            void sendMessage(string message, string phone)
            {
                generalClass.SendMessage(phone, message);
            }
        }

        protected void cancelRefill(object sender, EventArgs e)
        {
            tableConfirming.Visible = false;
            LinkButton9.Visible = true;
            TextBox2.Visible = true;
       
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "refill()", true);


        }
        protected void confirmRefilling(object sender, EventArgs e)
        {
            //REFILING TANK
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select *from Fuel WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_ref='" + Session["Fuel_ref"] + "'", con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                float prev = float.Parse(myDataReadert["Current_capacity"].ToString());
                float toBeRefilled = float.Parse(Label25.Text.ToString());
                float newValue = prev + toBeRefilled;
                generalClass.test(newValue);
                if (generalClass.check)
                {
                    tableConfirming.Visible = false;
                    LinkButton9.Visible = true;
                    TextBox2.Visible = true;
                    Label27.Text = "The value you entered is greater than the tank capacity!!.";
                    Label27.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    generalClass.inserting("UPDATE FUEL SET Current_capacity ='" + newValue + "' WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_ref='" + Session["Fuel_ref"] + "'");
                    SqlConnection cont = new SqlConnection(str);
                    SqlCommand cmdt = new SqlCommand("select *from Agents_Reg WHERE Station_ref='" + Session["Station_ref"] + "'", cont);
                    cont.Open();
                    SqlDataReader myDataReadertt = cmdt.ExecuteReader();
                    if (myDataReadertt.Read())
                    {
                        string message1 = "" + Session["Fuel_ref"] + "' has been refilled current volume: ";
                        string message2 = + newValue + ". ";
                        string message3 = message1 + message2 + "Please contact station manager for more details.";
                generalClass.SendMessage(generalClass.Add254(myDataReadertt["Phone"].ToString()),message3);




                        //generalClass.SendMessage(generalClass.Add254(myDataReadertt["Phone"].ToString()), message3);
                        Label27.Text = "Submitted successfully and notification was sent to " + myDataReadertt["Full_names"];
                        Label27.ForeColor = System.Drawing.Color.Green;
                        cont.Close();

                        beforeSubmit.Visible = true;
                        Label28.Text = "Success!";
                        Label22.Text = "";
                        Label299.Text = "";

                    }
                    else
                    {
                        Label28.Text = "Success!";
                        Label22.Text = "";
                        Label299.Text = "";
                        con.Close();
                        Label27.Text = "Submitted successfully but notification was not sent to Agent because there was no corresponding contacts!";
                        Label27.ForeColor = System.Drawing.Color.Red;

                        beforeSubmit.Visible = true;



                    }

                }
                


            }
            actions();

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "refill()", true);

        }
        protected void ConfirmUpdatePrice(object sender, EventArgs e)
        {
            //LETS GET CURRENT TANK CAPACITY
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select *from Fuel WHERE Station_ref='" + Session["Station_ref"] + "'", con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                Label23.Text = myDataReadert["Current_capacity"].ToString();
                Label25.Text = TextBox2.Text;
                float prev = float.Parse(myDataReadert["Current_capacity"].ToString());
                float toBeRefilled = float.Parse(TextBox2.Text.ToString());
                float newValue = prev + toBeRefilled;
                Label26.Text = newValue.ToString();
                tableConfirming.Visible = true;
                LinkButton9.Visible = false;
                TextBox2.Text = "";
                TextBox2.Visible = false;
                con.Close();

            }
            else
            {
                con.Close();
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "refill()", true);


        }
        protected void updatePrice(object sender, EventArgs e)
        {
            

            generalClass.inserting("Update Fuel set Price_itre='" + TextBox1.Text+ "' WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_ref='" + Session["Fuel_ref"] + "'");
            Label4.Text = "Submitted and notification message sent to Agent successfully!";
            Label14.ForeColor = System.Drawing.Color.Green;

            //LETS SEND MESSAGE TO AGENTS FOR NEW PRICE
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select *from Agents_Reg WHERE Station_ref='"+Session["Station_ref"]+"'", con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                string message1 = "The " + Session["Fuel_ref"] + " price has changed as follows: ";
                string message2 = "Price per litre:" + TextBox1.Text + ". ";
                string message3 =message1+message2+ "Please contact station manager for more details.";
                Label4.ForeColor = System.Drawing.Color.Green;
                actions();


                generalClass.SendMessage(generalClass.Add254(myDataReadert["Phone"].ToString()),message3);
                con.Close();

            }
            else
            {
                con.Close();
                Label4.Text = "Submitted successfully but notification was not sent to Agent because there was no corresponding contact!";
                Label4.ForeColor = System.Drawing.Color.Red;
                actions();


            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "part()", true);

        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Admin_category.aspx");

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Sales_category.aspx");

        }
        //CHECK IF SALES HAVE BEEN SUBMITTED
        public void setTank()
        {
            string today = DateTime.Now.ToString("dd");
            string month = DateTime.Now.ToString("MM");
            string year = DateTime.Now.ToString("yyyy");
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("SELECT *FROM Meter_records WHERE Station_ref='"+Session["Station_ref"]+"' and date='"+today+"' AND Month='"+month+"' AND YEAR='"+year+"'", con);
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
        public void setTank1()
        {
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
        


        void actions()
        {
          



                float Pixelheight = 200;
                String unit = "px";

                SqlConnection con = new SqlConnection(str);
                SqlCommand cmd = new SqlCommand("SELECT *FROM Fuel WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_ref='" + Session["Fuel_ref"] + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    {
                        float totalcapacity = float.Parse(dr["Tank_capacity"].ToString());
                        float currentCapacity = float.Parse(dr["Current_capacity"].ToString());
                        float toDisplay = ((currentCapacity / totalcapacity) * Pixelheight);
                        float InverseDisplay = Pixelheight - toDisplay;
                        string InverseDisplayConverted = String.Concat(InverseDisplay, unit);

                        tank.Style.Add("height", InverseDisplayConverted);

                        Label5.Text = dr["Current_capacity"].ToString();
                        Label14.Text = Session["Station_name"].ToString();
                        Label8.Text = dr["Price_itre"].ToString();
                        Session.Add("Price_itre", dr["Price_itre"]);
                        Label18.Text = Session["Fuel_ref"].ToString();
                        Label15.Text = Session["Fuel_ref"].ToString();

                        //CHANGE TANK COLOR
                        if (currentCapacity <= ((totalcapacity / 6) * 1))
                        {
                            clickArea.Style.Add("Background-color", "#D3001A;");
                            tank.Style.Add("border-bottom-left-radius", "20px");

                            tank.Style.Add("border-bottom-right-radius", "20px");
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
                            //clickArea_Click(clickArea, EventArgs.Empty);
                        }
                    }
                }
                else
                {
                    con.Close();
                    Response.Redirect("../Agents/Fuel_selection.aspx");
                }
            
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            actions();
            //Label15.Text = Label2.Text = DateTime.Now.ToString();
        }
    }
}