<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sales_Reports.aspx.cs" Inherits="Petrol_Station.Agents.Sales_Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.7-dist/js/Modals.js"></script>
      <meta name="viewport" content="width=device-width, initial-scale=1">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container" style="background-color:red;"> 
    <nav class="navbar navbar-inverse navbar-fixed-top" style="color: white; background-color: #68213A">
       


        
            <div class="navbar-header" style="color: white;">

                <%--<asp:LinkButton ID="LinkButton5" class="navbar-toggle  " data-target="#navbar" aria-expanded="false" aria-controls="navbar" runat="server"><i class="glyphicon glyphicon-off"></i></asp:LinkButton>--%>
                <%--<button type="button" >--%>
                <%--   <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>--%>

                <a class="navbar-brand" href="#" style="font-weight: bolder; color: white; font-size: 10px;">
                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-default" runat="server" style="margin-top:10px;" ><i class="glyphicon glyphicon-arrow-left"></i>&nbsp Back</asp:LinkButton>

                    <asp:Label ID="Label18" runat="server" Text=""></asp:Label>







                </a>

            </div>
            <div id="navbar" class="collapse navbar-collapse" style="color: white;">
                <ul class="nav navbar-nav text-center" style="color: white;">
                    <%--<li class="active"><a href="#">Sell trees</a></li>--%>
            </div>
            <!--/.nav-collapse -->
       
    </nav>

         
        </div>
    <div class="container" style="margin-top:55px;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>
         <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div1">
                  <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                            <div class="row text-left" style="margin-bottom: 10px;">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <asp:LinkButton ID="LinkButton13" data-dismiss="modal" class="btn btn-default back " runat="server"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp Back</asp:LinkButton>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 ">
                                    Select date:
                                            <asp:DropDownList class="form-control rounded1" Style="width: 100%;" ID="DropDownList1" runat="server">

                                                <asp:ListItem>1 </asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4 </asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9 </asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                                <asp:ListItem>13</asp:ListItem>
                                                <asp:ListItem>14 </asp:ListItem>
                                                <asp:ListItem>15</asp:ListItem>
                                                <asp:ListItem>17</asp:ListItem>
                                                <asp:ListItem>18</asp:ListItem>
                                                <asp:ListItem>19 </asp:ListItem>
                                                <asp:ListItem>20</asp:ListItem>
                                                <asp:ListItem>21</asp:ListItem>
                                                <asp:ListItem>22</asp:ListItem>
                                                <asp:ListItem>23</asp:ListItem>
                                                <asp:ListItem>24 </asp:ListItem>
                                                <asp:ListItem>25</asp:ListItem>
                                                <asp:ListItem>26</asp:ListItem>
                                                <asp:ListItem>27</asp:ListItem>
                                                <asp:ListItem>28</asp:ListItem>
                                                <asp:ListItem>29</asp:ListItem>
                                                <asp:ListItem>30</asp:ListItem>
                                                <asp:ListItem>31</asp:ListItem>
                                            </asp:DropDownList>
                                </div>

                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6 ">
                                    Select month:
                                            <asp:DropDownList class="form-control rounded1" Style="width: 100%;" ID="DropDownList2" runat="server">

                                                <asp:ListItem>1 </asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4 </asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9 </asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                                <asp:ListItem>12</asp:ListItem>
                                            </asp:DropDownList>
                                </div>

                                <div class="col-lg- col-md-3 col-sm-3 col-xs-6 ">
                                    Select Year:
                                            <asp:DropDownList class="form-control rounded1" Style="width: 100%;" ID="DropDownList3" runat="server">

                                                <asp:ListItem>2019 </asp:ListItem>
                                                <asp:ListItem>2020</asp:ListItem>
                                                <asp:ListItem>2021</asp:ListItem>
                                            </asp:DropDownList>
                                </div>
                                <div class="col-lg- col-md-3 col-sm-3 col-xs-6" style="margin-top: 15px; margin-bottom: 15px;">

                                    <asp:LinkButton ID="LinkButton5" class="btn btn-default sales1" OnClick="filterRecords" runat="server"><i class="glyphicon glyphicon-search"></i>&nbsp Search</asp:LinkButton>
                                </div>
                            </div>
                        </div>

                    <div class="panel-body">
                        <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                            <div class="fuel">
                                                <div class="alert alert-info myalert1 text-center" style="color: #68213A; opacity: 1;">
                                                    <div class="row">
                                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="color: #5B5959; font-weight: bold; font-size: 20px;">
                                                            <div class="row">
                                                                <%-- <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 " style="padding-top: 40px;">
                                                                <asp:Image ID="Image34" runat="server" ImageUrl="~/Images/calender.png" Style="width: 20px; height: 20px;" />
                                                            </div>--%>
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " style="font-size: 20px; padding-top: 30px;">

                                                                    <asp:Label ID="Label44" runat="server" Text='<%#Eval("Date")%>'></asp:Label>/
                                                                <asp:Label ID="Label11" runat="server" Text='<%#Eval("Month")%>'></asp:Label>/
                                                                <asp:Label ID="Label12" runat="server" Text='<%#Eval("Year")%>'></asp:Label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5" style="border-left: 2px solid #68213A;">
                                                            <div class="row">
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color: #68213A; font-weight: bold;">
                                                                    <span class="iconify" data-icon="fxemoji:fuelpump" data-inline="false"></span>&nbsp
                                                                <strong>
                                                                    <asp:Label ID="Label40" Style="color: #68213A; font-weight: 900" runat="server" Text='<%#Eval("FUEL")%>'></asp:Label></strong>&nbsp
                                                                </div>
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color: #5B5959; font-weight: bold;">
                                                                    <i class="glyphicon glyphicon-flash"></i>&nbsp
                                                                <asp:Label ID="Label4" runat="server" Text='<%#Eval("[VOLUME SOLD]")%>'></asp:Label>&nbsp
                                                                <asp:Label ID="Label15" runat="server" Text="Litres:"></asp:Label>
                                                                </div>
                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color: #5B5959; font-weight: bold;">
                                                                    <span class="iconify" data-icon="whh:price" data-inline="false"></span>&nbsp
                                                                <asp:Label ID="Label36" runat="server" Text='<%#Eval("Price_itre")%>'></asp:Label>&nbsp
                                                                <asp:Label ID="Label39" runat="server" Text="/Litre"></asp:Label>
                                                                </div>

                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color: #5B5959; font-weight: bold;">
                                                                    <i class="glyphicon glyphicon-usd"></i>&nbsp
                                                                <asp:Label ID="Label6" runat="server" Text="Ksh:"></asp:Label>&nbsp

                                                                <asp:Label ID="Label8" runat="server" Text='<%#Eval("Sales")%>'></asp:Label>&nbsp
                                                                </div>
                                                            </div>
                                                            <div class="row" style="margin-top: 5px;">
                                                                <%--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color: #5B5959; font-weight: bold;">

                                                                <asp:LinkButton ID="LinkButton44" CssClass="btn btn-default sales" runat="server">More</asp:LinkButton>
                                                            </div>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        <asp:LinkButton ID="LinkButton14" class="btn btn-default" OnClick="searchrecords" runat="server">View top ten</asp:LinkButton>




                       


                        </div></div>
                            </ContentTemplate>
             </asp:UpdatePanel>
    </div>


</asp:Content>
