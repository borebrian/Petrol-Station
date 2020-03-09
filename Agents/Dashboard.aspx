<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Petrol_Station.Agents.Dashboard" %>

    <asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
        <meta name="viewport" content="width=device-width, initial-scale=1">

       <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
        <script src="../bootstrap-3.3.7-dist/js/Modals.js"></script>
        <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
         <script type="text/javascript">
        $("#clickArea").live("click", function () {
            $("[id*=Button1]").click();
        });
    </script>
       

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <nav class="navbar navbar-inverse navbar-fixed-top" style="color:white;background-color:#68213A">
            <a class="navbar-brand" href="#" style="font-weight:bolder;color:white;padding:0px;margin:0px;">
             <%--<div class="container">--%>
               
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="width:40px;height:40px;margin:2px;" />
           <%--</div>--%>

            </a>
           

      <div class="container">
        <div class="navbar-header" style="color:white;" >

            <%--<asp:LinkButton ID="LinkButton5" class="navbar-toggle  " data-target="#navbar" aria-expanded="false" aria-controls="navbar" runat="server"><i class="glyphicon glyphicon-off"></i></asp:LinkButton>--%>
          <%--<button type="button" >--%>
         <%--   <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>--%>

          <a class="navbar-brand" href="#" style="font-weight:bolder;color:white;font-size:10px;">
              <asp:Label ID="Label1" runat="server" Text="Mwalimu"></asp:Label>
              <asp:Label ID="Label2" runat="server" Text="|"></asp:Label>
              <asp:Label ID="Label14" runat="server" Text=""></asp:Label>
              <asp:Label ID="Label16" runat="server" Text="|"></asp:Label>
           
              <asp:Label ID="Label18" runat="server" Text=""></asp:Label>
                  


     



          </a>

        </div>
        <div id="navbar" class="collapse navbar-collapse" style="color:white;">
          <ul class="nav navbar-nav text-center" style="color:white; ">
            <%--<li class="active"><a href="#">Sell trees</a></li>--%>
           

    

           
          </ul>

        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container-fluid" style="margin-top:60px;">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">
                <div class="panel panel-primary " style="border:none;border-top-left-radius:30px;border-top-right-radius:30px;border-bottom-right-radius:40px;border-bottom-left-radius:40px;" runat="server" id="div1">
                    <div class="panel-heading text-center" style="background-color:#483F42;border-top-left-radius:30px;border-top-right-radius:30px;color:white;font-weight:bold;" >
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-center ">
                                <asp:Image class="all-icons" ID="Image3" runat="server" ImageUrl="~/Images/tank2.png" /><br />
                        <%--<asp:Label ID="Label4" runat="server" Text="Current"></asp:Label>--%>
                        <asp:Label ID="Label15" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Label19" runat="server" Text="capacity"></asp:Label>



                        </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 ">
                                <asp:Image class="all-icons" ID="Image4" runat="server" ImageUrl="~/bootstrap-3.3.7-dist/Images/meter1.png" /><br />
                        <asp:Label ID="Label3" runat="server" Text="Lavel indicator"></asp:Label>

</div>
                    </div></div>
                    <div class="panel-body" >
                      <div class="row">
                          <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 "  style="margin-left:0px;margin-right:0px;">
                                  <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div style="height:40px;width:120px;background-color:#483F42;border-top-left-radius:40px;border-top-right-radius:40px;margin-left:40px;border-bottom-right-radius:5px;border-bottom-left-radius:5px;" class="text-center">

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div style="height:60px;width:200px;background-color:white;border-top-left-radius:50px;border-top-right-radius:50px;border:2px solid #483F42;color:#483F42;padding-top:20px;font-size:15px;" class="text-center">
                                    <strong>
                                    <asp:Label ID="Label7" runat="server" Text="Price/Litre:"></asp:Label><asp:Label ID="Label8" runat="server" Text="110"></asp:Label><asp:Label ID="Label9" runat="server" Text="/="></asp:Label></strong>
                                </div>
                            </div>
                        </div>
                              <div class="row">
                           
                              </div>
                    
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                                <div id="clickArea" runat="server"  style="height:200px;width:200px;border:2px solid #483F42;border-bottom-left-radius:50px;border-bottom-right-radius:50px;">
 <div style="height:20px;width:196px;background-color:white;border-bottom-right-radius:10px;border-bottom-left-radius:10px;" id="tank" runat="server" class="text-center">
     <asp:Label ID="Label5" runat="server" Text="1499.654"></asp:Label><asp:Label ID="Label6" runat="server" Text="Litres"></asp:Label>
                                </div>
                                     <%--<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >--%>
                                
                                  <%--<hr  style="height:2px;background-color:green;"/>--%>
                                <%--</div>--%>
                            </div>
                        </div>
                        
                    </div>
                             
                          </div>
                          <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1 " style="margin-left:0px;margin-right:0px;">
                              <div class="row">
                                  <asp:Label ID="Label10" runat="server" Text="Enough" style="color:green;font-weight:bold;"></asp:Label>
                              </div>
                              <div class="row">
                              <div style="height:50px;width:10px;background-color:#0F7E2C;border-top-left-radius:15px;border-top-right-radius:15px;"></div>

                              <div style="height:50px;width:10px;background-color:#8BD99F"></div>
                              <div style="height:50px;width:10px;background-color:#BAD1BC"></div>
                              <div style="height:50px;width:10px;background-color:#DA98A0"></div>


                              <div style="height:50px;width:10px;background-color:#D34C5D"></div>

                              <div style="height:50px;width:10px;background-color:#D3001A;border-bottom-right-radius:15px;border-bottom-left-radius:15px;"></div>

