<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Petrol_station_selection.aspx.cs" Inherits="Petrol_Station.Agents.Petrol_station_selection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />
    <script src="../bootstrap-3.3.7-dist/js/Modals.js"></script>
      <meta name="viewport" content="width=device-width, initial-scale=1">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid" style="padding:0px;">
        <div class="well" style="background-color:transparent;border:none;">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
            <div class="well" style="background-color:black;opacity:0.8;border-radius:40px;border:none">
               
                <div class="row text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                 
                    
                        <div class="well text-center" style="background-color:#68213A;color:white;border:none">
                            <strong>Please select petrol station to continue.NB: Use search to find a station<asp:Label ID="Label2" runat="server" Text=""></asp:Label>   </strong>
                                <div class="row">
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 hidden-xs "></div>
                              
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 ">
    
      <div class = "input-group">
                                <asp:TextBox ID="TextBox1" CssClass="form-control rounded1" placeholder="Please enter station name to search" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
           <span class = "input-group-btn">

                                                     <asp:LinkButton ID="LinkButton16" CssClass="btn btn-default" runat="server" ValidationGroup="nm" OnClick="LinkButton16_Click"><i class="glyphicon glyphicon-search"></i> &nbsp Search</asp:LinkButton>

                                 </span></div>
                         </div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 hidden-xs "></div>

                        </div>
                              </div>
                </div>
                
                <asp:Repeater ID="Repeater1" runat="server">
                    <Itemtemplate>
              <div class="row text-center" style="margin-bottom:20px;font-size:15px;">
                  <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn btn-primary categoryselector" OnClick="SelectStation">
                      <strong>
                  <asp:Label ID="Label3" runat="server" Text='<%#Eval("Station_ref")%>' style="font-size:0px;"></asp:Label>
                      <asp:Label ID="Label1" style="font-size:10px;" runat="server" Text='<%#Eval("Station_name")%>'></asp:Label></strong>
                  </asp:LinkButton>
              </div>
                        </Itemtemplate>
           </asp:Repeater>
                <div class="row text-center">
                    <%--<asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary mycolor" runat="server">Back</asp:LinkButton>--%>
                </div>
            </div>
                    <%--</asp:UpdatePanel>--%>

        </div>
      
         <div id="modalfueltest" class="modal fade" role="dialog">
  <div class="modal-dialog">

  <div class="well text-right" style="background-color:white;opacity:0.95;border-radius:10px;padding:10px;border:none">
     
      <div class="row">
       <div class="col-lg-12 col-lg-12 col-lg-12 col-lg-12 text-right" >
      <strong>Warning! No fuel added to this petrol station.Do you want to add it now?</strong>
           <div class="btn btn-group">
      <asp:LinkButton OnClick="set" class="btn btn-default" ID="LinkButton3" runat="server">Set it now</asp:LinkButton>
                <asp:LinkButton ID="LinkButton4" runat="server" class="btn btn-default"><i class="glyphicon glyphicon-remove-sign"></i></asp:LinkButton>
           </div>
      </div></div></div></div>
      </div>
    </div>
   
</asp:Content>
