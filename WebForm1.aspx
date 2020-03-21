<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Petrol_Station.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           
                                <%--//TABLE WITH TWO TEXTBOXES--%>
                                <table class="table" id="table1" runat="server" style="border: none" border="0">
                                    <tr style="background-color: white;">
                                        <td class="text-left" style="font-size: 25px;">
                                            <div class="row">
                                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="padding: 5px; border-right: #574D50 solid 2px;">
                                                    <div>
                                                        <strong>
                                                            <asp:Image class="all-icons" ID="Image9" runat="server" Style="width: 20px; height: 20px;" ImageUrl="~/Images/drop.png" /></strong>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 text-left" style="font-size: 15px;">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Label ID="Label21" runat="server" Text="" Style="font-weight: 999; color: #68213A"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                            <asp:Label ID="Label22" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox ID="TextBox2" runat="server" type="number" class="form-control rounded1" MaxLength="12" placeholder="Enter previous metre readings." Style="height: 50px; font-size: 18px; font-weight: 999;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="Dynamic" runat="server" ControlToValidate="TextBox2" ErrorMessage="Enter meter here" SetFocusOnError="true"
                                ForeColor="Red" ValidationGroup="yy"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ErrorMessage="Are you sureyou have typed the meter correctly?Please confirm!." runat="server"
                                ValidationGroup="yy" Visible="true" Display="Dynamic" ControlToValidate="TextBox2" ValidationExpression="^[0-9.]{2,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox ID="TextBox4" runat="server" type="number" class="form-control rounded1" MaxLength="3" placeholder="Enter previous metre readings." Style="height: 50px; font-size: 18px; font-weight: 999;"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ControlToValidate="TextBox4" ErrorMessage="Enter previous meter here" SetFocusOnError="true"
                                ForeColor="Red" ValidationGroup="yy"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ErrorMessage="Are you sureyou have typed the meter correctly?Please confirm!." runat="server"
                                ValidationGroup="yy" Visible="true" Display="Dynamic" ControlToValidate="TextBox4" ValidationExpression="^[0-9.]{2,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td colspan="2">
                                            <asp:LinkButton ID="LinkButton7" runat="server"  ValidationGroup="yy" OnClick="next33" class="btn btn-primary sales1">Next Page</asp:LinkButton>

                                        
                                            </td>
                                    </tr>
                                </table>
                                <%--//TABLE WITH ONE TEXTBOXES--%>
                                <table class="table" id="table3" runat="server" style="border: none" border="0">
                                    <tr style="background-color: white;">
                                        <td class="text-left" style="font-size: 25px;">
                                            <div class="row">
                                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="padding: 5px; border-right: #574D50 solid 2px;">
                                                    <div>
                                                        <strong>
                                                            <asp:Image class="all-icons" ID="Image12" runat="server" Style="width: 20px; height: 20px;" ImageUrl="~/Images/drop.png" /></strong>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 text-left" style="font-size: 15px;">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Label ID="Label27" runat="server" Text="" Style="font-weight: 999; color: #68213A"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                            <asp:Label ID="Label28" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox ID="TextBox5" runat="server" type="number" class="form-control rounded1" MaxLength="3" placeholder="Enter today's metre readings." Style="height: 50px; font-size: 18px; font-weight: 999;"></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server" ControlToValidate="TextBox5" ErrorMessage="Enter todays meter here" SetFocusOnError="true"
                                ForeColor="Red" ValidationGroup="bn"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ErrorMessage="Are you sureyou have typed the meter correctly?Please confirm!." runat="server"
                                ValidationGroup="bn" Visible="true" Display="Dynamic" ControlToValidate="TextBox5" ValidationExpression="^[0-9.]{2,50}$" SetFocusOnError="true" CssClass="validator" ForeColor="Red">
                            </asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td colspan="2">
                                            <asp:LinkButton ValidationGroup="bn" ID="LinkButton10" OnClick="next11" class="btn btn-primary sales1" runat="server">Next page</asp:LinkButton></td>
                                    </tr>
                                </table>
                                <%--//TABLE WITH TWO TEXTBOXES BUT FOR CONFIRMATION PURPOSE--%>
                                <table class="table" id="table2" runat="server" style="border: none" border="0">
                                    <tr style="background-color: white;">
                                        <td colspan="2" class="text-left" style="font-size: 25px;">
                                            <div class="row">
                                                <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" style="padding: 5px; border-right: #574D50 solid 2px;">
                                                    <div>
                                                        <strong>
                                                            <asp:Image class="all-icons" ID="Image11" runat="server" Style="width: 20px; height: 20px;" ImageUrl="~/Images/drop.png" /></strong>
                                                    </div>
                                                </div>
                                                <div class="col-lg-10 col-md-10 col-sm-10 col-xs-10 text-left" style="font-size: 15px;">
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Label ID="Label23" runat="server" Text="" Style="font-weight: 999; color: #68213A"></asp:Label>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                                                            <asp:Label ID="Label24" runat="server" Text=""></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td class="text-center"  colspan="2" >
                                        <Strong><asp:Label style="font-size:40px;font-weight:900"  ID="Label37" runat="server" Text=""></asp:Label></Strong></td>
                                    </tr>
                                    <tr><td> <asp:LinkButton ValidationGroup="bn" ID="LinkButton6" OnClick="prev11" class="btn btn-primary sales1" runat="server"><i class="glyphicon glyphicon-pencil"></i> &nbsp Modify</asp:LinkButton></td><td><asp:LinkButton ValidationGroup="bn" ID="LinkButton11" OnClick="finishSubmisiion" class="btn btn-primary sales1" runat="server"><i class="glyphicon glyphicon-arrow-right"></i> &nbsp <i class="glyphicon glyphicon-saved"></i>&nbsp Finish</asp:LinkButton></td></tr>
                                </table>
                                <table class="table"  runat="server" style="font-size:20px; " id="table6">
                                    <tr>
                                        <td><strong>Previous readings:</strong></td>
                                        <td style="background-color: #68213A; color: white; font-weight: 999">
                                            <asp:Label ID="Label25" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Today's readings:</strong></td>
                                        <td style="background-color: #68213A; color: white; font-weight: 999">
                                            <asp:Label ID="Label26" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>

                                        <td colspan="2">
                                            <div class="btn  btn-group-justified">
                                                <span class="input-group-btn">
                                                    <asp:LinkButton ID="LinkButton8" OnClick="backDoubleTextbox" class="btn btn-primary sales1" runat="server"><i class="glyphicon glyphicon-arrow-left"></i> &nbsp Back</asp:LinkButton>
                                                </span>
                                                <span class="input-group-btn">
                                                    <asp:LinkButton ID="LinkButton9" class="btn btn-primary sales1" runat="server" OnClick="finishtask"><i class="glyphicon glyphicon-ok"></i>&nbsp Finish</asp:LinkButton>
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <table class="table confirmed" runat="server" id="tableconfirm" style="background-color: white;">
                                    <tr>

                                        <td colspan="2" class="text-center"><i class="glyphicon glyphicon-exclamation-sign"></i>
                                            <br />
                                            <strong>
                                                <asp:Label ID="Label35" runat="server" Text=""></asp:Label>.&nbsp<asp:Label ID="Label36" runat="server" Text=" An SMS confirmation has been sent to the manager."></asp:Label></strong></td>
                                    </tr>
                                    <tr>
                                        <td>Yesterday meter readings:</td>
                                        <td class="success"><strong>
                                            <asp:Label ID="Label31" runat="server" Text=""></asp:Label></strong></td>
                                    </tr>
                                    <tr>
                                        <td>Today meter readings:</td>
                                        <td class="success"><strong>
                                            <asp:Label ID="Label32" runat="server" Text=""></asp:Label></strong></td>
                                    </tr>
                                    <tr>
                                        <td>Litres sold:</td>
                                        <td class="success"><strong>
                                            <asp:Label ID="Label33" runat="server" Text=""></asp:Label></strong></td>
                                    </tr>
                                    <tr>
                                        <td>Price per litre:</td>
                                        <td class="success"><strong>
                                            <asp:Label ID="Label34" runat="server" Text=""></asp:Label></strong></td>
                                    </tr>
                                </table>
    </form>
</body>
</html>
