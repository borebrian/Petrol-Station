<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ALL_TESTS.aspx.cs" Inherits="Petrol_Station.Agents.ALL_TESTS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script src="../bootstrap-3.3.7-dist/js/JQ.js"></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet" />
    
    <script src="../bootstrap-validator-master/js/validator.js"></script>
    <link href="../TEST.css" rel="stylesheet" />
    <script src="../TESTINGS.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <form role="form" data-toggle="validator">
02
  <div class="form-group">
03
    <label for="inputName" class="control-label">Name</label>
04
    <input type="text" class="form-control" id="inputName" placeholder="Cina Saffary" required>
05
  </div>
06
  <div class="form-group">
07
    <label for="inputEmail" class="control-label">Email</label>
08
    <input type="email" class="form-control" id="inputEmail" placeholder="Email" data-error="Bruh, that email address is invalid" required>
09
    <div class="help-block with-errors"></div>
10
  </div>
11
  <div class="form-group">
12
    <label for="inputPassword" class="control-label">Password</label>
13
    <div class="form-inline row">
14
      <div class="form-group col-sm-6">
15
        <input type="password" data-minlength="6" class="form-control" id="inputPassword" placeholder="Password" required>
16
        <div class="help-block">Minimum of 6 characters</div>
17
      </div>
18
      <div class="form-group col-sm-6">
19
        <input type="password" class="form-control" id="inputPasswordConfirm" data-match="#inputPassword" data-match-error="Whoops, these don't match" placeholder="Confirm" required>
20
        <div class="help-block with-errors"></div>
21
      </div>
22
    </div>
23
  </div>
24
  ...
25
</form>

</asp:Content>
