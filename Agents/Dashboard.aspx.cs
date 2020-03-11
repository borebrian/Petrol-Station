using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InsertingRecords;
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
            else{
                //INITIALIZE TWILIO AUTH
                Auth s = new Auth();
                s.InitTwilio();
                actions();
                tableConfirming.Visible = false;

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Label5.Text = "dshfsjfshfs";
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Clicked')", true);
        }
        protected void changePrice(object sender, EventArgs e)
        {
            TextBox1.Text = Session["Price_itre"].ToString();
            Label17.Text = Session["Fuel_type"].ToString();
            tableConfirming.Visible = false;
            //Response.Write("you clicked the div clickArea");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "part()", true);
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", " twilio()", true);



        }
        protected void refilling(object sender, EventArgs e)
        {
            Label22.Text = Session["Fuel_type"].ToString();
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
            SqlCommand cmd = new SqlCommand("select *from Fuel WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_type"] + "'", con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                float prev = int.Parse(myDataReadert["Current_capacity"].ToString());
                float toBeRefilled = int.Parse(Label25.Text.ToString());
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
                    generalClass.inserting("UPDATE FUEL SET Current_capacity ='" + newValue + "' WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_type"] + "'");
                    SqlConnection cont = new SqlConnection(str);
                    SqlCommand cmdt = new SqlCommand("select *from Agents_Reg WHERE Station_ref='" + Session["Station_ref"] + "'", cont);
                    cont.Open();
                    SqlDataReader myDataReadertt = cmdt.ExecuteReader();
                    if (myDataReadertt.Read())
                    {
                        string message1 = "" + Session["Fuel_type"] + "' price has changed as follows: ";
                        string message2 = "Price per litre:" + newValue + ". ";
                        string message3 = message1 + message2 + "Please contact station manager for more details.";




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
                float prev = int.Parse(myDataReadert["Current_capacity"].ToString());
                float toBeRefilled = int.Parse(TextBox2.Text.ToString());
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
            

            generalClass.inserting("Update Fuel set Price_itre='" + TextBox1.Text+ "' WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_type"] + "'");
            Label4.Text = "Submitted and notification message sent to Agent successfully!";
            Label14.ForeColor = System.Drawing.Color.Green;

            //LETS SEND MESSAGE TO AGENTS FOR NEW PRICE
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand("select *from Agents_Reg WHERE Station_ref='"+Session["Station_ref"]+"'", con);
            con.Open();
            SqlDataReader myDataReadert = cmd.ExecuteReader();
            if (myDataReadert.Read())
            {
                string message1 = "The " + Session["Fuel_type"] + " price has changed as follows: ";
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
        public void setTank()
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
                SqlCommand cmd = new SqlCommand("SELECT *FROM Fuel WHERE Station_ref='" + Session["Station_ref"] + "' AND Fuel_type='" + Session["Fuel_type"] + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    {
                        float totalcapacity = int.Parse(dr["Tank_capacity"].ToString());
                        float currentCapacity = int.Parse(dr["Current_capacity"].ToString());
                        float toDisplay = ((currentCapacity / totalcapacity) * Pixelheight);
                        float InverseDisplay = Pixelheight - toDisplay;
                        string InverseDisplayConverted = String.Concat(InverseDisplay, unit);

                        tank.Style.Add("height", InverseDisplayConverted);

                        Label5.Text = dr["Current_capacity"].ToString();
                        Label14.Text = Session["Station_name"].ToString();
                        Label8.Text = dr["Price_itre"].ToString();
                        Session.Add("Price_itre", dr["Price_itre"]);
                        Label18.Text = Session["Fuel_type"].ToString();
                        Label15.Text = Session["Fuel_type"].ToString();

                        //CHANGE TANK COLOR
                        if (currentCapacity <= ((totalcapacity / 6) * 1))
                        {
                            clickArea.Style.Add("Background-color", "#D3001A;");
                            tank.Style.Add("border-bottom-left-radius", "50px");

                            tank.Style.Add("border-bottom-right-radius", "50px");
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