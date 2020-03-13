<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Log_in.aspx.cs" Inherits="Petrol_Station.Agents.Log_in" %>
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
        <div class="well "  style="background-color:transparent;border:none;">

            
              <div class="row text-center" style="margin-bottom:20px;">
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12  hidden-xs"></div>
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">
                    <div class="well wellOveride" style="">
                <div class="row text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3 style="color:white;">Login</h3>
                 
                    
<%--                        <div class="alert alert-info" style="background-color:#68213A;color:white;border:none">
                            <strong>Please log in to proceed.<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            </strong>
                        </div>--%>
                </div>
                     <div class="row">
                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center">
                             <%--<asp:Label ID="Label1" runat="server" Text="Username:" style="color:white;"></asp:Label>--%>
                             <div class="input-group">
                                  <span class = "input-group-btn">
                                  <asp:LinkButton ID="LinkButton2" runat="server" class="btn btn-default rounded11"><i class="glyphicon glyphicon-user"></i></asp:LinkButton>

                                                  
                                 </span>
                               <asp:TextBox ID="TextBox5" runat="server" MaxLength="8" class="form-control  rounded1" placeholder="Enter National "></asp:TextBox>
                                 </div>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="TextBox1" ErrorMessage="Enter national ID"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox5" ValidationExpression="^[0-9]{1,30}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>

                         </div>
                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12   text-center">
                             <%--<asp:Label ID="Label3" runat="server" Text="Password:" style="color:white;"></asp:Label>--%>
                            <div class="input-group">
                                  <span class = "input-group-btn">
                                  <asp:LinkButton ID="LinkButton3" runat="server" class="btn btn-default"><i class="glyphicon glyphicon-lock"></i></asp:LinkButton>

                                                  
                                 </span>
                               <asp:TextBox ID="TextBox1" runat="server" MaxLength="8" class="form-control rounded1" Display="Dynamic" type="password" placeholder="Enter Password"></asp:TextBox></div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter password"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox1" ValidationExpression="^[0-9A-Za-z,./]{1,8}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                     

                         </div>
                     </div>
                         <div class="row text-center">
              
                                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-default white " ValidationGroup="nl" runat="server" OnClick="LinkButton1_Click">Log in</asp:LinkButton>
                                                                <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-default white " OnClick="LinkButton4_Click">Forgot password</asp:LinkButton><br />
                        <asp:Label ID="Label4" runat="server" Text="" ForeColor="red"></asp:Label>
                        </div><br />

                   
                      
                    
         
                    </div>
                 </div>
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  hidden-xs">


                 </div>

              </div>
               
            </div>
        </div>
    </div>
</asp:Content>
