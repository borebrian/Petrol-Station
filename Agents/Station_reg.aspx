<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Station_reg.aspx.cs" Inherits="Petrol_Station.Agents.Station_reg" %>
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

            <div class="well" style="background-color:black;opacity:0.8;border-radius:40px;border:none;">
                <div class="row text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                       <div class="alert alert-info" style="background-color:#68213A;color:white;border:none">
                    <asp:Label ID="Label1" runat="server" Text="Station registration" style="opacity:1;font-weight:bolder;color:white;"></asp:Label>
                           </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 colpad colpad">
                    <asp:TextBox ID="TextBox1" ReadOnly="true" runat="server" class="form-control rounded1" placeholder="Station Reff"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Reff number"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox1" ValidationExpression="^[0-9]{1,13}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red"> </asp:RegularExpressionValidator>
                        </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 colpad">
                    <asp:TextBox ID="TextBox2" runat="server" class="form-control rounded1 text-capitalize" placeholder="National ID"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter ID"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox2" ValidationExpression="^[0-9 ]{1,8}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red"> </asp:RegularExpressionValidator>
                        </div>

                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 colpad">
                    <asp:TextBox ID="TextBox3" type="number"  runat="server" class="form-control rounded1" placeholder="Station name"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter station name"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox3" ValidationExpression="^[A-Za-z]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red"> </asp:RegularExpressionValidator>
                        </div>
                   <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 colpad">
                    <asp:TextBox ID="TextBox5" type="number" runat="server" class="form-control rounded1" placeholder="Enter town name"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter town name"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox5" ValidationExpression="^[A-Za-z]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red"> </asp:RegularExpressionValidator>
                        </div>


                </div>
               
                <div class="row text-center">
                    <%--<div class="btn btn-group">--%>
                    
                   
                     <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 colpad">
                       
                    <asp:LinkButton ID="LinkButton2"   ValidationGroup="nl" CssClass="btn btn-primary mycolor" runat="server" OnClick="clear"><i class="glyphicon glyphicon-plus"></i>&nbsp Add more petrol station</asp:LinkButton></div>
                     <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 colpad">

                     <asp:LinkButton ID="LinkButton3"   ValidationGroup="nl" CssClass="btn btn-primary mycolor" runat="server" OnClick="LinkButton1_Click"><i class="glyphicon glyphicon-open"></i> &nbsp Submit</asp:LinkButton></div>
                     <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 colpad">

                     <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary mycolor" runat="server" OnClick="LinkButton1_Click1"><i class="glyphicon glyphicon-circle-arrow-right"></i> &nbsp Next</asp:LinkButton></div>
                </div>
            </div>
        </div>
   <div id="modalfuel" class="modal fade" role="dialog">
  <div class="modal-dialog">

  <div class="well" style="background-color:black;opacity:0.8;border-radius:20px;padding:10px;border:none">
      
            <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 " style="color:white;">
      <div class="row text-center" style="margin-bottom:20px;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />

                    <div class="alert alert-info" style="background-color:#68213A;color:white;border:none">

  <strong>Provide fuel details of the petrol stations</strong>
                        </div>

      </div></div>
      <div class="row">
            <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 ">
                <div class="row">
            <div class="col-lg-3 col-lg-3 col-lg-3 col-lg-12 " style="color:white">
                Select petrol station:

                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control rounded1"  DataSourceID="SqlDataSource1" DataTextField="Station_name" DataValueField="Station_name"></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Select petrol station"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator8" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true"   ControlToValidate="DropDownList1" ValidationExpression="^[a-z,A-Z]{1,20}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fuel_systemConnectionString %>" SelectCommand="SELECT count(Station_name) as total,Station_name FROM Station_registration group by Station_name"></asp:SqlDataSource>
                </div>
            <div class="col-lg-3 col-lg-3 col-lg-3 col-lg-12 " style="color:white">
                Select fuel type:
           <asp:DropDownList ID="DropDownList2" runat="server" class="form-control rounded1" >
               <asp:ListItem>PETROL</asp:ListItem>
               <asp:ListItem>DIESEL</asp:ListItem>
               <asp:ListItem>PARAFFIN</asp:ListItem>
                </asp:DropDownList>
               
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Select fuel"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator7" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true"   ControlToValidate="DropDownList2" ValidationExpression="^[a-z,A-Z]{1,20}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
            </div>
            <div class="col-lg-3 col-lg-3 col-lg-3 col-lg-12 " style="color:white">

                Enter tank capacity in Litres:
                    <asp:TextBox ID="TextBox4" runat="server" class="form-control rounded1" placeholder="Enter tank capacity"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter tank capacity"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator4" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true"   ControlToValidate="TextBox4" ValidationExpression="^[0-9.]{1,20}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                </div>
                    <div class="col-lg-3 col-lg-3 col-lg-3 col-lg-12 " style="color:white">
                Enter current fuel capacity in Litres:

                    <asp:TextBox ID="TextBox6" runat="server" class="form-control rounded1" placeholder="Enter current capacity"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter current tank capacity"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator6" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true"   ControlToValidate="TextBox6" ValidationExpression="^[0-9.]{1,20}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                </div>
                       <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter password here"
                                        ForeColor="Red" ValidationGroup="vv"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="vv" Display="Dynamic" Visible="true" ControlToValidate="TextBox4" ValidationExpression="^[0-9a-zA-Z]{1,15}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red"> </asp:RegularExpressionValidator>--%>
                
            </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="btn-group  btn-group-justified">
                          
                            <a href="#" class="btn btn-primary mycolor" runat="server" onclick="">
                               <i class="glyphicon glyphicon-plus-sign"></i>&nbsp  Add
                                
                            </a>
                             <a href="#" class="btn btn-default " runat="server" onclick="">
                               <i class="glyphicon glyphicon-ok-sign"></i>&nbsp  Finish
                                
                            </a>

                </div>
                </div></div>


      </div>
      </div>

</div>
    </div>
      
    
   
    </div>
    </div>
</asp:Content>
