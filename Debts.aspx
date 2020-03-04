<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Debts.aspx.cs" Inherits="Petrol_Station.Debts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
           <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
      <meta name="viewport" content="width=device-width, initial-scale=1">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-fixed-top" style="color:white;background-color:#68213A">
            <a class="navbar-brand" href="#" style="font-weight:bolder;color:white;padding:0px;margin:0px;">
             <%--<div class="container">--%>
               
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="width:40px;height:40px;margin:2px;" />
           <%--</div>--%>

            </a>
           

      <div class="container">
        <div class="navbar-header" style="color:white;" >

       
            <asp:LinkButton ID="LinkButton1" class="navbar-toggle" style="color:white" runat="server" aria-expanded="false"><i class="glyphicon glyphicon-print"></i></asp:LinkButton>

          <a class="navbar-brand" href="#" style="color:white;font-size:13px;">
              <%--<asp:Label ID="Label2" runat="server" Text="|"></asp:Label>--%>
              <asp:Label ID="Label3" runat="server" Text="Debts history"></asp:Label>|
              Total debt:<asp:Label ID="Label1" runat="server" Text="23000"></asp:Label>
                           



          </a>

        </div>
      
      </div>
    </nav>
    <div class="container-fluid" style="margin-top:60px;">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <div  class="alert alert-info myalert text-center navbar navbar-fixed-top" style="color:#68213A;opacity:01;margin-top:50px;border-top-left-radius:0px;border-top-right-radius:0px;">
                      <div class="row">
                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 hidden-xs"></div>
                          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-center" >
                             <strong>Use phone number,id number or name to search for debt records.</strong>
                               <div class = "input-group">
                                                        <asp:TextBox ID="TextBox7" runat="server" class="form-control rounded1" placeholder="Enter phone number or id or name here"  style="border:#68213A 1px solid;"></asp:TextBox>

                               
                                 <span class = "input-group-btn">

                                                     <asp:LinkButton ID="LinkButton16" CssClass="btn btn-primary mycolor"  runat="server" ValidationGroup="nl"><i class="glyphicon glyphicon-search"></i> &nbsp Search</asp:LinkButton>

                                 </span>

                              </div>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7" ErrorMessage="Enter value to search"
                                        ForeColor="Red" ValidationGroup="nl"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="nl" Visible="true" ControlToValidate="TextBox7" ValidationExpression="^[0-9A-Za-z ]{1,30}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                      </div>
                                  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 hidden-xs text-right">
            <asp:LinkButton ID="LinkButton2" style="color:#68213A" runat="server" aria-expanded="false"><i class="glyphicon glyphicon-print"></i></asp:LinkButton>
                                    
                                  </div>

                            </div>
                     
                        </div>
            </div>
        </div>
         <div class="row" style="margin-top:150px;">

                             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <div class="alert alert-info myalert text-center" style="color:#68213A;opacity:01; ">
                      <div class="row">
                                                      <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5" style="color:#5B5959;font-weight:bold;font-size:20px;margin-top:30px;">
                                                          <asp:Label ID="Label2" runat="server" Text="Haron"></asp:Label>

                                                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left:2px solid #68213A; ">
                              <div class="row">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-calendar">&nbsp</i> <asp:Label ID="Label4" runat="server" Text="10/08/2019"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                      <i class="glyphicon glyphicon-usd"></i>&nbsp<asp:Label ID="Label5" runat="server" Text="600"></asp:Label><asp:Label ID="Label6" runat="server" Text="/="></asp:Label>
                                  </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-earphone"></i>&nbsp<asp:Label ID="Label8" runat="server" Text="071234567"></asp:Label>
                                  </div>
                              </div>
                               <div class="row" style="margin-top:5px;">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">

                          <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>
                                                                <asp:LinkButton ID="LinkButton4" CssClass="btn btn-primary sales" runat="server">More</asp:LinkButton>

                      </div></div>

                    </div>


                          </div>

                     
                  </div></div>
             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <div class="alert alert-info myalert text-center" style="color:#68213A;opacity:01; ">
                      <div class="row">
                                                      <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5" style="color:#5B5959;font-weight:bold;font-size:20px;margin-top:30px;">
                                                          <asp:Label ID="Label7" runat="server" Text="Haron"></asp:Label>

                                                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left:2px solid #68213A; ">
                              <div class="row">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-calendar">&nbsp</i> <asp:Label ID="Label9" runat="server" Text="10/08/2019"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                      <i class="glyphicon glyphicon-usd"></i>&nbsp<asp:Label ID="Label10" runat="server" Text="600"></asp:Label><asp:Label ID="Label11" runat="server" Text="/="></asp:Label>
                                  </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-earphone"></i>&nbsp<asp:Label ID="Label12" runat="server" Text="071234567"></asp:Label>
                                  </div>
                              </div>
                               <div class="row" style="margin-top:5px;">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">

                          <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>
                                                                <asp:LinkButton ID="LinkButton3" CssClass="btn btn-primary sales" runat="server">More</asp:LinkButton>

                      </div></div>

                    </div>


                          </div>

                     
                  </div></div>
             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <div class="alert alert-info myalert text-center" style="color:#68213A;opacity:01; ">
                      <div class="row">
                                                      <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5" style="color:#5B5959;font-weight:bold;font-size:20px;margin-top:30px;">
                                                          <asp:Label ID="Label13" runat="server" Text="Haron"></asp:Label>

                                                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left:2px solid #68213A; ">
                              <div class="row">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-calendar">&nbsp</i> <asp:Label ID="Label14" runat="server" Text="10/08/2019"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                      <i class="glyphicon glyphicon-usd"></i>&nbsp<asp:Label ID="Label15" runat="server" Text="600"></asp:Label><asp:Label ID="Label16" runat="server" Text="/="></asp:Label>
                                  </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-earphone"></i>&nbsp<asp:Label ID="Label17" runat="server" Text="071234567"></asp:Label>
                                  </div>
                              </div>
                               <div class="row" style="margin-top:5px;">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">

                          <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>
                                                                <asp:LinkButton ID="LinkButton5" CssClass="btn btn-primary sales" runat="server">More</asp:LinkButton>

                      </div></div>

                    </div>


                          </div>

                     
                  </div></div>
             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <div class="alert alert-info myalert text-center" style="color:#68213A;opacity:01; ">
                      <div class="row">
                                                      <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5" style="color:#5B5959;font-weight:bold;font-size:20px;margin-top:30px;">
                                                          <asp:Label ID="Label18" runat="server" Text="Haron"></asp:Label>

                                                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left:2px solid #68213A; ">
                              <div class="row">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-calendar">&nbsp</i> <asp:Label ID="Label19" runat="server" Text="10/08/2019"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                      <i class="glyphicon glyphicon-usd"></i>&nbsp<asp:Label ID="Label20" runat="server" Text="600"></asp:Label><asp:Label ID="Label21" runat="server" Text="/="></asp:Label>
                                  </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-earphone"></i>&nbsp<asp:Label ID="Label22" runat="server" Text="071234567"></asp:Label>
                                  </div>
                              </div>
                               <div class="row" style="margin-top:5px;">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">

                          <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>
                                                                <asp:LinkButton ID="LinkButton6" CssClass="btn btn-primary sales" runat="server">More</asp:LinkButton>

                      </div></div>

                    </div>


                          </div>

                     
                  </div></div>
             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <div class="alert alert-info myalert text-center" style="color:#68213A;opacity:01; ">
                      <div class="row">
                                                      <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5" style="color:#5B5959;font-weight:bold;font-size:20px;margin-top:30px;">
                                                          <asp:Label ID="Label23" runat="server" Text="Haron"></asp:Label>

                                                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left:2px solid #68213A; ">
                              <div class="row">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-calendar">&nbsp</i> <asp:Label ID="Label24" runat="server" Text="10/08/2019"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                      <i class="glyphicon glyphicon-usd"></i>&nbsp<asp:Label ID="Label25" runat="server" Text="600"></asp:Label><asp:Label ID="Label26" runat="server" Text="/="></asp:Label>
                                  </div>
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-earphone"></i>&nbsp<asp:Label ID="Label27" runat="server" Text="071234567"></asp:Label>
                                  </div>
                              </div>
                               <div class="row" style="margin-top:5px;">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">

                          <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>
                                                                <asp:LinkButton ID="LinkButton7" CssClass="btn btn-primary sales" runat="server">More</asp:LinkButton>

                      </div></div>

                    </div>


                          </div>

                     
                  </div></div>
             
        
                      </div>

    </div>
</asp:Content>
