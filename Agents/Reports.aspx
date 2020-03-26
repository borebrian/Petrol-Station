<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Petrol_Station.Agents.Reports" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.7-dist/js/Modals.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.7-dist/css/fuel_styles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <nav class="navbar navbar-inverse navbar-fixed-top" style="color: white; background-color: #128213A">
       


        
            <div class="navbar-header" style="color: white;">

                <%--<asp:LinkButton ID="LinkButton5" class="navbar-toggle  " data-target="#navbar" aria-expanded="false" aria-controls="navbar" runat="server"><i class="glyphicon glyphicon-off"></i></asp:LinkButton>--%>
                <%--<button type="button" >--%>
                <%--   <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>--%>

                <a class="navbar-brand" href="#" style="font-weight: bolder; color: white; font-size: 10px;">
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-default" runat="server" style="margin-top:10px;" OnClick="LinkButton1_Click"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp Back</asp:LinkButton>

                    <asp:Label ID="Label18" runat="server" Text=""></asp:Label>







                </a>

            </div>
            <div id="navbar" class="collapse navbar-collapse" style="color: white;">
                <ul class="nav navbar-nav text-center" style="color: white;">
                    <%--<li class="active"><a href="#">Sell trees</a></li>--%>
            </div>
            <!--/.nav-collapse -->
       
    </nav>
    <div class="container-fluid" style="padding:10px;padding-top:60px;">
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></cc1:ToolkitScriptManager>
        
        <div class="row">

            <%--//START OF TANK--%>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">

                <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div1">
                    <div class="panel-heading text-center" style="  background-color:#68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        
                              
                              
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center ">
                                        <asp:Image class="all-icons1" ID="Image3" runat="server" ImageUrl="~/Images/tank2.png" /><br />
                                        <%--<asp:Label ID="Label4" runat="server" Text="Current"></asp:Label>--%>
                                        <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
                                        <asp:Label ID="Label19" runat="server" Text="Petrol Tank 1">


                                        </asp:Label>



                                    </div>
                                  
                                </div>
                       

                    </div>

                    <div class="panel-body">





                        <asp:Chart ID="Chart1" runat="server">
                            <Series>
                                <asp:Series Name="Series1"></asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Fuel_systemConnectionString %>" SelectCommand="SELECT        Station_ref, Year, Date, Month, Previous_meter, Expr1, Price_itre, Agent_ID, Fuel_type, Time_stamp, Litres_sold, Sales, Full_names, Ref, Tank_capacity, Current_capacity, Current_meter, [AGENT NAME], Phone, Station_name, 
                         Agent_phone
FROM            dbo.Sales"></asp:SqlDataSource>


                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fuel_systemConnectionString %>" SelectCommand="SELECT        TOP (7) Sales, Fuel_type, Date
FROM            dbo.Sales
, Fuel_type, Date
HAVING        (Fuel_type = N'PETROL1')"></asp:SqlDataSource>


                        </div></div></div></div>

    </div>
</asp:Content>
