﻿using InsertingRecords;
using SMS;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Web;
using System.Data;
using System.Text;

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
        protected void MakeDatatable()
        {
            DataTable dt = new DataTable();
            string queryString = "SELECT TOP 10  *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "'";
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
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Session["Data"] = dt;
        }

        protected void searchrecords(object sender, EventArgs e)
        {
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT TOP 10  *FROM Sales_records Where Station_ref='" + Session["Station_ref"] + "'", cont);
                cont.Open();

                //SqlDataReader dr = cmd1.ExecuteReader();

                //Repeater2.DataSource =dr;
                //Repeater2.DataBind();

                GridView1.DataSource = cmd1.ExecuteReader();
                GridView1.DataBind();
                cont.Close();
            }
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



                string today = DateTime.Now.ToString("dd");
                string month = DateTime.Now.ToString("MM");
                string year = DateTime.Now.ToString("yyyy");
                string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
                SqlConnection con = new SqlConnection(str);
                SqlCommand cmd = new SqlCommand("SELECT *from Sales where Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_category"] + "' AND Month='" + month + "' AND Date='" + today + "' AND Year='" + year + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    populatefinal(Session["Fuel_category"].ToString());

                    //Label35.Text = "You have already submitted todays sales please contact manager for more details.";
                    alreadySubmitted("Diesel");
                    table1.Visible = false;
                    table2.Visible = false;
                    table3.Visible = false;
                    table6.Visible = false;
                    tableconfirm.Visible = true;
                }



                else
                {
                    //CHECK IF RECORDS EXIST FOR PETROL
                    SqlConnection con1 = new SqlConnection(str);
                    SqlCommand cmd1 = new SqlCommand("SELECT *FROM Meter_Readingss WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' ", con1);
                    con1.Open();
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    if (dr1.Read())
                    {
                        setLabels("Diesel");
                        table1.Visible = false;
                        table3.Visible = true;
                        table2.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;
                        Session["testFuelAvaillability"] = "true";


                    }
                    else
                    {
                        Session["testFuelAvaillability"] = "false";

                        setLabels("DIESEL");
                        table1.Visible = true;
                        table2.Visible = false;
                        table3.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;

                    }



                }
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
                Session.Add("Fuel_category", "KEROSENE");



                string today = DateTime.Now.ToString("dd");
                string month = DateTime.Now.ToString("MM");
                string year = DateTime.Now.ToString("yyyy");
                string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
                SqlConnection con = new SqlConnection(str);
                SqlCommand cmd = new SqlCommand("SELECT *from Sales where Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_category"] + "' AND Month='" + month + "' AND Date='" + today + "' AND Year='" + year + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    populatefinal(Session["Fuel_category"].ToString());

                    //Label35.Text = "You have already submitted todays sales please contact manager for more details.";
                    alreadySubmitted("Kerosene");
                    table1.Visible = false;
                    table2.Visible = false;
                    table3.Visible = false;
                    table6.Visible = false;
                    tableconfirm.Visible = true;
                }



                else
                {
                    //CHECK IF RECORDS EXIST FOR PETROL
                    SqlConnection con1 = new SqlConnection(str);
                    SqlCommand cmd1 = new SqlCommand("SELECT *FROM Meter_Readingss WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' ", con1);
                    con1.Open();
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    if (dr1.Read())
                    {
                        SqlConnection con15 = new SqlConnection(str);
                        SqlCommand cmd15 = new SqlCommand("SELECT *FROM Sales WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "'", con15);
                        con15.Open();
                        SqlDataReader dr15 = cmd15.ExecuteReader();
                        if (dr15.Read())
                        {
                            setLabels("KEROSENE");
                            table1.Visible = false;
                            table3.Visible = true;
                            table2.Visible = false;
                            table6.Visible = false;
                            tableconfirm.Visible = false;
                            Session["testFuelAvaillability"] = "true";

                        }
                        else
                        {
                            Session["testFuelAvaillability"] = "false";

                            setLabels("KEROSENE");
                            table1.Visible = true;
                            table2.Visible = false;
                            table3.Visible = false;
                            table6.Visible = false;
                            tableconfirm.Visible = false;


                        }
                        con15.Close();



                    }
                    else
                    {
                        Session["testFuelAvaillability"] = "false";

                        setLabels("KEROSENE");
                        table1.Visible = true;
                        table2.Visible = false;
                        table3.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;

                    }



                }
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
                Session.Add("Fuel_category", "PETROL");



                string today = DateTime.Now.ToString("dd");
                string month = DateTime.Now.ToString("MM");
                string year = DateTime.Now.ToString("yyyy");
                string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
                SqlConnection con = new SqlConnection(str);
                SqlCommand cmd = new SqlCommand("SELECT *from Sales where Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_category"] + "' AND Month='" + month + "' AND Date='" + today + "' AND Year='" + year + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    populatefinal(Session["Fuel_category"].ToString());

                    //Label35.Text = "You have already submitted todays sales please contact manager for more details.";
                    alreadySubmitted("Petrol");
                    table1.Visible = false;
                    table2.Visible = false;
                    table3.Visible = false;
                    table6.Visible = false;
                    tableconfirm.Visible = true;
                }



                else
                {
                    //CHECK IF RECORDS EXIST FOR PETROL
                    SqlConnection con1 = new SqlConnection(str);
                    SqlCommand cmd1 = new SqlCommand("SELECT *FROM Meter_Readingss WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' ", con1);
                    con1.Open();
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    if (dr1.Read())
                    {
                        setLabels("PETROL");
                        table1.Visible = false;
                        table3.Visible = true;
                        table2.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;
                        Session["testFuelAvaillability"] = "true";


                    }
                    else
                    {
                        Session["testFuelAvaillability"] = "false";

                        setLabels("PETROL");
                        table1.Visible = true;
                        table2.Visible = false;
                        table3.Visible = false;
                        table6.Visible = false;
                        tableconfirm.Visible = false;

                    }



                }
            }

            catch (Exception ex)
            {
                Label38.Text = ex.ToString();
                Label38.ForeColor = System.Drawing.Color.Red;
            }
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
        }
        void alreadySubmitted(string fuel)
        {
            Label36.Text = "You have already subbmited todays " + fuel + " sales please contact manager for more information!!";
        }
        void setLabels(String Fuel_type)
        {
            if (Fuel_type == "PETROL")
            {
                Label35.Text = "Confirmed Pettrol meter submitted successfully!.An SMS notification has been sent to the Manager";
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
                Label35.Text = "Confirmed Diesel meter submitted successfully!.An SMS notification has been sent to the Manager";

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
                Label35.Text = "Confirmed Kerosene meter submitted successfully!.An SMS notification has been sent to the Manager";

                Label24.Text = "Please confirm kerosene meter readings before proceeding!";
                Label23.Text = "kerosene meter confirmation";
                Label22.Text = "Please enter previous day and today's meter readings of kerosene as indicated below!";
                Label21.Text = "kerosene meter";
                Label27.Text = "kerosene";
                Label28.Text = "Please enter today's kerosene meter readings as indicated on the fuel dispenser meter.";
                //Label36.Text = "kerosene meter readings:";
            }
        }
        void actions()
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
        void insertingMeters()
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
                        //1.1 Getting yesterdays meter readings

                        //generalClass.getYesterMeter("SELECT TOP 1 *FROM Meter_Records_Sort where Station_Ref='" + Session["Station_Ref"] + "' AND Fuel_type='" + Session["Fuel_category"] + "' order by Time_stamp desc");

                        //1.1 Inserting into meter records
                        //LETS GENERATE RANDOM NUMBER


                        generalClass.inserting("INSERT INTO Meter_records(Station_ref,Date,Month,Year,Previous_meter,Current_meter,Agent_ID,Fuel_Type,Ref) VALUES('" + Session["Station_Ref"] + "','" + date + "','" + month + "','" + year + "','" + dr1["Meter"] + "','" + TextBox5.Text + "','" + Session["National_ID"] + "','" + Session["Fuel_category"] + "','" + randomnumber + "')");
                        Session.Add("Records_ref", randomnumber);
                        updatetank();
                        //generalClass.inserting("UPDATE Meter_Readingss SET Date='" + date + "',Month='" + month + "',Year='" + year + "',Meter='" + Label37.Text + "',Agent_ID='" + Session["National_ID"] + "' WHERE Fuel_Type='" + Session["Fuel_category"] + "' AND Station_Ref='" + Session["Station_Ref"] + "'");
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);

                    }
                    else
                    {

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


                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);
                }
            }
            catch (Exception ex)
            {

                Label38.Text = ex.ToString();
                Label38.ForeColor = System.Drawing.Color.Red;
            }

        }

        private void populateFuel()
        {
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {

                SqlCommand cmd2 = new SqlCommand("SELECT *FROM Current_fuel_details where Station_ref='" + Session["Station_ref"] + "'", cont);
                cont.Open();
                Repeater1.DataSource = cmd2.ExecuteReader();
                Repeater1.DataBind();


                cont.Close();
            }
        }
        protected void pdf(object sender, EventArgs e)
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
                        strActualRecords = "<table class=\"table\"style=\"width:100%;font-size: 9pt; font-family: verdana; \" border=\"1\" cellspacing=\"0\" cellpadding=\"0\">";
                        strActualRecords += "<tr><td style=\"width: 5%;white-space: nowrap;\">AGENT</td><td style=\"width: 5%;\">DATE</td><td style=\"width: 5%;\">MONTH</td>" + "<td style=\"width: 5%;\">YEAR</td>" + "<td style=\"width: 5%;\">PREV.M</td>" + "< td style =\"width: 5%;\">CURRENT.M</td></tr>" + "< td style =\"width: 5%;\">VOLUME SOLD</td></tr>" + "< td style =\"width: 5%;font-weight:999;\">TOTAL</td></tr>";
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            strActualRecords += "<tr>";
                            strActualRecords += "<td style=\"width: 5%;\">" + dt.Rows[i]["EMPID"].ToString() + "</td>" + "<td style=\"width: 5%;\">" + dt.Rows[i]["EmpName"].ToString() + "</td>" + "<td style=\"width: 5%;\">" + dt.Rows[i]["EmpAddress"].ToString() + "</td>" + "<td style=\"width: 5%;\">" + dt.Rows[i]["Mobile"].ToString() + "</td>" + "<td style=\"width: 5%;\">" + dt.Rows[i]["EmailID"].ToString() + "</td>" + "<td style=\"width: 5%;\">" + dt.Rows[i]["DOB"].ToString() + "</td>";
                            strActualRecords += "</tr>";
                        }
                        strActualRecords += "</table>";
                        sb.Append(strActualRecords);
                        sb.Append("</body></html>");
                    }

                }
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
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
            insertingMeters();
            populatefinal(Session["Fuel_category"].ToString());

            table1.Visible = false;
            table2.Visible = false;
            table3.Visible = false;
            table6.Visible = false;
            tableconfirm.Visible = true;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);

        }

        protected void excecuteCode(object sender, EventArgs e)
        {

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
            int prev = int.Parse(TextBox4.Text.ToString());
            int next = int.Parse(TextBox2.Text.ToString());
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
                Label31.Text = dr["Previous_meter"].ToString();
                Label32.Text = dr["Current_meter"].ToString();
                Label34.Text = dr["Price_itre"].ToString();
                Label33.Text = dr["Sales"].ToString();


                con.Close();
            }
            else
            {

                con.Close();

            }


        }
        void updatetank()
        {

            //LETS GET CURRENT FUEL CAPACITY
            SqlConnection con1 = new SqlConnection(str);
            SqlCommand cmd1 = new SqlCommand("SELECT *FROM Sales WHERE Ref='" + Session["Records_ref"] + "'", con1);
            con1.Open();
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
            {

                float initial = int.Parse(dr1["Current_capacity"].ToString());
                float toInsertToDatabase = initial - int.Parse(dr1["Sales"].ToString());
                string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
                using (SqlConnection cont = new SqlConnection(CSY))
                {
                    SqlCommand cmd2 = new SqlCommand("UPDATE FUEL SET Current_capacity='" + toInsertToDatabase + "' WHERE Station_Ref='" + Session["Station_Ref"] + "' AND Fuel_type='" + Session["Fuel_category"] + "'", cont);
                    cont.Open();
                    cmd2.ExecuteNonQuery();
                    cont.Close();
                }
            }
            con1.Close();

        }

    }
  


                













            }






       
           