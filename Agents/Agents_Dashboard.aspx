<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Agents_Dashboard.aspx.cs" Inherits="Petrol_Station.Agents.Agents_Dashboard" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />

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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
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
                        <asp:Label class="actionbar" ID="Label1" runat="server" Text=""></asp:Label>
                        <asp:Label class="actionbar" ID="Label2" runat="server" Text="|"></asp:Label>
                        <asp:Label class="actionbar" ID="Label14" runat="server" Text=""></asp:Label>
                        <asp:Label class="actionbar" ID="Label16" runat="server" Text="|"></asp:Label>

                        <asp:Label class="actionbar" ID="Label18" runat="server" Text=""></asp:Label>
                    </a>
                </div>
                <div id="navbar" class="collapse navbar-collapse" style="color: white;">
                    <ul class="nav navbar-nav text-center" style="color: white;">
                        <%--<li class="active"><a href="#">Sell trees</a></li>--%>
                </div>
                <!--/.nav-collapse -->
            </nav>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="container-fluid" style="margin-top: 60px;">

        <div class="row">

            <%--//START OF TANK--%>

            <%--START OF PANEL BODY -TANK--%>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">

                <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div4">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <asp:Image class="all-icons" ID="Image5" runat="server" ImageUrl="~/Images/account.png" />
                        &nbsp
                        <asp:Label ID="Label20" runat="server" Text="Useer details"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tr>
                                <td class="text-left"><strong><i class="glyphicon glyphicon-user"></i></strong>
                                    &nbsp&nbsp<asp:Label ID="Label9" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>
                                <td class="text-left"><strong><i class="glyphicon glyphicon-map-marker"></i></strong>&nbsp&nbsp
                              <asp:Label ID="Label10" runat="server" Text=""></asp:Label></td>
                            </tr>
                            <tr>

                                <td colspan="2">
                                    <asp:LinkButton ID="LinkButton17" class="btn btn-primary sales1" runat="server">Log out</asp:LinkButton></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">

                
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">

                <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div1">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <div class="row">

                            <div class="col-lg-2 col-sm-2 col-md-2 col-xs-2">
                                <asp:Image class="all-icons" ID="Image3" runat="server" Style="width: 30px; height: 30px;" ImageUrl="~/Images/drop2.png" />
                                &nbsp&nbsp
                            </div>
                            <div class="col-lg-10 col-sm-10 col-md-10 col-xs-10">
                                <div class=" row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                                        <asp:Label ID="Label3" runat="server" Text="Available fuel"></asp:Label>
                                    </div>
                                </div>
                                <div class=" row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="font-size: 12px;">
                                        <asp:Label ID="Label7" runat="server" Text="This is a list of fuel sold here."></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">

                        <%--//REPEATER FOR FUEL--%>
                        <%--____________________________________________________________________________________________________________________________________________________--%>
                        <asp:Repeater ID="Repeater1" runat="server">

                            <ItemTemplate>

                                <div class="row">
                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                        <div class="fuel">
                                            <div class="alert alert-info myalert1 text-center" style="color: #68213A; opacity: 1;">
                                                <div class="row">
                                                    <div class="col-lg-5 col-md-4 col-sm-5 col-xs-5" style="color: #5B5959; font-weight: bold; font-size: 20px;">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 " style="padding-top: 12px;">
                                                                <asp:Image ID="Image34" runat="server" ImageUrl="~/Images/logo.png" Style="width: 30px; height: 30px;" />
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 " style="font-size: 15px; padding-top: 15px;">

                                                                <asp:Label ID="Label44" runat="server" Text='<%#Eval("Fuel_type")%>'></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left: 2px solid #68213A;">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color: #5B5959; font-weight: bold;">
                                                                <i class="glyphicon glyphicon-dashboard"></i>&nbsp
                                                                <asp:Label ID="Label5" runat="server" Text="5654464"></asp:Label>
                                                            </div>

                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color: #5B5959; font-weight: bold;">
                                                                <i class="glyphicon glyphicon-scale"></i>&nbsp<asp:Label ID="Label8" runat="server" Text="3500"></asp:Label>&nbsp
                                                                <asp:Label ID="Label6" runat="server" Text="Litres."></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-top: 5px;">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color: #5B5959; font-weight: bold;">

                                                                <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>
                                                                <%--<asp:LinkButton ID="LinkButton44" CssClass="btn btn-primary sales" runat="server">More</asp:LinkButton>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%--__________________________________________________________________________________________________________________________________________________________--%>

                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 " id="actionTab" runat="server">

                <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div3">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <asp:Image class="all-icons" ID="Image7" runat="server" ImageUrl="~/Images/actions.png" />
                        &nbsp
                        <asp:Label ID="Label29" runat="server" Text="Actions"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">

                                <div class="input-group">
                                    <span class="input-group-btn">

                                        <asp:LinkButton ID="LinkButton19" CssClass="btn btn-danger sales1" runat="server"><i class="glyphicon glyphicon-pencil"></i></asp:LinkButton>
                                    </span>
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="LinkButton20" CssClass="btn btn-danger sales1" runat="server">Sales history</asp:LinkButton>
                                    </span>
                                    <%--<asp:LinkButton ID="LinkButton5"  runat="server" OnClick="refilling">Call Emergency</asp:LinkButton></span>--%>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">

                                <div class="input-group">
                                    <span class="input-group-btn">

                                        <asp:LinkButton ID="LinkButton12" CssClass="btn btn-danger sales1" runat="server"><i class="glyphicon glyphicon-earphone"></i></asp:LinkButton>
                                    </span>
                                    <span class="input-group-btn">
                                        <a href="tel:999" class="btn btn-primary sales1">Call Emergency</a>
                                    </span>
                                    <%--<asp:LinkButton ID="LinkButton5"  runat="server" OnClick="refilling">Call Emergency</asp:LinkButton></span>--%>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">

                                <div class="input-group">
                                    <span class="input-group-btn">

                                        <asp:LinkButton ID="LinkButton3" CssClass="btn btn-primary sales1" runat="server"><i class="glyphicon glyphicon-earphone"></i></asp:LinkButton>
                                    </span>
                                    <span class="input-group-btn">
                                        <a href="tel:0712035642" class="btn btn-primary sales1">Call Manager</a>
                                    </span>
                                    <%--<asp:LinkButton ID="LinkButton5"  runat="server" OnClick="refilling">Call Emergency</asp:LinkButton></span>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                    </div>
                </div>
            </div>
        </div>
        <div class="row"></div>
    </div>

    <div id="nofuel" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <div class="well wellOveride text-center">

                <div class="row text-right">
                    <asp:LinkButton ID="LinkButton21" CssClass="btn btn-default" runat="server"><i class="glyphicon glyphicon-remove-sign"></i></asp:LinkButton>
                </div>
                <div class="row text-center">
                    <i class="glyphicon glyphicon-info-sign"></i>
                </div>
                <strong>
                    <asp:Label ID="Label13" runat="server" Text="This fuel is not availlable in this petrol station!!"></asp:Label></strong>
            </div>
        </div>
    </div>
    <div id="classic" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div2">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <asp:Image class="all-icons" ID="Image8" runat="server" ImageUrl="~/Images/tank2.png" />
                        &nbsp
                        <asp:Label ID="Label17" runat="server" Text="Submit meter"></asp:Label>
                    </div>

                    <div class="panel-body wellOveride" style="border-top-left-radius: unset; border-top-right-radius: unset;">
                        <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <table class="table" id="table1" runat="server" style="border: none" border="0">
                                    <tr style="background-color: white;">
                                        <td class="text-left" style="font-size: 25px;">
                                            <div class="row">
                                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="padding: 5px; border-right: #574D50 solid 2px;">
                                                    <div>
                                                        <strong>
                                                            <asp:Image class="all-icons" ID="Image9" runat="server" Style="width: 20px; height: 20px;" ImageUrl="~/Images/drop.png" /></strong>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 text-left" style="font-size: 15px;">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Label ID="Label21" runat="server" Text="" Style="font-weight: 999; color: #68213A"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                            <asp:Label ID="Label22" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox ID="TextBox2" runat="server" type="number" class="form-control rounded1" MaxLength="12" placeholder="Enter previous metre readings." Style="height: 50px; font-size: 18px; font-weight: 999;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter meter here" SetFocusOnError="true"
                                ForeColor="Red" ValidationGroup="yy"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ErrorMessage="Are you sureyou have typed the meter correctly?Please confirm!." runat="server"
                                ValidationGroup="yy" Visible="true" Display="Dynamic" ControlToValidate="TextBox2" ValidationExpression="^[0-9.]{2,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox ID="TextBox4" runat="server" type="number" class="form-control rounded1" MaxLength="3" placeholder="Enter previous metre readings." Style="height: 50px; font-size: 18px; font-weight: 999;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter previous meter here" SetFocusOnError="true"
                                ForeColor="Red" ValidationGroup="yy"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ErrorMessage="Are you sureyou have typed the meter correctly?Please confirm!." runat="server"
                                ValidationGroup="yy" Visible="true" Display="Dynamic" ControlToValidate="TextBox4" ValidationExpression="^[0-9.]{2,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td colspan="2">
                                            <asp:LinkButton ID="LinkButton7" runat="server"  ValidationGroup="yy" OnClick="next33" class="btn btn-primary sales1">Next Page</asp:LinkButton>

                                        
                                            </td>
                                    </tr>
                                </table>
                                <table class="table" id="table3" runat="server" style="border: none" border="0">
                                    <tr style="background-color: white;">
                                        <td class="text-left" style="font-size: 25px;">
                                            <div class="row">
                                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="padding: 5px; border-right: #574D50 solid 2px;">
                                                    <div>
                                                        <strong>
                                                            <asp:Image class="all-icons" ID="Image12" runat="server" Style="width: 20px; height: 20px;" ImageUrl="~/Images/drop.png" /></strong>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 text-left" style="font-size: 15px;">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Label ID="Label27" runat="server" Text="" Style="font-weight: 999; color: #68213A"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                            <asp:Label ID="Label28" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox ID="TextBox5" runat="server" type="number" class="form-control rounded1" MaxLength="3" placeholder="Enter today's metre readings." Style="height: 50px; font-size: 18px; font-weight: 999;"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter todays meter here" SetFocusOnError="true"
                                ForeColor="Red" ValidationGroup="bn"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ErrorMessage="Are you sureyou have typed the meter correctly?Please confirm!." runat="server"
                                ValidationGroup="bn" Visible="true" Display="Dynamic" ControlToValidate="TextBox5" ValidationExpression="^[0-9.]{2,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td colspan="2">
                                            <asp:LinkButton ValidationGroup="bn" ID="LinkButton10" OnClick="next11" class="btn btn-primary sales1" runat="server">Next page</asp:LinkButton></td>
                                    </tr>
                                </table>
                                <table class="table" id="table2" runat="server" style="border: none" border="0">
                                    <tr style="background-color: white;">
                                        <td colspan="2" class="text-left" style="font-size: 25px;">
                                            <div class="row">
                                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="padding: 5px; border-right: #574D50 solid 2px;">
                                                    <div>
                                                        <strong>
                                                            <asp:Image class="all-icons" ID="Image11" runat="server" Style="width: 20px; height: 20px;" ImageUrl="~/Images/drop.png" /></strong>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 text-left" style="font-size: 15px;">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Label ID="Label23" runat="server" Text="" Style="font-weight: 999; color: #68213A"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                            <asp:Label ID="Label24" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td class="text-center"  colspan="2" >
                                        <Strong><asp:Label style="font-size:40px;font-weight:900"  ID="Label37" runat="server" Text=""></asp:Label></Strong></td>
                                    </tr>
                                    <tr><td> <asp:LinkButton ValidationGroup="bn" ID="LinkButton6" OnClick="prev11" class="btn btn-primary sales1" runat="server"><i class="glyphicon glyphicon-pencil"></i> &nbsp Modify</asp:LinkButton></td><td><asp:LinkButton ValidationGroup="bn" ID="LinkButton11" OnClick="next22" class="btn btn-primary sales1" runat="server"><i class="glyphicon glyphicon-arrow-right"></i> &nbsp <i class="glyphicon glyphicon-saved"></i>&nbsp Finish</asp:LinkButton></td></tr>
                                </table>
                                <table class="table"  runat="server" style="font-size:20px; " id="table6">
                                    <tr>
                                        <td><strong>Previous readings:</strong></td>
                                        <td style="background-color: #68213A; color: white; font-weight: 999">
                                            <asp:Label ID="Label25" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Today's readings:</strong></td>
                                        <td style="background-color: #68213A; color: white; font-weight: 999">
                                            <asp:Label ID="Label26" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>

                                        <td colspan="2">
                                            <div class="btn  btn-group-justified">
                                                <span class="input-group-btn">
                                                    <asp:LinkButton ID="LinkButton8" OnClick="backDoubleTextbox" class="btn btn-primary sales1" runat="server"><i class="glyphicon glyphicon-arrow-left"></i> &nbsp Back</asp:LinkButton>
                                                </span>
                                                <span class="input-group-btn">
                                                    <asp:LinkButton ID="LinkButton9" class="btn btn-primary sales1" runat="server"><i class="glyphicon glyphicon-ok"></i>&nbsp Finish</asp:LinkButton>
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <table class="table confirmed" runat="server" id="tableconfirm" style="background-color: white;">
                                    <tr>
                                        <td colspan="2" class="text-center"><i class="glyphicon glyphicon-exclamation-sign"></i>
                                            <br />
                                            <strong>
                                                <asp:Label ID="Label35" runat="server" Text=""></asp:Label></strong></td>
                                    </tr>
                                    <tr>
                                        <td>Yesterday meter readings:</td>
                                        <td class="success"><strong>
                                            <asp:Label ID="Label31" runat="server" Text=""></asp:Label></strong></td>
                                    </tr>
                                    <tr>
                                        <td>Today meter readings:</td>
                                        <td class="success"><strong>
                                            <asp:Label ID="Label32" runat="server" Text=""></asp:Label></strong></td>
                                    </tr>
                                    <tr>
                                        <td>Litres sold:</td>
                                        <td class="success"><strong>
                                            <asp:Label ID="Label33" runat="server" Text=""></asp:Label></strong></td>
                                    </tr>
                                    <tr>
                                        <td>Price sold:</td>
                                        <td class="success"><strong>
                                            <asp:Label ID="Label34" runat="server" Text=""></asp:Label></strong></td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
        </div>
    </div>
    
    <div class="container">
        <asp:Button ID="Button1" runat="server" OnClick="testtt" Text="Button" />
        <div id="modal12" class="modal fade" role="dialog">

            <div class="modal-dialog">

                <!-- Modal content-->
                <%--    <div class="modal-content">--%>
                <div class="well wellOveride">
                    <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 text-right">
                        <asp:LinkButton ID="LinkButton5" Style="color: #68213A; font-size: 20px;" runat="server"><i class="glyphicon glyphicon-remove-sign"></i></asp:LinkButton>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>

                            <div class="row text-center">
                                <asp:Image ID="Image10" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" Style="height: 50px; width: 50px;" />

                                <div class="" style="color: #68213A; font-size: 20px;">
                                    <strong>
                                        <asp:Label ID="Label30" runat="server" Text="Please enter"></asp:Label>
                                        <asp:Label ID="Label11" runat="server" Text=""></asp:Label><asp:Label ID="Label12" runat="server" Text=" meter readings as indicated on the meter."></asp:Label>
                                    </strong>
                                </div>
                                <br />
                            </div>
                            <div class="row text-center" style="margin-bottom: 20px;" runat="server" id="enterMeter">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center" runat="server" id="secondBox">
                                    <strong>Please enter yesterday meter here</strong>
                                    <asp:TextBox ID="TextBox1" runat="server" type="number" class="form-control rounded1" MaxLength="3" placeholder="Enterprevious metre readings." Style="border: 1px #707070 solid; height: 50px; font-size: 30px; font-weight: 999;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter previous readings here!" SetFocusOnError="true"
                                        ForeColor="Red" ValidationGroup="bib"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Are you sure what you have typed it correct?Please confirm!." runat="server"
                                        ValidationGroup="bib" Visible="true" Display="Dynamic" ControlToValidate="TextBox1" ValidationExpression="^[0-9.]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>

                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 " runat="server" id="firstbox">
                                    <asp:TextBox ID="TextBox3" runat="server" type="number" class="form-control rounded1" MaxLength="3" placeholder="Enter metre readings." Style="border: 1px #707070 solid; height: 50px; font-size: 30px; font-weight: 999;"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" runat="server" ControlToValidate="TextBox3" ErrorMessage="Please enter readings here" SetFocusOnError="true"
                                        ForeColor="Red" ValidationGroup="bib"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ErrorMessage="Are you sure what you have typed it correct?Please confirm!." runat="server"
                                        ValidationGroup="bib" Visible="true" Display="Dynamic" ControlToValidate="TextBox3" ValidationExpression="^[0-9.]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                                </div>

                                <asp:LinkButton ID="LinkButton14" OnClick="submitforreview" ValidationGroup="bib" class="btn btn-default sales1 dialogCustome" runat="server"><i class="glyphicon glyphicon-check"></i> &nbsp Submit</asp:LinkButton>
                                <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
                            </div>

                            <div class="row" runat="server" id="confirmtable">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                                    <table id="confirmTable1" runat="server" class="table" style="font-size: 20px;">
                                        <tr>
                                            <td>Yesterday Meter readings:</td>
                                            <td>
                                                <asp:Label ID="Label4" Style="font-weight: 999" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                    </table>
                                    <table class="table" style="font-size: 20px;">
                                        <tr>
                                            <td>Today Meter readings:</td>
                                            <td>
                                                <asp:Label ID="Label5" Style="font-weight: 999" runat="server" Text=""></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:LinkButton ID="LinkButton13" OnClick="beckToMeter" class="btn btn-default sales1 dialogCustome" runat="server"><i class="glyphicon glyphicon-pencil"></i>&nbsp Modify</asp:LinkButton></td>
                                            <td>
                                                <asp:LinkButton ID="LinkButton18" class="btn btn-default sales1 dialogCustome" OnClick="finishSubmisiion" runat="server"><i class="glyphicon glyphicon-arrow-right"></i> &nbsp Finish</asp:LinkButton></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <div class="footer text-center">

            <div class="hover">
                <span style="margin: 5px;">
                    <asp:LinkButton CssClass="btn btn-default categoryselector12 more text-center" ID="LinkButton1" runat="server">
                  
                        

                        <asp:Label ID="Label19" runat="server" Text=" Submit meter" Style="margin-bottom: 3px;"></asp:Label>
                    </asp:LinkButton></span>


                <asp:LinkButton class="social-link" OnClick="submitpetrol" runat="server">
                    &nbsp
                    <asp:Image ID="Image4" runat="server"  ImageUrl="~/Images/Diesel.png" Style="height: 40px; width: 40px;" />&nbsp&nbsp<strong>Petrol</strong>
                </asp:LinkButton>

              


                <asp:LinkButton OnClientClick="ChangeText()" class="social-link" ID="LinkButton2" runat="server" OnClick="submitparafin">
                    &nbsp
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/parafin.png" Style="height: 40px; width: 40px;" />&nbsp&nbsp<strong>Parafin</strong>
                </asp:LinkButton>
                <asp:LinkButton class="social-link" ID="LinkButton4" runat="server" OnClick="submitdiesl">
                    &nbsp
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/Diesel.png" Style="height: 40px; width: 40px;" />&nbsp&nbsp<strong>Diesel</strong>
                </asp:LinkButton>

                <%--                <asp:LinkButton class="social-link" ID="LinkButton15"  runat="server" >&nbsp
                    <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/parafin.png" OnClick="submitparafin" Style="height: 40px; width: 40px;" />&nbsp&nbsp<strong>Parafin</strong></asp:LinkButton>
                <asp:LinkButton class="social-link" ID="LinkButton16"  runat="server" >&nbsp
                    <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/Diesel.png" OnClick="submitdiesl" Style="height: 40px; width: 40px;" />&nbsp&nbsp<strong>Diesel</strong></asp:LinkButton>
                --%>
            </div>
        </div>
    </div>
</asp:Content>