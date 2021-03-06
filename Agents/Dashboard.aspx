﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Petrol_Station.Agents.Dashboard" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.7-dist/js/Modals.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.7-dist/css/fuel_styles.css" rel="stylesheet" />
    <%--<a href="../bootstrap-3.3.7-dist/js/">../bootstrap-3.3.7-dist/js/</a>--%>
    <script type="text/javascript">
        $("#clickArea").live("click", function () {
            $("[id*=Button1]").click();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <nav class="navbar navbar-inverse navbar-fixed-top" style="color: white; background-color: #68213A">
        <a class="navbar-brand" href="#" style="font-weight: bolder; color: white; padding: 0px; margin: 0px;">
            <%--<div class="container">--%>

            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite1.png" Style="width: 40px; height: 40px; margin: 2px;" />

            <%--</div>--%>
        </a>

        <div class="navbar-header" style="color: white;">

            <%--<asp:LinkButton ID="LinkButton5" class="navbar-toggle  " data-target="#navbar" aria-expanded="false" aria-controls="navbar" runat="server"><i class="glyphicon glyphicon-off"></i></asp:LinkButton>--%>
            <%--<button type="button" >--%>
            <%--   <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>--%>

            <a class="navbar-brand" href="#" style="font-weight: bolder; color: white; font-size: 10px;">
                <asp:Label ID="Label1" runat="server" Text="Mwalimu"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="|"></asp:Label>
                <asp:Label ID="Label14" runat="server" Text=""></asp:Label>
                <asp:Label ID="Label16" runat="server" Text="|"></asp:Label>

                <asp:Label ID="Label18" runat="server" Text=""></asp:Label>
            </a>
        </div>
        <div id="navbar" class="collapse navbar-collapse" style="color: white;">
            <ul class="nav navbar-nav text-center" style="color: white;">
                <%--<li class="active"><a href="#">Sell trees</a></li>--%>
        </div>
        <!--/.nav-collapse -->
    </nav>
    <div class="container-fluid" style="margin-top: 60px;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="row">

            <%--//START OF TANK--%>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">

                <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div1">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                         <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                            <ContentTemplate>
                          <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick">
                                </asp:Timer>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-center ">
                                <asp:Image class="all-icons1" ID="Image3" runat="server" ImageUrl="~/Images/tank2.png" /><br />
                                <%--<asp:Label ID="Label4" runat="server" Text="Current"></asp:Label>--%>
                                <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
                                <asp:Label ID="Label19" runat="server" Text="capacity"></asp:Label>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 ">
                                <asp:Image class="all-icons1" ID="Image4" runat="server" ImageUrl="~/Images/meter1.png" /><br />
                                <asp:Label ID="Label3" runat="server" Text="Level indicator"></asp:Label>
                            </div>
                        </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>

                    <div class="panel-body">
                             <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                            <ContentTemplate>
                        <asp:Timer ID="Timer2" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>

                        <div class="row">
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 " style="margin-left: 0px; margin-right: 0px;">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div style="" class="toptank text-center">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div class=" price-holder text-center">
                                            <strong>
                                                <%--   <asp:Label ID="Label7" runat="server" Text="Price per sLitre:" style="font-family:Watch;color:#68213A"></asp:Label>&nbsp--%>
                                                <br />
                                                <div class="meter-readings1">
                                                    <i class="glyphicon glyphicon-dashboard"></i>
                                                    <asp:Label Style="" ID="Label7" runat="server" Text="3654243.76"></asp:Label>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                </div>

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                        <div id="clickArea" class="backtank" runat="server" style="">
                                            <div style="" id="tank" runat="server" class="frontank text-center">
                                                <asp:Label ID="Label5" runat="server" Text="1499.654" CssClass="capacity"></asp:Label><asp:Label ID="Label6" runat="server" Text="Litres"></asp:Label>
                                                <%-- <div class="borderholder">
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                            <div class="alt1">
                                                            </div>
                                                        </div>--%>
                                            </div>
                                            <%--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >--%>

                                            <%--<hr  style="height:2px;background-color:green;" />--%>
                                            <%--</div>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 " style="margin-left: 0px; margin-right: 0px;">
                                <div class="row">
                                    <asp:Label ID="Label10" runat="server" Text="Full" Style="color: green; font-weight: bold;"></asp:Label>
                                </div>
                                <div class="row">
                                    <div style="height: 50px; width: 10px; background-color: #0F7E2C; border-top-left-radius: 15px; border-top-right-radius: 15px;"></div>

                                    <div style="height: 50px; width: 10px; background-color: #8BD99F"></div>
                                    <div style="height: 50px; width: 10px; background-color: #BAD1BC"></div>
                                    <div style="height: 50px; width: 10px; background-color: #DA98A0"></div>

                                    <div style="height: 50px; width: 10px; background-color: #D34C5D"></div>

                                    <div style="height: 50px; width: 10px; background-color: #D3001A; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;"></div>
                                </div>
                                <div class="row">
                                    <asp:Label ID="Label11" runat="server" Text="Empty" Style="color: red; font-weight: bold;"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-md-1 col-sm-1 col-xs-1 text-right " style="margin-right: 0px; padding-right: 0px;">
                                <div style="width: 2px; background-color: #707070; height: 40px;"></div>
                            </div>

                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 text-left " style="margin-left: 0px; padding-left: 0px;">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <strong><i class="glyphicon glyphicon-usd"></i>&nbsp
                                            <asp:Label Style="" ID="Label8" runat="server" Text=""></asp:Label>
                                            <asp:Label ID="Label9" runat="server" Text="-Current price per litre."></asp:Label></strong>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <strong>
                                            <%--asp:Label ID="Label31" runat="server" Text="Generate fuel reports PDF"></asp:Label>--%>

                                            <asp:LinkButton ID="LinkButton13" data-toggle="modal" data-target="#reportsModal" runat="server"><i class="glyphicon glyphicon-print"></i>&nbsp Generate  fuel reports PDF</asp:LinkButton>
                                        </strong>
                                    </div>
                                </div>
                            </div>
                        </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="row " style="margin-top: 7px;">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">

                                <%--<asp:LinkButton ID="LinkButton3" CssClass="btn btn-primary sales1" runat="server" OnClick="LinkButton3_Click"><i class="glyphicon glyphicon-user"></i>&nbsp Admin</asp:LinkButton>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--START OF PANEL BODY -TANK--%>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">

                <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div2">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <i class="glyphicon glyphicon-cog"></i>&nbsp
                        <asp:Label ID="Label20" runat="server" Text="Account management"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">
                                <asp:LinkButton ID="LinkButton3" CssClass="btn btn-primary sales1" runat="server" OnClick="refilling"><i class="glyphicon glyphicon-user"></i>&nbsp Agents Management</asp:LinkButton>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">
                                <asp:LinkButton ID="LinkButton20" CssClass="btn btn-primary sales1" runat="server" OnClick="refilling"><i class="glyphicon glyphicon-dashboard"></i> &nbsp Station management</asp:LinkButton>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">
                                <asp:LinkButton ID="LinkButton21" CssClass="btn btn-primary sales1" runat="server" OnClick="refilling"><i class="glyphicon glyphicon-dashboard"></i> &nbsp My account</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">

                <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div3">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <asp:Image class="all-icons" ID="Image7" runat="server" ImageUrl="~/Images/actions.png" />&nbsp
                        <asp:Label ID="Label29" runat="server" Text="Actions"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">
                                <asp:LinkButton ID="LinkButton5" CssClass="btn btn-default sales1" runat="server" OnClick="refilling"><i class="glyphicon glyphicon-dashboard"></i> &nbsp Refill tank</asp:LinkButton>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">
                                <asp:LinkButton ID="LinkButton7" CssClass="btn btn-primary sales1" runat="server" OnClick="changePrice"><i class="glyphicon glyphicon-pencil"></i> &nbsp Change price</asp:LinkButton>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">
                                <asp:LinkButton ID="LinkButton12" CssClass="btn btn-primary sales1" runat="server" OnClick="changePrice"><i class="glyphicon glyphicon-pencil"></i> &nbsp Change price</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                    </div>
                </div>
            </div>
        </div>
        <div id="reportsModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <%--    <div class="modal-content">--%>
                <div class="well wellOveride text-center">
                    <div class="row text-left" style="margin-bottom: 10px;">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <asp:LinkButton ID="LinkButton15" data-dismiss="modal" class="btn btn-default back " runat="server"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp Back</asp:LinkButton>
                        </div>
                    </div>
                    <div class="row rowmargin">

                        <asp:LinkButton ID="LinkButton1455" runat="server" CssClass="btn btn-primary categoryselector" OnClick="generateAll"><i class="glyphicon glyphicon-print"></i>&nbsp Meter records</asp:LinkButton>
                    </div>
                    <div class="row rowmargin">
                        <asp:LinkButton ID="LinkButton23" runat="server" CssClass="btn btn-primary categoryselector" data-toggle="modal" data-target="#sales"><i class="glyphicon glyphicon-print"></i>&nbsp Sales Records</asp:LinkButton>
                    </div>
                    <div class="row rowmargin">
                        <asp:LinkButton ID="LinkButton433" runat="server" CssClass="btn btn-primary categoryselector" OnClick="LinkButton2_Click"><i class="glyphicon glyphicon-print"></i>&nbsp List of agents</asp:LinkButton>
                    </div>
                    <div class="row rowmargin">
                        <asp:LinkButton ID="LinkButton6333" runat="server" CssClass="btn btn-primary categoryselector" OnClick="LinkButton2_Click"><i class="glyphicon glyphicon-print"></i>&nbsp List of Fuel</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
        <div id="sales" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="UpdatePanel22" UpdateMode="Conditional" runat="server">

                <ContentTemplate>
                <div class="panel panel-default " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div5">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <div class="row text-left" style="margin-bottom: 10px;">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <asp:LinkButton ID="LinkButton1" data-dismiss="modal" class="btn btn-default back " runat="server"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp Back</asp:LinkButton>
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

                                <asp:LinkButton ID="LinkButton4" class="btn btn-default sales1" OnClick="filterRecords" runat="server"><i class="glyphicon glyphicon-search"></i>&nbsp Search</asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <div class="panel-body text-center" style="border-top-left-radius: unset; border-top-right-radius: unset;">
                        <div class="row text-right">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-left">
                                <asp:Label ID="Label30" runat="server" Style="font-weight: 900; font-size: 15px;" Text="Results"></asp:Label>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                <asp:LinkButton ID="LinkButton6" OnClick="pdf" class="btn btn-default " Style="margin-right: 30px; margin-bottom: 10px;" runat="server"><i class="glyphicon glyphicon-print"></i>&nbsp Download PDF</asp:LinkButton>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="overflow: auto">
                            </div>
                        </div>
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
                        <div class="row text-center">
                            <h3><span class="label label-default">Chebiemit</span></h3>
                            <div class="btn btn-group">
                                <asp:LinkButton ID="LinkButton14" class="btn btn-default" OnClick="topten" runat="server">View top ten</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton19" class="btn btn-default" OnClick="todaySales" runat="server">Today</asp:LinkButton>
                            </div>
                        </div>
                        <%-- <div class="row text-center">
                                                        <h3> <span class="label label-default">Chebara</span></h3>

                            <div class="btn btn-group">
                            <asp:LinkButton ID="LinkButton21" class="btn btn-default" OnClick="searchrecords" runat="server">View top ten</asp:LinkButton>
                                    <asp:LinkButton ID="LinkButton22" class="btn btn-default" OnClick="searchrecords" runat="server">Today</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton24" class="btn btn-default" OnClick="searchrecords" runat="server">Today</asp:LinkButton>
                                </div></div>--%>
                    </div>
                </div>
            </div>
        </div>
        </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="LinkButton13" />

                    <asp:PostBackTrigger ControlID="LinkButton9" />
                </Triggers>
            </asp:UpdatePanel>
    </div>
    </div>
             </div>

        <%---------------------------------------------------------------------END OF TANK------------------------------------------------------%>
    <%--//CHANGING PRICE MODAL--%>
</div>
        <div id="modal1" class="modal fade" role="dialog">

            <div class="modal-dialog">

                <!-- Modal content-->
                <%--    <div class="modal-content">--%>
                <div class="well wellOveride">
                    <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 text-right">
                        <asp:LinkButton ID="LinkButton78" CssClass="btn btn-default" runat="server"><i class="glyphicon glyphicon-remove-sign"></i></asp:LinkButton>
                    </div>
                    <div class="row text-center">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" Style="height: 50px; width: 50px;" />
                        <h3></h3>

                        <div class="alert alert-info" style="background-color: #68213A; color: white;">
                            <strong>Please set
                                <asp:Label ID="Label17" runat="server" Text=""></asp:Label><asp:Label ID="Label21" runat="server" Text=" price per litre."></asp:Label>
                            </strong>
                        </div>
                    </div>
                    <div class="row text-center" style="margin-bottom: 20px;">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control rounded1" MaxLength="6" placeholder="Enter price here" Style="border: 1px #707070 solid;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter price" SetFocusOnError="true"
                                ForeColor="Red" ValidationGroup="bb"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Are you sure what you have typed is correct?Please confirm!." runat="server"
                                ValidationGroup="bb" Visible="true" Display="Dynamic" ControlToValidate="TextBox1" ValidationExpression="^[0-9.]{2,6}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>

                        <asp:LinkButton ID="LinkButton554" runat="server" ValidationGroup="bb" CssClass="btn btn-primary categoryselector" OnClick="updatePrice"><i class="glyphicon glyphicon-usd"></i>&nbsp Update price</asp:LinkButton><br />
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <%--</div>--%>

            <%--//REFILING PETROL DASHBOAD--%>
        </div>
    <%--//REFILLING TANK--%>
    <div id="refill" class="modal fade" role="dialog">

        <div class="modal-dialog">

            <!-- Modal content-->
            <%--    <div class="modal-content">--%>
            <div class="well wellOveride" style="background-color: white; opacity: 1; border-radius: 10px;">
                <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 text-right">
                    <asp:LinkButton ID="LinkButton8" CssClass="btn btn-default" runat="server"><i class="glyphicon glyphicon-remove-sign"></i></asp:LinkButton>
                </div>
                <div class="row text-center">
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" Style="height: 50px; width: 50px;" />

                    <h3></h3>

                    <div class="alert alert-info" style="background-color: #68213A; color: white;">
                        <strong>
                            <asp:Label ID="Label28" runat="server" Text=""></asp:Label><asp:Label ID="Label22" runat="server" Text=""></asp:Label>
                            <asp:Label ID="Label299" runat="server" Text=""></asp:Label></strong>
                    </div>
                </div>
                <div class="row text-center" style="margin-bottom: 20px;" runat="server" id="beforeSubmit">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                        <asp:TextBox ID="TextBox2" runat="server" class="form-control rounded1" MaxLength="10" type="number" placeholder="Volume refilled" Style="border: 1px #707070 solid;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="TextBox2" ErrorMessage="Are you sure what you have typed is correct?Please confirm!." SetFocusOnError="true"
                            ForeColor="Red" ValidationGroup="q"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ErrorMessage="Are you sure what you have typed is correct?Please confirm!." runat="server"
                            ValidationGroup="q" Visible="true" Display="Dynamic" ControlToValidate="TextBox2" ValidationExpression="^[0-9.]{3,10}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                        </asp:RegularExpressionValidator>
                    </div>

                    <asp:LinkButton ID="LinkButton9" runat="server" ValidationGroup="q" CssClass="btn btn-primary categoryselector" OnClick="ConfirmUpdatePrice"><i class="glyphicon glyphicon-check"></i>&nbsp Submit </asp:LinkButton><br />
                    <asp:Label ID="Label24" runat="server" Text=""></asp:Label>
                </div>
                <div class="row text-center" style="margin-bottom: 20px;" runat="server" id="confirm">
                    <div class="alert alert-info" id="tableConfirming" runat="server">
                        <div class="row">

                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <table class="table">
                                    <tr class="text-center">
                                        <td colspan="2">
                                            <strong>NB:Are you sure you want to submit the following data??This action cannot be reversed.</strong>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Previous tank capacity:</td>
                                        <td>
                                            <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Ammount to refill:</td>
                                        <td>
                                            <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>New tank capacity:</td>
                                        <td>
                                            <asp:Label ID="Label26" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:LinkButton ID="LinkButton10" runat="server" CssClass="btn btn-primary categoryselector1" OnClick="cancelRefill"><i class="glyphicon glyphicon-pencil"></i>&nbsp Modify </asp:LinkButton></td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton11" runat="server" CssClass="btn btn-primary categoryselector1" OnClick="confirmRefilling"><i class="glyphicon glyphicon-check"></i>&nbsp Confirm </asp:LinkButton></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
                            </div>
                        </div>
                    </div>
                    <asp:Label ID="Label27" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <%--</div>--%>

            <%--//REFILING PETROL DASHBOAD--%>
        </div>
        <div id="modal2" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <div class="alert alert-success">
                    <strong>Enter admin password to continue!</strong>
                    <div class="row">
                        <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 ">

                            <asp:TextBox ID="TextBox4" MaxLength="8" runat="server" class="form-control rounded1" placeholder="Enter password here"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter password here"
                                ForeColor="Red" ValidationGroup="vv"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ErrorMessage="Invalid characters" runat="server"
                                ValidationGroup="vv" Display="Dynamic" Visible="true" ControlToValidate="TextBox4" ValidationExpression="^[0-9a-zA-Z]{1,15}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                            <asp:LinkButton ValidationGroup="vv" ID="LinkButton2" CssClass="btn btn-primary mycolor" runat="server">Proceed</asp:LinkButton>
                            <asp:Label ID="Label13" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="footer">
            <div class="hover">
                <span>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/more.png" class="more" /><i class="glyphicon glyphicon-triangle-left"></i>&nbsp Menu</span>

                <asp:LinkButton class="social-link" ID="LinkButton16" OnClick="choose" runat="server"><i class="glyphicon glyphicon-retweet"></i></asp:LinkButton>
                <asp:LinkButton class="social-link" ID="LinkButton17" OnClick="addAccount" runat="server"><i class="glyphicon glyphicon-user"></i></asp:LinkButton>
                <asp:LinkButton class="social-link" ID="LinkButton18" OnClick="log_out" runat="server"><i class="glyphicon glyphicon-off"></i></asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>