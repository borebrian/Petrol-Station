<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Manager_reg.aspx.cs" Inherits="Petrol_Station.Agents.Manager_reg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
      <meta name="viewport" content="width=device-width, initial-scale=1">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="padding:0px;">
        <div class="well" draggable="true" style="background-color:transparent;border:none;">

            <div class="well" style="background-color:black;opacity:0.8;border-radius:40px;">
                <div class="row text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                    <div class="alert alert-info" style="background-color:#68213A;color:white;border:none">
                    <asp:Label ID="Label1"  runat="server" Text="Manager registration" style="opacity:1;font-weight:bolder;color:white;"></asp:Label>
                        </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 colpad colpad">
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control rounded1" placeholder="Enter national id"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  Display="Dynamic" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter ID"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" Display="Dynamic" ControlToValidate="TextBox1" ValidationExpression="^[0-9]{1,8}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 colpad">
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control rounded1 text-capitalize" placeholder="Enter full names"></asp:TextBox>
                         <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter full names"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox2" ValidationExpression="^[a-z A-Z]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>

                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 colpad">
                    <asp:TextBox ID="TextBox3" runat="server" class="form-control rounded1" placeholder="Enter username"></asp:TextBox>
                         <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter Username"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox3" ValidationExpression="^[0-9A-Za-z]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                     <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 colpad">
                    <asp:TextBox ID="TextBox4" runat="server" ReadOnly="true" Text="12345678" class="form-control rounded1" placeholder="Set password"  ></asp:TextBox>
                         <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter password"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator4" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox4" ValidationExpression="^[0-9A-Za-z,./]{1,15}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>

                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 colpad">
                    <asp:TextBox ID="TextBox5" runat="server" class="form-control rounded1" placeholder="Enter town name"></asp:TextBox>
                         <asp:RequiredFieldValidator  Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter town name"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator5" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox5" ValidationExpression="^[A-Za-z,./]{1,30}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                    
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 colpad">
                    <asp:TextBox ID="TextBox7" runat="server" class="form-control rounded1" MaxLength="10" placeholder="Enter phone number here" Text="07"></asp:TextBox>
                         <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator7"  runat="server" ControlToValidate="TextBox7" ErrorMessage="Enter phone number"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator7" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox7" ValidationExpression="^[0-9A]{10,10}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                    
                </div>
         
                     <div class="row text-center">
                                      

                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 colpad">
                    <asp:LinkButton ValidationGroup="nl" ID="LinkButton1" CssClass="btn btn-primary mycolor" runat="server" OnClick="LinkButton1_Click">Next</asp:LinkButton>
                </div></div>
            </div>
   
    </div></div>
</asp:Content>
