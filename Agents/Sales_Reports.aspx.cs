using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Petrol_Station.Agents
{
    public partial class Sales_Reports : System.Web.UI.Page
    {
        private string str = ConfigurationManager.ConnectionStrings["Fuel_systemConnectionString"].ToString();

        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}