</div>
                              <div class="row">
                                  <asp:Label ID="Label11" runat="server" Text="Less" style="color:red;font-weight:bold;"></asp:Label>
                              </div>
                          </div>
                          
                      </div>
                         <div class="row " style="margin-top:7px;">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center" >
                                 <%--<div class="btn-group">--%>

                                                                <%--<asp:LinkButton ID="LinkButton2" CssClass="btn btn-primary sales" runat="server" OnClick="LinkButton2_Click">Go to sales</asp:LinkButton>--%>
                                                                <asp:LinkButton ID="LinkButton3" CssClass="btn btn-primary sales" runat="server" OnClick="LinkButton3_Click"><i class="glyphicon glyphicon-user"></i>&nbsp Admin</asp:LinkButton>
                                     <asp:LinkButton ID="LinkButton5" CssClass="btn btn-primary sales" runat="server" OnClick="LinkButton3_Click"><i class="glyphicon glyphicon-dashboard"></i> &nbsp Refill tank</asp:LinkButton>
                                     


                                     <%--</div>--%>

                                </div>
                              </div>
                   </div>
                </div></div>
          
          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">
                
                <div class="panel panel-primary " style="border:none;border-top-left-radius:30px;border-top-right-radius:30px;border-bottom-right-radius:40px;border-bottom-left-radius:40px;" runat="server" id="div2">
                    <div class="panel-heading text-center" style="background-color:#68213A;border-top-left-radius:30px;border-top-right-radius:30px;color:white;font-weight:bold;">
                        <asp:Image class="all-icons" ID="Image5" runat="server" ImageUrl="~/Images/sales.png" />&nbsp
                        <asp:Label ID="Label20" runat="server"  Text="Todays Sales"></asp:Label>
            </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-center" style="padding-top:10px;color:#483F42;" >
                                <asp:Label ID="Label12" runat="server" Text="Pending..."></asp:Label>
                            </div>
                             <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 text-center" style="padding-top:10px;color:#483F42;" >
                                 <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary sales" runat="server" OnClick="LinkButton1_Click">Go to sales</asp:LinkButton>
                            </div>
                        </div>
                    </div>
                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">

            </div></div></div>
        </div>
        <div id="modal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
<%--    <div class="modal-content">--%>
        <div class="well" style="background-color:white;opacity:0.9;border-radius:30px;">
             <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 text-right" >
            <asp:LinkButton ID="LinkButton6" CssClass="btn btn-default" runat="server"><i class="glyphicon glyphicon-remove-sign"></i></asp:LinkButton></div>
                <div class="row text-center">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                 
                    
                        <div class="alert alert-info" style="background-color:#68213A;color:white;">
                            <strong>Please set petrol price per litre.<asp:Label ID="Label17" runat="server" Text=""></asp:Label>
                            </strong>
                        </div>
                </div>
              <div class="row text-center" style="margin-bottom:20px;">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control rounded1" placeholder="Enter price here" style="border:1px #707070 solid;"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter price" SetFocusOnError="true"
                                        ForeColor="Red" ValidationGroup="bb"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="bb" Visible="true" Display="Dynamic" ControlToValidate="TextBox1" ValidationExpression="^[0-9]{1,13}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                        </div>
                  
                  <asp:LinkButton ID="LinkButton4" runat="server" CssClass="btn btn-primary categoryselector"><i class="glyphicon glyphicon-usd"></i>&nbsp Update payment</asp:LinkButton>
              </div>
                 
            </div>
      </div><%--</div>--%>
    </div>
        <div id="modal2" class="modal fade" role="dialog">
  <div class="modal-dialog">

  <div class="alert alert-success">
  <strong>Enter admin password to continue!</strong>
      <div class="row">
            <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 ">

                 <asp:TextBox ID="TextBox4" MaxLength="8" runat="server" class="form-control rounded1" placeholder="Enter password here"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter password here"
                                        ForeColor="Red" ValidationGroup="vv"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ErrorMessage="Invalid characters" runat="server"
                                        ValidationGroup="vv" Display="Dynamic" Visible="true" ControlToValidate="TextBox4" ValidationExpression="^[0-9a-zA-Z]{1,15}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                                    </asp:RegularExpressionValidator>
                <asp:LinkButton ValidationGroup="vv" ID="LinkButton2" CssClass="btn btn-primary mycolor" runat="server" >Proceed</asp:LinkButton>
                                 <asp:Label ID="Label13"  runat="server" Text=""></asp:Label>
            </div>



      </div>
      

</div>

      </div>
    </div></div>
</asp:Content>
