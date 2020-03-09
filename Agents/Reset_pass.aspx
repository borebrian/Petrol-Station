<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reset_pass.aspx.cs" Inherits="Petrol_Station.Agents.Reset_pass" %>
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

            
              <div class="row text-center" style="margin-bottom:20px;">
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  hidden-xs"></div>
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">
                    <div class="well" style="background-color:#68213A;opacity:0.8;border-radius:40px;">
                <div class="row text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                 
                    
                        <div class="alert alert-info" style="background-color:#68213A;border:none;color:white;">
                            <strong><asp:Label ID="Label2" runat="server" Text="Please enter National ID used during registration!"></asp:Label>
                            </strong>
                        </div>
                </div>
                     <div class="row">
                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                               <asp:TextBox ID="TextBox5" runat="server" class="form-control rounded1" placeholder="Enter National ID"></asp:TextBox>
                               <asp:TextBox ID="TextBox1" runat="server" class="form-control rounded1" placeholder="Enter verification code"></asp:TextBox>

                        
                                    <br />
                             <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox5"  ErrorMessage="Enter National ID"
                                        ForeColor="Red" ValidationGroup="n"></asp:RequiredFieldValidator>
                                 <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter verification code"
                                        ForeColor="Red" ValidationGroup="k"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="n" Visible="true" ControlToValidate="TextBox5" ValidationExpression="^[0-9]{1,8}$" SetFocusOnError="true"   CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                         
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="k" Visible="true" ControlToValidate="TextBox1" ValidationExpression="^[0-9]{4,4}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>

                         </div>
                       
                         </div>

                         <div class="row text-center">
                    <div class="btn-group">
                                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-default " ValidationGroup="nl" runat="server" OnClick="LinkButton1_Click">Back to log in</asp:LinkButton>
                                                                <asp:LinkButton ID="LinkButton4"  ValidationGroup="n" CssClass="btn btn-default "  runat="server" OnClick="LinkButton4_Click">Proceed</asp:LinkButton>
                         <asp:LinkButton ID="LinkButton3"  ValidationGroup="k" CssClass="btn btn-default " runat="server" OnClick="LinkButton3_Click" >Verify</asp:LinkButton>
                     
                        <asp:Label ID="Label3"  runat="server" Text=""></asp:Label>
                        </div>
                                <asp:LinkButton ID="LinkButton2" CssClass="btn btn-primary default" runat="server" OnClick="LinkButton2_Click">Resend code</asp:LinkButton><br />

                   
                      
                    
                </div>
                    </div>
                 </div>
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  hidden-xs">


                 </div>

              </div>
               
            </div>
        </div>

</asp:Content>
