<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Agents_Dashboard.aspx.cs" Inherits="Petrol_Station.Agents.Agents_Dashboard" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />

    <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="https://code.iconify.design/1/1.0.4/iconify.min.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.7-dist/js/Modals.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />

    <link href="../bootstrap-3.3.7-dist/css/fuel_styles.css" rel="stylesheet" />
    <%--<a href="../bootstrap-3.3.7-dist/js/">../bootstrap-3.3.7-dist/js/</a>--%>
    <script type="text/javascript">z</script>
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

                <div class="panel panel-default " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div4">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <asp:Image class="all-icons" ID="Image5" runat="server" ImageUrl="~/Images/account.png" />
                        &nbsp
                        <asp:Label ID="Label20" runat="server" Text="Useer details"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>

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
                                    <asp:LinkButton ID="LinkButton17" class="btn btn-default sales1" OnClick="logout" runat="server">Log out</asp:LinkButton></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">

                <div class="panel panel-default " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div1">
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
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 " style="padding-top: 5px;">
                                                                <span class="iconify" data-icon="vaadin:drop" data-inline="false"></span>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 " style="font-size: 15px; padding-top: 5px;">

                                                                <asp:Label ID="Label44" runat="server" Text='<%#Eval("Fuel_type")%>'></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left: 2px solid #68213A;">
                                                        <div class="row">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color: #5B5959; font-weight: bold;">
                                                                &nbsp
                                                                <asp:Label ID="Label5" Style="font-size: 20px; font-weight: bolder; color: red; margin-top: 25px;" runat="server" Text='<%#Eval("PERCENTAGE")%>'></asp:Label>
                                                                <asp:Label ID="Label41" Style="font-size: 20px; font-weight: bolder; color: red; margin-top: 15px;" runat="server" Text="%"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="row" style="margin-top: 5px;">
                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color: #5B5959; font-weight: bold;">

                                                                <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>
                                                                <%--<asp:LinkButton ID="LinkButton44" CssClass="btn btn-default sales" runat="server">More</asp:LinkButton>--%>
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

                <div class="panel panel-default " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div3">
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

                                        <asp:LinkButton ID="LinkButton19" OnClick="searchrecords" CssClass="btn btn-danger sales1" runat="server"><span class="iconify" data-icon="si-glyph:money-coin" data-inline="false"></span></asp:LinkButton>
                                    </span>
                                    <span class="input-group-btn">
                                        <asp:LinkButton ID="LinkButton20" OnClick="searchrecords" CssClass="btn btn-default sales1" runat="server">Sales history</asp:LinkButton>
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
                                        <a href="tel:999" class="btn btn-default sales1">Call Emergency</a>
                                    </span>
                                    <%--<asp:LinkButton ID="LinkButton5"  runat="server" OnClick="refilling">Call Emergency</asp:LinkButton></span>--%>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">

                                <div class="input-group">
                                    <span class="input-group-btn">

                                        <asp:LinkButton ID="LinkButton3" CssClass="btn btn-default sales1" runat="server"><i class="glyphicon glyphicon-earphone"></i></asp:LinkButton>
                                    </span>
                                    <span class="input-group-btn">
                                        <a href="tel:0712035642" class="btn btn-default sales1">Call Manager</a>
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

            <div class="panel panel-default " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div2">
                <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                    <asp:Image class="all-icons" ID="Image8" runat="server" ImageUrl="~/Images/tank2.png" />
                    &nbsp
                        <asp:Label ID="Label17" runat="server" Text="Submit meter"></asp:Label>
                </div>

                <div class="panel-body wellOveride" style="border-top-left-radius: unset; border-top-right-radius: unset;">
             <%--       <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                        <ContentTemplate>--%>

                            <%--//TABLE WITH TWO TEXTBOXES--%>
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
                                        <asp:TextBox ID="TextBox2" runat="server" type="number" class="form-control rounded1" MaxLength="12" placeholder="Enter previous meter readings." Style="height: 50px; font-size: 18px; font-weight: 999;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter previous meter here" SetFocusOnError="true"
                                            ForeColor="Red" ValidationGroup="yy"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ErrorMessage="Are you sureyou have typed the meter correctly?Please confirm!." runat="server"
                                            ValidationGroup="yy" Visible="true" Display="Dynamic" ControlToValidate="TextBox2" ValidationExpression="^[0-9.]{2,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:TextBox ID="TextBox4" runat="server" type="number" class="form-control rounded1" MaxLength="3" placeholder="Enter current meter readings." Style="height: 50px; font-size: 18px; font-weight: 999;"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter current meter here" SetFocusOnError="true"
                                            ForeColor="Red" ValidationGroup="yy"></asp:RequiredFieldValidator>
                                        <br />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ErrorMessage="Are you sureyou have typed the meter correctly?Please confirm!." runat="server"
                                            ValidationGroup="yy" Visible="true" Display="Dynamic" ControlToValidate="TextBox4" ValidationExpression="^[0-9.]{2,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>

                                    <td colspan="2">
                                        <asp:LinkButton ID="LinkButton7" runat="server" ValidationGroup="yy" OnClick="next33" class="btn btn-default sales1">Next Page</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                            <%--//TABLE WITH ONE TEXTBOXES--%>
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
                                        <asp:TextBox ID="TextBox5" runat="server" type="number" class="form-control rounded1" MaxLength="3" placeholder="Enter today's meter readings." Style="height: 50px; font-size: 18px; font-weight: 999;"></asp:TextBox>
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
                                        <asp:LinkButton ValidationGroup="bn" ID="LinkButton10" OnClick="next11" class="btn btn-default sales1" runat="server">Next page</asp:LinkButton></td>
                                </tr>
                            </table>
                            <%--//TABLE WITH ONE TEXTBOX BUT FOR CONFIRMATION PURPOSE--%>
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
                                <tr>
                                    <td class="text-center" colspan="2">
                                        <strong>
                                            <asp:Label Style="font-size: 40px; font-weight: 900" ID="Label37" runat="server" Text=""></asp:Label></strong></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ValidationGroup="bn" ID="LinkButton6" OnClick="prev11" class="btn btn-default sales1" runat="server"><i class="glyphicon glyphicon-pencil"></i> &nbsp Modify</asp:LinkButton></td>
                                    <td>
                                        <asp:LinkButton ValidationGroup="bn" ID="LinkButton11" OnClick="finishSubmisiion" class="btn btn-default sales1" runat="server"><i class="glyphicon glyphicon-arrow-right"></i> &nbsp <i class="glyphicon glyphicon-saved"></i>&nbsp Finish</asp:LinkButton></td>
                                </tr>
                            </table>
                            <%--//TABLE WITH TWO TEXTBOXES  BUT FOR CONFIRMATION PURPOSE--%>

                            <table class="table" runat="server" style="font-size: 20px;" id="table6">
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
                                                <asp:LinkButton ID="LinkButton8" OnClick="backDoubleTextbox" class="btn btn-default sales1" runat="server"><i class="glyphicon glyphicon-arrow-left"></i> &nbsp Back</asp:LinkButton>
                                            </span>
                                            <span class="input-group-btn">

                                                <asp:LinkButton ID="LinkButton16" class="btn btn-default sales1" OnClick="excecuteCode" runat="server">Finish</asp:LinkButton>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <%--/CONFIMATION TABLE AFTER SUBMISSION--%>

                            <table class="table confirmed" runat="server" id="tableconfirm" style="background-color: white;">
                                <tr>

                                    <td colspan="2" class="text-center"><i class="glyphicon glyphicon-exclamation-sign"></i>
                                        <br />
                                        <strong>
                                            <asp:Label ID="Label35" runat="server" Text=""></asp:Label>.&nbsp</strong></td>
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
                                    <td>Price per litre:</td>
                                    <td class="success"><strong>
                                         <asp:Label ID="Label42" runat="server" Text="Label"></asp:Label>

                                        <asp:Label ID="Label43" runat="server" Text="Label"></asp:Label>

                                        <asp:Label ID="Label45" runat="server" Text="Label"></asp:Label>
                                        <asp:Label ID="Label34" runat="server" Text=""></asp:Label></strong></td>
                                </tr>
                            </table>

                            <asp:Label ID="Label38" runat="server" Text=""></asp:Label>
                      <%--  </ContentTemplate>
                    </asp:UpdatePanel>--%>

                    <table class="table">
                        <tr>
                            <td colspan="2">
                                       

                                <asp:LinkButton ID="LinkButton15" class="btn btn-default sales1" runat="server"><i class="glyphicon glyphicon-ok"></i>&nbsp Close</asp:LinkButton></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content" runat="server" id="topdf">

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                        <p>Recent records</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="sales" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">

                <ContentTemplate>
                    <div class="panel panel-default " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div5">
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

                        <div class="panel-body text-center" style="border-top-left-radius: unset; border-top-right-radius: unset;">
                            <div class="row text-right">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-left">
                                    <asp:Label ID="Label30" runat="server" Style="font-weight: 900; font-size: 15px;" Text="Results"></asp:Label>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <asp:LinkButton ID="LinkButton9" OnClick="pdf" class="btn btn-default " Style="margin-right: 30px; margin-bottom: 10px;" runat="server"><i class="glyphicon glyphicon-print"></i>&nbsp Download PDF</asp:LinkButton></div>
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
                            <asp:LinkButton ID="LinkButton14" class="btn btn-default" OnClick="searchrecords" runat="server">View top ten</asp:LinkButton>
                        </div>
                    </div>
                    </div></div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="LinkButton13" />

                    <asp:PostBackTrigger ControlID="LinkButton9" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="container">

        <div class="footer text-center">

            <div class="hover">
                <span style="margin: 5px;">
                    <asp:LinkButton CssClass="btn btn-default categoryselector12 more text-center" ID="LinkButton1" runat="server">

                        <asp:Label ID="Label19" runat="server" Text=" Submit meter" Style="margin-bottom: 3px;"></asp:Label>
                    </asp:LinkButton></span>

                <asp:LinkButton class="social-link" OnClick="submitpetrol" runat="server">
                    &nbsp
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/Diesel.png" Style="height: 20px; width: 20px;" />&nbsp&nbsp<strong>Petrol1</strong>
                </asp:LinkButton>

                <asp:LinkButton class="social-link" ID="LinkButton2" runat="server" OnClick="submitparafin">
                    &nbsp
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/parafin.png" Style="height: 20px; width: 20px;" />&nbsp&nbsp<strong>Petrol2</strong>
                </asp:LinkButton>
                <asp:LinkButton class="social-link" ID="LinkButton4" runat="server" OnClick="submitdiesel">
                    &nbsp
                    <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/Diesel.png" Style="height: 20px; width: 20px;" />&nbsp&nbsp<strong>Diesel</strong>
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