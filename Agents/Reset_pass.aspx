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

            <
              <div class="row text-center" style="margin-bottom:20px;">
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  hidden-xs"></div>
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">
                    <div class="well" style="background-color:#68213A;opacity:0.8;border-radius:40px;">
                <div class="row text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                 
                    
                        <div class="alert alert-info" style="background-color:#68213A;color:white;">
                            <strong>Please enter admin email to proceed.<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            </strong>
                        </div>
                </div>
                     <div class="row">
                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                             <asp:Label ID="Label1" runat="server" Text="Username:" style="color:white;"></asp:Label>
                               <asp:TextBox ID="TextBox5" runat="server" class="form-control rounded1" placeholder="Enter admin email to continue"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="TextBox5" SetFocusOnError="true" ErrorMessage="Enter email here"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox5" ValidationExpression="^[@.0-9A-Za-z]{1,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>

                         </div>
                       
                         </div>

                         <div class="row text-center">
                    <div class="btn-group">
                                                                <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary sales" ValidationGroup="nl" style="border:white 1px solid;background-color:#68213A;color:white" runat="server" OnClick="LinkButton1_Click">Back to log in</asp:LinkButton>
                                                                <asp:LinkButton ID="LinkButton4" CssClass="btn btn-primary sales" style="border:white 1px solid;background-color:#68213A;color:white" runat="server" OnClick="LinkButton4_Click">Proceed</asp:LinkButton>
                        </div><br />

                   
                      
                    
                </div>
                    </div>
                 </div>
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  hidden-xs">


                 </div>

              </div>
               
            </div>
        </div>

</asp:Content>
