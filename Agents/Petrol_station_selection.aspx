﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Petrol_station_selection.aspx.cs" Inherits="Petrol_Station.Agents.Petrol_station_selection" %>
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

            <div class="well" style="background-color:black;opacity:0.8;border-radius:40px;border:none">
                <div class="row text-center">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                 
                    
                        <div class="alert alert-info" style="background-color:#68213A;color:white;border:none">
                            <strong>Please select petrol station to continue.<asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            </strong>
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
        </div>
    </div>
</asp:Content>
