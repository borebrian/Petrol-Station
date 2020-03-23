<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Agent_registration.aspx.cs" Inherits="Petrol_Station.Agents.Agent_registration" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
       <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
      <meta name="viewport" content="width=device-width, initial-scale=1">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="padding:0px;">
        <div class="well"  style="background-color:transparent;border:none;">

            <div class="well wellOveride" >f
                <div class="row text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                 
                        <div class="alert alert-info" style="background-color:#68213A;color:white;border:none">
                    <asp:Label ID="Label1" runat="server" Text="Agents registration" style="opacity:1;font-weight:bolder;color:white;"></asp:Label>
                            
                        </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12    ">

                      <asp:DropDownList ID="DropDownList1" runat="server" class="form-control rounded1"  DataSourceID="SqlDataSource2" DataTextField="Station_name" DataValueField="Station_ref"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Fuel_systemConnectionString %>" SelectCommand="SELECT [Station_ref], [Station_name] FROM [Station_registration]"></asp:SqlDataSource>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Select petrol station"
                                        ForeColor="Red" ValidationGroup="ff"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator6" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox1" ValidationExpression="^[a-zA-Z0-9]{1,13}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                    </div>

                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12    ">
                    <asp:TextBox ID="TextBox1" runat="server"  class="form-control rounded1" type="number" placeholder="Enter national id" MaxLength="8"></asp:TextBox>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter ID"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator1" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox1" ValidationExpression="^[a-zA-Z0-9]{1,13}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12  ">
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control rounded1 text-capitalize" placeholder="Enter full names"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter full names"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox2" ValidationExpression="^[a-z A-Z]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>

                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12  ">
                    <asp:TextBox ID="TextBox3" runat="server" class="form-control rounded1" placeholder="Enter username"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter username"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator3" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox3" ValidationExpression="^[a-zA-Z0-9]{1,30}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                     

                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12  ">
                    <asp:TextBox ID="TextBox4" runat="server"  ReadOnly="true" Text="12345678"  class="form-control rounded1" placeholder="Set password"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" type="password" ErrorMessage="Enter password"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator4" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox4" ValidationExpression="^[0-9A-Za-z,./]{1,8}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12  ">
                    <asp:TextBox ID="TextBox5" runat="server" class="form-control rounded1" placeholder="Enter town name"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter town name"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator5" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox5" ValidationExpression="^[0-9A-Za-z]{1,20}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                    
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12  ">
                    <asp:TextBox ID="TextBox7" runat="server" class="form-control rounded1" type="number"  MaxLength="10" placeholder="Enter phone number here" Text="07"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Enter password"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator7" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox7" ValidationExpression="^[0-9]{10,10}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>

                </div>
                <div class="row text-center">
                                      

                     <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12  " style="margin-bottom:3px;">

                    <asp:LinkButton ID="LinkButton3" CssClass="btn btn-default mycolor" runat="server" OnClick="LinkButton1_Click"><i class="glyphicon glyphicon-plus-sign"></i> &nbsp Add agents </asp:LinkButton>
                                          </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12  " style="margin-bottom:3px;">
                    <asp:LinkButton ID="LinkButton2"  ValidationGroup="nl" CssClass="btn btn-default mycolor" runat="server" OnClick="LinkButton2_Click"> Submit data</asp:LinkButton>

                                          </div>
                                      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12  text-center" style="margin-bottom:3px;">

                    <asp:LinkButton ID="LinkButton1" CssClass="btn btn-default mycolor" runat="server" OnClick="complete" ><i class="glyphicon glyphicon-ok"></i>&nbsp Complete registration </asp:LinkButton><br />
                                          </div>
                </div>
                <div class="row text-center">
                                          <asp:Label ID="Label2" runat="server" Text="" ForeColor="red"></asp:Label>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
