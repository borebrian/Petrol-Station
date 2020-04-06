<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Station_reg.aspx.cs" Inherits="Petrol_Station.Agents.Station_reg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/Modals.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
      <meta name="viewport" content="width=device-width, initial-scale=1">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="padding:0px;">
        <div class="well"  style="background-color:transparent;border:none;">

            <div class="well wellOveride" >
                <div class="row text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                       <div class="alert alert-info" style="background-color:#68213A;color:white;border:none">
                    <asp:Label ID="Label1" runat="server" Text="Station registration" style="opacity:1;font-weight:bolder;color:white;"></asp:Label>
                           </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12    ">
                    <asp:TextBox ID="TextBox1" type="number" ReadOnly="true" runat="server" class="form-control rounded1" placeholder="Station Reff"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter Reff number"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox1" ValidationExpression="^[0-9]{1,13}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red"> </asp:RegularExpressionValidator>
                        </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12  ">
                    <asp:TextBox ID="TextBox2" type="number" runat="server" class="form-control rounded1 text-capitalize" placeholder="National ID"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter ID"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox2" ValidationExpression="^[0-9 ]{1,8}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red"> </asp:RegularExpressionValidator>
                        </div>

                      <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12  ">
                    <asp:TextBox ID="TextBox3" type="text"  runat="server" class="form-control rounded1" placeholder="Station name"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter station name"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox3" ValidationExpression="^[A-Za-z ]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red"> </asp:RegularExpressionValidator>
                        </div>
                   <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12  ">
                    <asp:TextBox ID="TextBox5" type="text" runat="server" class="form-control rounded1" placeholder="Enter town name"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter town name"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox5" ValidationExpression="^[A-Za-z]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red"> </asp:RegularExpressionValidator>
                        </div>


                </div>
                          <div class="row text-center">
                    <%--<div class="btn btn-group">--%>
                                        <asp:Label ID="Label3" runat="server" ForeColor="Green" Text=""></asp:Label>
               </div>
                <div class="row text-center">
                    <%--<div class="btn btn-group">--%>
                                 
                     <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12  " style="margin-bottom:5px;">
                       
                    <asp:LinkButton ID="LinkButton2"   CssClass="btn btn-default mycolor" runat="server" OnClick="clear"><i class="glyphicon glyphicon-plus"></i>&nbsp Add more petrol station</asp:LinkButton></div>
                     <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12  ">

                     <asp:LinkButton ID="LinkButton3"   ValidationGroup="nl"  CssClass="btn btn-default mycolor" style="margin-bottom:5px;" runat="server" OnClick="LinkButton1_Click"><i class="glyphicon glyphicon-open"></i> &nbsp Submit</asp:LinkButton></div>
                     <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12  ">

                     <asp:LinkButton ID="LinkButton1" CssClass="btn btn-default mycolor" runat="server" OnClick="LinkButton1_Click1"><i class="glyphicon glyphicon-circle-arrow-right"></i> &nbsp Next</asp:LinkButton></div>
                </div>
            </div>
        </div>
   <div id="modalfuel" class="modal fade" role="dialog">
  <div class="modal-dialog">

  <div class="well wellOveride" style="">
        <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 text-right" >
            <asp:LinkButton ID="LinkButton4" CssClass="btn btn-default" runat="server"><i class="glyphicon glyphicon-remove-sign"></i></asp:LinkButton></div>
            <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 " style="color:white;">
      <div class="row text-center" style="margin-bottom:20px;">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />

                    <div class="alert alert-info" style="background-color:#68213A;color:white;border:none">

  <strong>Provide fuel details of the  station</strong>
                        </div>

      </div></div>
      <div class="row">
            <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 ">
                <div class="row">
            <div class="col-lg-3 col-lg-3 col-lg-3 col-lg-12 " style="color:#68213A">
                Fuel station:

                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control rounded1"  DataSourceID="SqlDataSource2" DataTextField="Station_name" DataValueField="Station_ref"></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Fuel_systemConnectionString %>" SelectCommand="SELECT Station_ref, Station_name FROM Station_registration"></asp:SqlDataSource>
               
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fuel_systemConnectionString %>" SelectCommand="SELECT count(Station_name) as total,Station_name FROM Station_registration group by Station_name"></asp:SqlDataSource>
                </div>
            <div class="col-lg-3 col-lg-3 col-lg-3 col-lg-12 " style="color:#68213A">
                 Fuel type:
           <asp:DropDownList ID="DropDownList2" runat="server" class="form-control rounded1" DataSourceID="SqlDataSource3" DataTextField="Description" DataValueField="Fuel_ref" >
               <asp:ListItem>PETROL1</asp:ListItem>
               <asp:ListItem>PETROL2</asp:ListItem>
               <asp:ListItem>PETROL</asp:ListItem>
               <asp:ListItem>DIESEL</asp:ListItem>


                </asp:DropDownList>
               
                 <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Fuel_systemConnectionString %>" SelectCommand="SELECT [Fuel_ref], [Fuel_type], [Description] FROM [Fuel_category]"></asp:SqlDataSource>
               
            </div>
            <div class="col-lg-3 col-lg-3 col-lg-3 col-lg-12 " style="color:#68213A">

                Tank capacity:
                    <asp:TextBox ID="TextBox4" runat="server" class="form-control rounded1" placeholder="Enter tank capacity"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter tank capacity"
                                        ForeColor="Red" ValidationGroup="ff"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator4" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="ff" Visible="true"   ControlToValidate="TextBox4" ValidationExpression="^[0-9.]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                </div>
                    <div class="col-lg-3 col-lg-3 col-lg-3 col-lg-12 " style="color:#68213A">
           Current fuel capacity:

                    <asp:TextBox ID="TextBox6" runat="server" class="form-control rounded1" placeholder="Enter current capacity"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6" ErrorMessage="Enter current tank capacity"
                                        ForeColor="Red" ValidationGroup="ff"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator6" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="ff" Visible="true"   ControlToValidate="TextBox6" ValidationExpression="^[0-9 ]{1,20}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                </div>
                   
                
            </div>
                <div class="row">
                  <div class="col-lg-3 col-lg-3 col-lg-3 col-lg-12 " style="color:#68213A">
           Price/Litre:

                    <asp:TextBox ID="TextBox7" runat="server" class="form-control rounded1" placeholder="e.g 110"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox7" ErrorMessage="Enter price per litre"
                                        ForeColor="Red" ValidationGroup="ff"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator9" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="ff" Visible="true"   ControlToValidate="TextBox7" ValidationExpression="^[0-9 .]{1,20}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center" >
                    <asp:Label runat="server" ID="response" Text="" ForeColor="green"></asp:Label>

                        <div class="btn-group  btn-group-justified btn-md">
                          
                            <a href="#" class="btn btn-default " runat="server" ValidationGroup="ff"  onserverclick="insertdetails">
                               <i class="glyphicon glyphicon-plus-sign"></i>&nbsp  Submit
                                
                            </a>
                             <a href="#" class="btn btn-default " runat="server" onserverclick="finish">
                               <i class="glyphicon glyphicon-ok-sign"></i>&nbsp  Finish
                                
                            </a>

                </div>


                </div>
                </div>
                 <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center" >
                         <strong>
                    <asp:Label runat="server" ID="Label2" Text="" ForeColor="green"></asp:Label></strong> 

</div>
                </div>


             
               


      </div>
      </div>

</div>
    </div>
      
    
   
    </div>
    </div>
</asp:Content>
