using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Administration;

using InsertingRecords;
namespace Petrol_Station.Agents
{
    public partial class Log_in : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {


            Administrations Admin = new Administrations();

           
            Admin.Login("SELECT *FROM System_Users WHere National_ID=@Username and Password=@Password", TextBox5.Text,TextBox1.Text);
            if (Admin.test)
            {
                if (TextBox1.Text == "12345678")
                {
                    Response.Redirect("../Agents/Set_new_password.aspx");
                }
                else
                {
                    
                    
                        Response.Redirect("../Agents/Petrol_station_selection.aspx");


                    

                }
            }
            else
            {
                Admin.LoginaAgents("SELECT *FROM Agents_Reg WHere National_ID=@Username and Password=@Password", TextBox5.Text, TextBox1.Text);
                if (Admin.test)
                {
                    if (TextBox1.Text == "12345678")
                    {
                        Response.Redirect("../Agents/Set_new_password.aspx");
                    }
                    else
                    {


                        Response.Redirect("../Agents/Agents_Dashboard.aspx");




                    }
                }
                else
                {
                    OpenClass Clear = new OpenClass();
                    Clear.ClearInputs(Page.Controls);
                    Label4.Text = "Invalid credentials";
                }
                   
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Agents/Reset_pass.aspx");
            SmtpClient smtpClient = new SmtpClient("mail.MyWebsiteDomainName.com", 25);

            smtpClient.Credentials = new System.Net.NetworkCredential("info@MyWebsiteDomainName.com", "myIDPassword");
            // smtpClient.UseDefaultCredentials = true; // uncomment if you don't want to use the network credentials
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpClient.EnableSsl = true;
            MailMessage mail = new MailMessage();

            //Setting From , To and CC
            mail.From = new MailAddress("info@MyWebsiteDomainName", "MyWeb Site");
            mail.To.Add(new MailAddress("info@MyWebsiteDomainName"));
            mail.CC.Add(new MailAddress("MyEmailID@gmail.com"));

            smtpClient.Send(mail);
        }
       
    }
}