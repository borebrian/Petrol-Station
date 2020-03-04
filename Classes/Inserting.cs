using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InsertingRecords
{
    public partial class OpenClass: System.Web.UI.Page
    {
        public void inserting(String sql)
        {
            string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();
            SqlConnection con = new SqlConnection(str);
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.ExecuteNonQuery();

            con.Close();
            
        }
        public void ClearInputs(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox && ctrl.ID =="TextBox1")
                {


                }
                else if(ctrl is TextBox && ctrl.ID != "TextBox1")
                    ((TextBox)ctrl).Text = string.Empty;
                else if (ctrl is DropDownList)
                    ((DropDownList)ctrl).ClearSelection();

                ClearInputs(ctrl.Controls);
            }
        }
        public void AddToSession(String SessionName,String SessionMessage)
        {
            Session.Add(SessionName, SessionMessage);
        }
        // Generate a random number between two numbers  
        public int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }
        public Boolean CheckIfReffExist(String Textbox)
        {
            if (Textbox != "")
            {
                return true;
            }
            else
            {

                return false;
                
            }
        }




    }
}