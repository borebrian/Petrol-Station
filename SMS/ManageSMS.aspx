<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ManageSMS.aspx.cs" Inherits="Petrol_Station.SMS.ManageSMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.7-dist/js/Modals.js"></script>
      <meta name="viewport" content="width=device-width, initial-scale=1">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-lg-4 col-lg-4 col-lg-12 "></div>
            <div class="col-lg-4 col-lg-4 col-lg-4 col-lg-12 ">

        <div class="panel panel-primary" style="border:none;border-top-left-radius:30px;border-top-right-radius:30px;border-bottom-right-radius:40px;border-bottom-left-radius:40px;" runat="server" id="div1">
            <div class="panel-heading text-center" style="background-color:#483F42;border-top-left-radius:30px;border-top-right-radius:30px;color:white;font-weight:bold;height:70px;">
                <p>Manage sms server</p>

            </div>
            <div class="panel-body">
                <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 colpad colpad">
                    Twilio Auth token:
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control rounded1" placeholder="Entertwilio auth token here"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter ID"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Invalid characters" runat="server" Display="Dynamic"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox1" ValidationExpression="^[0-9a-zA-Z]{1,1400}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                           <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 colpad colpad">

                    Twilio SID:
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control rounded1" placeholder="Entertwilio auth SID here"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter SID"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ErrorMessage="Invalid characters" runat="server" Display="Dynamic"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox2" ValidationExpression="^[0-9a-zA-Z]{1,1400}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 colpad colpad">

                    Twilio Number:
                    <asp:TextBox ID="TextBox3" runat="server" class="form-control rounded1" placeholder="Entertwilio auth SID here"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter twilio phone number here"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Display="Dynamic" Visible="true" ControlToValidate="TextBox3" ValidationExpression="^[0-9+]{1,15}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 colpad colpad text-center">

                                 <asp:LinkButton ValidationGroup="nl" ID="LinkButton1" CssClass="btn btn-primary mycolor" runat="server" OnClick="LinkButton1_Click">Edit/Add</asp:LinkButton>
                                 <asp:Label ID="Label1"  runat="server" Text=""></asp:Label>

                                 </div>


                    </div>
            </div>

        </div></div>
            <div class="col-lg-4 col-lg-4 col-lg-4 col-lg-12 "></div>


        </div>
        <div id="modal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

  <div class="alert alert-info">
  <strong>Enter admin password to continue!</strong>
      <div class="row">
            <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 ">

                 <asp:TextBox ID="TextBox4" MaxLength="10" type="password" runat="server" class="form-control rounded1" placeholder="Enter password here"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter password here"
                                        ForeColor="Red" ValidationGroup="vv"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="vv" Display="Dynamic" Visible="true" ControlToValidate="TextBox4" ValidationExpression="^[0-9a-zA-Z]{1,15}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                <asp:LinkButton ValidationGroup="vv" ID="LinkButton2" CssClass="btn btn-primary mycolor" runat="server" OnClick="validate">Proceed</asp:LinkButton>
                                 <asp:Label ID="Label2"  runat="server" Text=""></asp:Label>
            </div>



      </div>
      

</div>

      </div>
    </div>

    </div>




</asp:Content>
