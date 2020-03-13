<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master"  EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Agents_Dashboard.aspx.cs" Inherits="Petrol_Station.Agents.Agents_Dashboard" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.7-dist/js/Modals.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.7-dist/css/fuel_styles.css" rel="stylesheet" />
    <%--<a href="../bootstrap-3.3.7-dist/js/">../bootstrap-3.3.7-dist/js/</a>--%>
    <script type="text/javascript">
        $("#clickArea").live("click", function () {
            $("[id*=Button1]").click();
        });
    </script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-inverse navbar-fixed-top" style="color: white; background-color: #68213A">
        <a class="navbar-brand" href="#" style="font-weight: bolder; color: white; padding: 0px; margin: 0px;">
            <%--<div class="container">--%>

            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite1.png" Style="width: 40px; height: 40px; margin: 2px;" />

            <%--</div>--%>

        </a>


        <div class="container">
            <div class="navbar-header" style="color: white;">

                <%--<asp:LinkButton ID="LinkButton5" class="navbar-toggle  " data-target="#navbar" aria-expanded="false" aria-controls="navbar" runat="server"><i class="glyphicon glyphicon-off"></i></asp:LinkButton>--%>
                <%--<button type="button" >--%>
                <%--   <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>--%>

                <a class="navbar-brand" href="#" style="font-weight: bolder; color: white; font-size: 10px;">
                    <asp:Label ID="Label1" runat="server" Text="Mwalimu"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="|"></asp:Label>
                    <asp:Label ID="Label14" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Label16" runat="server" Text="|"></asp:Label>

                    <asp:Label ID="Label18" runat="server" Text=""></asp:Label>







                </a>

            </div>
            <div id="navbar" class="collapse navbar-collapse" style="color: white;">
                <ul class="nav navbar-nav text-center" style="color: white;">
                    <%--<li class="active"><a href="#">Sell trees</a></li>--%>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
    <div class="container-fluid" style="margin-top: 60px;">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="row">

            <%--//START OF TANK--%>
           
            <%--START OF PANEL BODY -TANK--%>
              <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">

                <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div4">
                     <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <asp:Image class="all-icons" ID="Image5" runat="server" ImageUrl="~/Images/account.png" />&nbsp
                        <asp:Label ID="Label20" runat="server" Text="Agents details"></asp:Label>
                    </div>
                        <div class="panel-body">
                      <table class="table">
                          <tr><td class="danger"><strong> Agent name:</strong></td><td>
                              <asp:Label ID="Label9" runat="server" Text="Brian Kimutai Koskei"></asp:Label></td></tr>
                          <tr><td class="danger"> <strong> Station name:</strong></td><td>
                              <asp:Label ID="Label10" runat="server" Text="Bomet Petrol station"></asp:Label></td></tr>
                      </table>
                       </div>
                   
                   
                </div>
            </div>
             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">

                <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div1">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <div class="row">

                            <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
                        <asp:Image class="all-icons" ID="Image3" runat="server" style="width:60px;height:60px;" ImageUrl="~/Images/fuelachebiemitwhite1.png" />&nbsp&nbsp

                            </div>
                             <div class="col-lg-8 col-sm-8 col-md-8 col-xs-8">
                                 <div class=" row">
                                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                                          <asp:Label ID="Label3" runat="server" Text="Station Details"></asp:Label>
                                     </div>
                                 </div>
                                  <div class=" row">
                                     <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left">
                                          <asp:Label ID="Label7" runat="server" Text="Current available fuel"></asp:Label>
                                     </div>
                                 </div>
                                  
                            </div>
                        </div>
                       
                    </div>
                    <div class="panel-body">


                        <%--//REPEATER FOR FUEL--%>
                        <%--____________________________________________________________________________________________________________________________________________________--%>
                        <asp:Repeater ID="Repeater1" runat="server">



                            <ItemTemplate>
                                
                                  <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                           <div class="fuel">
                               <div class="alert alert-info myalert1 text-center" style="color:#68213A;opacity:1; ">
                      <div class="row">
                                                      <div class="col-lg-5 col-md-4 col-sm-5 col-xs-5" style="color:#5B5959;font-weight:bold;font-size:20px;">
                                                          <div class="row">
                                                              <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 " style="padding-top:12px;">
                                                                  <asp:Image ID="Image34" runat="server" ImageUrl="~/Images/logo.png" style="width:30px;height:30px;" />
                                                              </div>
                                                              <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9 " style="font-size:15px;padding-top:15px;">

                                                             <asp:Label ID="Label44" runat="server" Text='<%#Eval("Fuel_type")%>'></asp:Label>


                                                              </div>
                                                          </div>

                                                          </div>
                          <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="border-left:2px solid #68213A; ">
                              <div class="row">
                                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                     <i class="glyphicon glyphicon-dashboard"></i>&nbsp <asp:Label ID="Label5" runat="server" Text="5654464"></asp:Label>
                                  </div>
                               
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">
                                    <i class="glyphicon glyphicon-scale"></i>&nbsp<asp:Label ID="Label8" runat="server" Text="3500"></asp:Label>&nbsp <asp:Label ID="Label6" runat="server" Text="Litres."></asp:Label>
                                  </div>
                              </div>
                               <div class="row" style="margin-top:5px;">
                                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="color:#5B5959;font-weight:bold;">

                          <%--<i class="glyphicon glyphicon-chevron-right"></i>--%>
                                                                <%--<asp:LinkButton ID="LinkButton44" CssClass="btn btn-primary sales" runat="server">More</asp:LinkButton>--%>

                      </div></div>

                    </div>


                          </div>

                     
                  </div>
                           </div>

                        </div>
                        </div>

                            </ItemTemplate>

                        </asp:Repeater>
                        <%--__________________________________________________________________________________________________________________________________________________________--%>
                      
                       
                      
                           
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                    </div></div>
                </div>
            </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 " id="actionTab" runat="server">

                <div class="panel panel-primary " style="border: none; border-top-left-radius: 15px; border-top-right-radius: 15px; border-bottom-right-radius: 15px; border-bottom-left-radius: 15px;" runat="server" id="div3">
                    <div class="panel-heading text-center" style="background-color: #68213A; border-top-left-radius: 15px; border-top-right-radius: 15px; color: white; font-weight: bold;">
                        <asp:Image class="all-icons" ID="Image7" runat="server" ImageUrl="~/Images/actions.png" />&nbsp
                        <asp:Label ID="Label29" runat="server" Text="Actions"></asp:Label>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42; ">
                                <asp:LinkButton ID="LinkButton5" CssClass="btn btn-primary sales1" runat="server" OnClick="refilling"><i class="glyphicon glyphicon-dashboard"></i> &nbsp Refill tank</asp:LinkButton>
                               
                            </div>
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">
                             <asp:LinkButton ID="LinkButton7" CssClass="btn btn-primary sales1" runat="server" OnClick="changePrice"><i class="glyphicon glyphicon-pencil"></i> &nbsp Change price</asp:LinkButton>

                               
                            </div>
                              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-left" style="padding: 10px; color: #483F42;">
                           <asp:LinkButton ID="LinkButton12" CssClass="btn btn-primary sales1" runat="server" OnClick="changePrice"><i class="glyphicon glyphicon-pencil"></i> &nbsp Change price</asp:LinkButton>

                               
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                    </div>
                </div>
            </div>
            </div>
        <div class="row"></div>

              
           
     

        </div>

        <%---------------------------------------------------------------------END OF TANK------------------------------------------------------%>
        <%--//CHANGING PRICE MODAL--%>

        <div id="modal1" class="modal fade" role="dialog">

            <div class="modal-dialog">

                <!-- Modal content-->
                <%--    <div class="modal-content">--%>
                <div class="well" style="background-color: white; opacity: 0.9; border-radius: 30px;">
                    <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 text-right">
                        <asp:LinkButton ID="LinkButton6" CssClass="btn btn-default" runat="server"><i class="glyphicon glyphicon-remove-sign"></i></asp:LinkButton>
                    </div>
                    <div class="row text-center">
                        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/fuelaviolet.png" Style="height: 50px; width: 50px;" />
                        <h3></h3>


                        <div class="alert alert-info" style="background-color: #68213A; color: white;">
                            <strong>Please set
                                <asp:Label ID="Label17" runat="server" Text=""></asp:Label><asp:Label ID="Label21" runat="server" Text=" price per litre."></asp:Label>
                            </strong>
                        </div>
                    </div>
                    <div class="row text-center" style="margin-bottom: 20px;">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control rounded1" MaxLength="3" placeholder="Enter price here" Style="border: 1px #707070 solid;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter price" SetFocusOnError="true"
                                ForeColor="Red" ValidationGroup="bb"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Are you sure what you have typed is correct?Please confirm!." runat="server"
                                ValidationGroup="bb" Visible="true" Display="Dynamic" ControlToValidate="TextBox1" ValidationExpression="^[0-9]{2,3}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>

                        <asp:LinkButton ID="LinkButton4" runat="server" ValidationGroup="bb" CssClass="btn btn-primary categoryselector" OnClick="updatePrice"><i class="glyphicon glyphicon-usd"></i>&nbsp Update price</asp:LinkButton><br />
                        <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                    </div>

                </div>
            </div>
            <%--</div>--%>

            <%--//REFILING PETROL DASHBOAD--%>
        </div>
        <%--//REFILLING TANK--%>
        <div id="refill" class="modal fade" role="dialog">

            <div class="modal-dialog">

                <!-- Modal content-->
                <%--    <div class="modal-content">--%>
                <div class="well" style="background-color: white; opacity: 1; border-radius: 10px;">
                    <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 text-right">
                        <asp:LinkButton ID="LinkButton8" CssClass="btn btn-default" runat="server"><i class="glyphicon glyphicon-remove-sign"></i></asp:LinkButton>
                    </div>
                    <div class="row text-center">
                                              <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/fuelaviolet.png" Style="height: 50px; width: 50px;" />

                        <h3></h3>


                        <div class="alert alert-info" style="background-color: #68213A; color: white;">
                            <strong> <asp:Label ID="Label28" runat="server" Text=""></asp:Label><asp:Label ID="Label22" runat="server" Text=""></asp:Label> <asp:Label ID="Label299" runat="server" Text=""></asp:Label></strong>
                        </div>
                    </div>
                    <div class="row text-center" style="margin-bottom: 20px;" runat="server" id="beforeSubmit">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                            <asp:TextBox ID="TextBox2" runat="server" class="form-control rounded1" MaxLength="10" type="number" placeholder="Volume refilled" Style="border: 1px #707070 solid;"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="TextBox2" ErrorMessage="Are you sure what you have typed is correct?Please confirm!." SetFocusOnError="true"
                                ForeColor="Red" ValidationGroup="q"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ErrorMessage="Are you sure what you have typed is correct?Please confirm!." runat="server"
                                ValidationGroup="q" Visible="true" Display="Dynamic" ControlToValidate="TextBox2" ValidationExpression="^[0-9]{3,10}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                        </div>

                        <asp:LinkButton ID="LinkButton9" runat="server" ValidationGroup="q" CssClass="btn btn-primary categoryselector" OnClick="ConfirmUpdatePrice"><i class="glyphicon glyphicon-check"></i>&nbsp Submit </asp:LinkButton><br />
                        <asp:Label ID="Label24" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="row text-center" style="margin-bottom: 20px;" runat="server" id="confirm">
                        <div class="alert alert-info"   id="tableConfirming" runat="server">
                            <div class="row">

                            <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <table class="table">
                                    <tr class="text-center"><td colspan="2">
                                        <strong>NB:Are you sure you want to submit the following data??This action cannot be reversed.</strong>
                                                            </td></tr>
                                    <tr>
                                        <td>Previous tank capacity:</td><td>
                                            <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>Ammount to refill:</td><td>
                                            <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>New tank capacity:</td><td>
                                            <asp:Label ID="Label26" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td><asp:LinkButton ID="LinkButton10" runat="server" CssClass="btn btn-primary categoryselector1" OnClick="cancelRefill"><i class="glyphicon glyphicon-pencil"></i>&nbsp Modify </asp:LinkButton></td><td><asp:LinkButton ID="LinkButton11" runat="server"  CssClass="btn btn-primary categoryselector1" OnClick="confirmRefilling"><i class="glyphicon glyphicon-check"></i>&nbsp Confirm </asp:LinkButton></td>
                                    </tr>
                                </table>
                                </div>
                            </div>
                            <div class="row">
                            <div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">

                                </div>
                        </div>
                        </div>
                                <asp:Label ID="Label27" runat="server" Text=""></asp:Label>
                        


                </div>
            </div>
            <%--</div>--%>

            <%--//REFILING PETROL DASHBOAD--%>
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
                            <asp:LinkButton ValidationGroup="vv" ID="LinkButton2" CssClass="btn btn-primary mycolor" runat="server">Proceed</asp:LinkButton>
                            <asp:Label ID="Label13" runat="server" Text=""></asp:Label>
                        </div>



                    </div>


                </div>

            </div>
        </div>

    </div>
    <div class="container">
         <div class="footer">
 <div class="hover">
     <span><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/more.png" class="more"/><asp:LinkButton CssClass="btn btn-default categoryselector12" ID="LinkButton1" runat="server"><i class="glyphicon glyphicon-usd"></i> &nbsp Submit sales</asp:LinkButton></span>
     <a class="social-link" href="https://twitter.com/twitter" style="background-color:#68213A;color:white;">
         <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/drop2.png" style="height:20px;width:20px;"/>&nbsp<strong>PETROL</strong> </a>
     <a class="social-link" href="#" target="_blank"  runat="server" onclientclick="changeStation"><asp:Image ID="Image8" runat="server" ImageUrl="~/Images/drop.png" style="height:20px;width:20px;"/>&nbsp<strong>DIESEL</strong> </a>
       <a class="social-link" href="https://twitter.com/twitter" style="background-color:#707070;color:white;">
         <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/drop2.png" style="height:20px;width:20px;"/>&nbsp<strong>KEROSENE</strong> </a>
     </div>
</div>
    </div>
</asp:Content>
