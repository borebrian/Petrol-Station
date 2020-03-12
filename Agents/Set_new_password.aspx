<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Set_new_password.aspx.cs" Inherits="Petrol_Station.Agents.Set_new_password" %>
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
        <div class="well"  style="background-color:transparent;border:none;">

            <
              <div class="row text-center" style="margin-bottom:20px;">
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  hidden-xs"></div>
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">
                    <div class="well wellOveride">
                <div class="row text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                 
                    
                        <div class="alert alert-info" style="background-color:#68213A;color:white;border:none;">
                            <strong><asp:Label ID="Label2" runat="server" Text="Please set new unique password with atleast six characters."></asp:Label>
                            </strong>
                        </div>
                </div>
                     <div class="row">
                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                             <asp:Label ID="Label1" runat="server" Text="Set new password:" style="color:white;"></asp:Label>
                               <asp:TextBox ID="TextBox5" runat="server" class="form-control rounded1" type="password" placeholder="Enter new password"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" ControlToValidate="TextBox5" ErrorMessage="Enter password"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox5" ValidationExpression="^[0-9A-Za-z]{6,15}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>

                         </div>
                         <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                             <asp:Label ID="Label3" runat="server" Text="Repeat password:" style="color:white;"></asp:Label>
 
                               <asp:TextBox ID="TextBox1" runat="server" class="form-control rounded1" Display="Dynamic" type="password" placeholder="Repeat Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="Repeat password"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" Display="Dynamic" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox1" ValidationExpression="^[0-9A-Za-z]{6,15}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                     

                         </div>
                     </div>
                         <div class="row text-center">
                    <div class="btn-group">
                                                                <%--<asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary sales" ValidationGroup="nl" style="border:white 1px solid;background-color:#68213A;color:white" runat="server">Log in</asp:LinkButton>--%>
                                                                <asp:LinkButton ID="LinkButton4" CssClass="btn btn-primary sales" style="border:white 1px solid;background-color:#68213A;color:white"    ValidationGroup="nl" runat="server" OnClick="LinkButton4_Click">Submit</asp:LinkButton>
                        </div><br />

                   
                      
                    
                </div>
                    </div>
                 </div>
                 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4  hidden-xs">


                 </div>

              </div>
               
            </div>
        </div>
    </div>
</asp:Content>