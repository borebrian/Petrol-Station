<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Manage_agents.aspx.cs" Inherits="Petrol_Station.Agents.Manage_agents" %>
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

       <%-- <a class="navbar-brand" href="#" style="">
             
           <asp:LinkButton ID="LinkButton7" CssClass="btn btn-primary " runat="server">More</asp:LinkButton></a>
           
           --%>

      <div class="container">
        <div class="navbar-header" style="color:white;" >

       
            <asp:LinkButton ID="LinkButton1" class="navbar-toggle" style="color:white" runat="server" aria-expanded="false"><i class="glyphicon glyphicon-print"></i></asp:LinkButton>

          <a class="navbar-brand" href="#" style="color:white;font-size:13px;">
              <%--<asp:Label ID="Label2" runat="server" Text="|"></asp:Label>--%>
              |<asp:Label ID="Label3" runat="server" Text="Agents management"></asp:Label>
             
                           



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
                             <strong>Add or delete agents</strong>
            <asp:LinkButton ID="LinkButton7" style="color:white;" class="btn btn-primary mycolor" runat="server" >Add agent</asp:LinkButton>

                      
                            
                                <%--  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 hidden-xs text-right">
            <asp:LinkButton ID="LinkButton2" style="color:#68213A" runat="server" aria-expanded="false"><i class="glyphicon glyphicon-print"></i></asp:LinkButton>
                                    
                                  </div>--%>

                            </div>
                   
                        </div>
            </div>
        </div>
            </div>
            
         <div class="row" style="margin-top:60px;">

                             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <div class="alert alert-info myalert text-center" style="color:#68213A;opacity:01; ">
                      <div class="row">
                                                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="color:#5B5959;font-weight:bold;font-size:15px;margin-top:15px;">
                                                         <i class="glyphicon glyphicon-calendar"></i>&nbsp <asp:Label ID="Label2" runat="server" Text="Eunice"></asp:Label>

                                                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left:2px solid #68213A; ">
                              <div class="row">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                   <i class="glyphicon glyphicon-ice-lolly-tasted"></i>&nbsp <asp:Label ID="Label29" runat="server" Text="0712345673"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                   <i class="glyphicon glyphicon-flash"></i>&nbsp <asp:Label ID="Label1" runat="server" Text="55678900"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                      <i class="glyphicon glyphicon-dashboard"></i>&nbsp<asp:Label ID="Label5" runat="server" Text="Chesoi"></asp:Label>
                                  </div>
                                   
                              </div>
                               <div class="row" style="margin-top:5px;">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                       <div class="btn btn-group-sm" style="margin-left:0px;">
                                        <asp:LinkButton ID="LinkButton4" CssClass="btn btn-primary sales" runat="server">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton2" CssClass="btn btn-primary sales" runat="server">Modify</asp:LinkButton>

                                       </div>

                          <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>

                      </div></div>

                    </div>


                          </div>

                     
                  </div></div>
             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <div class="alert alert-info myalert text-center" style="color:#68213A;opacity:01; ">
                      <div class="row">
                                                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="color:#5B5959;font-weight:bold;font-size:15px;margin-top:15px;">
                                                         <i class="glyphicon glyphicon-calendar"></i>&nbsp <asp:Label ID="Label4" runat="server" Text="Kipchumba"></asp:Label>

                                                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left:2px solid #68213A; ">
                              <div class="row">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                   <i class="glyphicon glyphicon-ice-lolly-tasted"></i>&nbsp <asp:Label ID="Label6" runat="server" Text="0712345673"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                   <i class="glyphicon glyphicon-flash"></i>&nbsp <asp:Label ID="Label7" runat="server" Text="55678900"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                      <i class="glyphicon glyphicon-dashboard"></i>&nbsp<asp:Label ID="Label8" runat="server" Text="Chesoi"></asp:Label>
                                  </div>
                                   
                              </div>
                               <div class="row" style="margin-top:5px;">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                       <div class="btn btn-group-sm" style="margin-left:0px;">
                                        <asp:LinkButton ID="LinkButton3" CssClass="btn btn-primary sales" runat="server">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton5" CssClass="btn btn-primary sales" runat="server">Modify</asp:LinkButton>

                                       </div>

                          <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>

                      </div></div>

                    </div>


                          </div>

                     
                  </div></div>
             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                  <div class="alert alert-info myalert text-center" style="color:#68213A;opacity:01; ">
                      <div class="row">
                                                      <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="color:#5B5959;font-weight:bold;font-size:15px;margin-top:15px;">
                                                         <i class="glyphicon glyphicon-calendar"></i>&nbsp <asp:Label ID="Label9" runat="server" Text="Brian Kimutai"></asp:Label>

                                                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left:2px solid #68213A; ">
                              <div class="row">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                   <i class="glyphicon glyphicon-ice-lolly-tasted"></i>&nbsp <asp:Label ID="Label10" runat="server" Text="0712345673"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                   <i class="glyphicon glyphicon-flash"></i>&nbsp <asp:Label ID="Label11" runat="server" Text="55678900"></asp:Label>
                                  </div>
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                      <i class="glyphicon glyphicon-dashboard"></i>&nbsp<asp:Label ID="Label12" runat="server" Text="Chesoi"></asp:Label>
                                  </div>
                                   
                              </div>
                               <div class="row" style="margin-top:5px;">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                       <div class="btn btn-group-sm" style="margin-left:0px;">
                                        <asp:LinkButton ID="LinkButton6" CssClass="btn btn-primary sales" runat="server">Delete</asp:LinkButton>
                                        <asp:LinkButton ID="LinkButton8" CssClass="btn btn-primary sales" runat="server">Modify</asp:LinkButton>

                                       </div>

                          <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>

                      </div></div>

                    </div>


                          </div>

                     
                  </div></div>

                
             
           
             
        
                      </div>

    </div>
</asp:Content>

