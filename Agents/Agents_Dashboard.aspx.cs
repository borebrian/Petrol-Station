using InsertingRecords;
using SMS;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Petrol_Station.Agents

{
    public partial class Agents_Dashboard : System.Web.UI.Page
    {
        private OpenClass general = new OpenClass();
        private Auth generalClass = new Auth();
        private string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();

        public void restore()
        {
            Label30.Text = "Please enter ";
            Label11.Text = Session["Fuel_category"].ToString();
            Label12.Text = " meter readings as indicated on the meter.";
            confirmtable.Visible = false;
            enterMeter.Visible = true;
            secondBox.Visible = false;
            TextBox1.Text = "";
            TextBox3.Text = "";
        }

        protected void beckToMeter(object sender, EventArgs e)
        {
            Label30.Text = "Please enter ";
            Label12.Text = "meter readings as indicated on the meter.";
            TextBox3.Text = "";
            enterMeter.Visible = true;
            confirmtable.Visible = false;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showSubmitDialog()", true);
        }

        protected void changeStfinishSubmisiionation(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Petrol_station_selection.aspx");

            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Clicked')", true);
        }

        protected void finishSubmisiion(object sender, EventArgs e)
        {
            insertingMeter();
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
                confirmtable.Visible = false;

                //actionTab.Visible = false;

            }

        }

        protected void testtt(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);

        }

        protected void submitdiesl(object sender, EventArgs e)
        {
            general.testDate("SELECT *FROM Meter_Readingss WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' AND Date='" + DateTime.Now.ToString("dd") + "' AND Month='" + DateTime.Now.ToString("MM") + "' AND Year='" + DateTime.Now.ToString("yy") + "'");
            if (general.dates)
            {
                Label13.Text = "You have already submitted today readings!!!";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);
            }
            else
            {
                general.testifuel("SELECT *FROM Fuel WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='DIESEL'");
                if (general.fuel)
                {
                    Label11.Text = "diesel";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showSubmitDialog()", true);
                    Session.Add("Fuel_category", "DIESEL");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);
                }
            }
        }

        protected void submitforreview(object sender, EventArgs e)
        {
            if (Session["testFuelAvaillability"] == "true")
            {
                confirmTable1.Visible = false;
            }
            else
            {
                confirmTable1.Visible = true;

                Label4.Text = TextBox1.Text;
            }
            Label5.Text = TextBox3.Text;
            enterMeter.Visible = false;
            Label11.Text = "";
            Label30.Text = "";
            confirmtable.Visible = true;
            LinkButton18.Visible = true;
            Label12.Text = "Are you sure you want to submit below readings?NB:This action is irreversible!!.";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showSubmitDialog()", true);
        }

        protected void submitparafin(object sender, EventArgs e)
        {
            //general.testifuel("SELECT *FROM Fuel WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='KEROSENE'");
            //if (general.fuel)
            //{
            //    Label11.Text = "kerosene";

            //    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showSubmitDialog()", true);
            //    Session.Add("Fuel_category", "KEROSENE");
            //}
            //else
            //{
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "classic()", true);
            //}
        }

        protected void submitpetrol(object sender, EventArgs e)
        {
            general.testDate("SELECT *FROM Meter_Readingss WHERE Fuel_type='" + Session["Fuel_category"] + "' AND  Station_Ref='" + Session["Station_ref"] + "' AND Date='" + DateTime.Now.ToString("dd") + "' AND Month='" + DateTime.Now.ToString("MM") + "' AND Year='" + DateTime.Now.ToString("yy") + "'");
            if (general.dates)
            {
                Label11.Text = "petrol";
                Label11.Text = "petrol";
                Label11.Text = "petrol";
                Session.Add("Fuel_category", "PETROL");
                LinkButton18.Visible = false;

                generalClass.testYesterMeter("SELECT *FROM Metre_records WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_category"] + "'");
                if (generalClass.testFuelAvaillability)
                {
                    secondBox.Visible = false;
                    table1.Visible = false;
                    table3.Visible = true;
                    table2.Visible = false;
                    table6.Visible = false;
                    tableconfirm.Visible = false;




                }
                else
                {
                    secondBox.Visible = true;
                }

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            actions();
            //Label15.Text = Label2.Text = DateTime.Now.ToString();
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

        private void insertingMeter()
        {
            string date = DateTime.Now.ToString("dd");
            string month = DateTime.Now.ToString("MM");
            string year = DateTime.Now.ToString("yyyy");

            if (Session["testFuelAvaillability"] == "true")
            {
                //LETS UPDATE METER READINGS TABLE
                generalClass.inserting("UPDATE Meter_Readingss SET Date='" + date + "',Month='" + month + "',Year='" + year + "',Meter='" + Label5.Text + "',Agent_ID='" + Session["National_ID"] + "' WHERE Fuel_Type='" + Session["Fuel_category"] + "' AND Station_Ref='" + Session["Station_Ref"] + "'");

                //1.0 LETS INSERT METER RECORDS
                //1.1 Getting yesterdays meter readings

                generalClass.getYesterMeter("SELECT TOP 1 *FROM Meter_Records_Sort where Station_Ref='" + Session["Station_Ref"] + "' AND Fuel_type='" + Session["Fuel_category"] + "' order by Time_stamp desc");

                //1.1 Inserting into meter records

                generalClass.inserting("INSERT INTO Metre_records(Station_ref,Date,Month,Year,Previous_meter,Current_meter,Agent_ID,Fuel_Type) VALUES('" + Session["Station_Ref"] + "','" + date + "','" + month + "','" + year + "','" + Session["yesterdayTodayMeter"] + "','" + Label5.Text + "','" + Session["National_ID"] + "','" + Session["Fuel_category"] + "')");

                generalClass.inserting("UPDATE Meter_Readingss SET Date='" + date + "',Month='" + month + "',Year='" + year + "',Meter='" + Label5.Text + "',Agent_ID='" + Session["National_ID"] + "' WHERE Fuel_Type='" + Session["Fuel_category"] + "' AND Station_Ref='" + Session["Station_Ref"] + "'");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);

                restore();

              
            }
            else
            {
                //1.0 Lets insert into metter readings
                generalClass.inserting("INSERT INTO  Meter_Readingss(Date,Month,Year,Meter,Agent_ID,Station_ref,Fuel_Type)VALUES('" + date + "','" + month + "','" + year + "','" + Label5.Text + "','" + Session["National_ID"] + "','" + Session["Station_Ref"] + "','" + Session["Fuel_category"] + "')");
                //1.1 Lets insert into meter records
                generalClass.inserting("INSERT INTO Metre_records(Station_ref,Date,Month,Year,Previous_meter,Current_meter,Agent_ID,Fuel_type)VALUES('" + Session["Station_Ref"] + "','" + date + "','" + month + "','" + year + "','" + Label4.Text + "','" + Label5.Text + "','" + Session["National_ID"] + "','" + Session["Fuel_category"] + "')");
                restore();
        

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "nofuel()", true);
            }

            //SqlConnection cont = new SqlConnection(str);
            //SqlCommand cmdt = new SqlCommand("SELECT *FROM Meter_Readings WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_type"] + "'", cont);
            //cont.Open();
            //SqlDataReader myDataReadertt = cmdt.ExecuteReader();
            //if (myDataReadertt.Read())
            //{
            //    float currentMeter = int.Parse(myDataReadertt["Meter"].ToString());
            //    float toInsert = int.Parse(Label5.Text.ToString());
            //    if (currentMeter > toInsert)
            //    {
            //        enterMeter.Visible = true;
            //        confirmtable.Visible = false;
            //        secondBox.Visible = false;
            //        Label30.Text = "";
            //        Label12.Text = "";
            //        Label11.Text = "There is a problem with the meter reading you provided! Please check and enter the readings again!";
            //    }
            //    else
            //    {
            //        float newMeter = int.Parse(Label5.Text.ToString());

            //        general.inserting("UPDATE Meter_Readings SET Metre='" + newMeter + "',Date='" + DateTime.Now + "',Agent_ID='" + Session["National_ID"] + "', WHERE Station_reg='" + Session["Station_reg"] + "' AND Fuel_type='" + Session["Fuel_type"] + "'");
            //        general.inserting("INSERT INTO [dbo].[Metre_records](Station_reg,Date,Previous_meter,Current_meter,Agent_ID)VALUES('" + Session["Station_ref"] + "','" + DateTime.Now + "','" + currentMeter + "','" + toInsert + "','" + Session["National_ID"] + "')");
            //    }
            //}
            //else
            //{
            //    secondBox.Visible = true;

            //    general.inserting("Insert into Meter_Readings(Station_reg,Date,Meter,Fuel_Type) VALUES('" + Session["Station_Ref"] + "','" + DateTime.Now.ToString() + "','" + Label5.Text + "'");
            //}
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showSubmitDialog()", true);
            //}
            //else
            //{
            //}
        }

        private void populateFuel()
        {
            string CSY = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ConnectionString;
            using (SqlConnection cont = new SqlConnection(CSY))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT *FROM fuel where Station_ref='" + Session["Station_ref"] + "'", cont);
                cont.Open();
                Repeater1.DataSource = cmd1.ExecuteReader();
                Repeater1.DataBind();
                cont.Close();
            }
        }
    }
}