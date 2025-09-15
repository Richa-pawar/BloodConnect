<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DonorLogin.aspx.cs" Inherits="Donor_DonorLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Registration form HTML and ASP.NET controls here -->
<div class="card">
    <h2>Donor Login</h2>
    <asp:ValidationSummary runat="server" CssClass="validation-summary-errors" />

    <label>Email</label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="input" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="validator" />
    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,}$" ErrorMessage="Enter a valid email" CssClass="validator" />

    <br /><br />
    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
    <a class="btn secondary" href="DonorRegister.aspx">Register</a>

    <br /><br />
    <asp:Label ID="lblMsg" runat="server" />
</div>
</asp:Content>
