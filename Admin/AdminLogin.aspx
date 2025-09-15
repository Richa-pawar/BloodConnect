<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Intro / Header Section -->
<section class="card adminlogin-header">
    <h1>Welcome to the Admin Portal</h1>
    <p>Sign in with your administrator credentials to manage donors, requests, and reports securely.</p>
</section>
<div class="card">
    <h2>Admin Login</h2>
    <asp:ValidationSummary runat="server" CssClass="validation-summary-errors" />

    <label>Username</label>
    <asp:TextBox ID="txtUser" runat="server" CssClass="input" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUser" ErrorMessage="Username is required" CssClass="validator" />

    <label>Password</label>
    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="input" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPass" ErrorMessage="Password is required" CssClass="validator" />

    <br /><br />
    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />
    <asp:Label ID="lblMsg" runat="server" />
</div>
    <!-- Footer / Note Section -->
<section class="card adminlogin-note">
    <p>🔒 This portal is for authorized administrators only. All activities are monitored and logged for security purposes.</p>
</section>
</asp:Content>

