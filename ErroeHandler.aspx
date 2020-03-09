<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ErroeHandler.aspx.cs" Inherits="Petrol_Station.ErroeHandler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="bootstrap-3.3.7-dist/css/sTYLE.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
         <div class="well" style="background-color:white;opacity:0.9;border-radius:30px;">
                <div class="row text-center">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/fuelachebiemitwhite.png" style="height:90px; width:90px;" />
                    <h3></h3>
                 
                    
                        <div class="alert alert-info" style="background-color:#68213A;color:white;">
                            <strong>Please refer the following error!
                            </strong>
                        </div>
                </div>
              <div class="row text-center" style="margin-bottom:20px;">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                      <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </div>
                  
                 
              </div>
                 
            </div>
      </div>
    

</asp:Content>
