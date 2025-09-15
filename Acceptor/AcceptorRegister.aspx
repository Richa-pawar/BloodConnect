<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AcceptorRegister.aspx.cs" Inherits="AcceptorRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Registration form HTML and ASP.NET controls here -->
<div class="card">
    <h2>Acceptor Registration</h2>
    <asp:ValidationSummary runat="server" CssClass="validation-summary-errors" HeaderText="Please fix the following:" />

    <label>Name</label>
    <asp:TextBox ID="txtName" runat="server" CssClass="input" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" CssClass="validator" />

    <label>Age</label>
    <asp:TextBox ID="txtAge" runat="server" CssClass="input" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required" CssClass="validator" />
    <asp:RangeValidator runat="server" ControlToValidate="txtAge" MinimumValue="1" MaximumValue="120" Type="Integer" ErrorMessage="Enter a valid age" CssClass="validator" />

    <label>Gender</label>
    <asp:RadioButtonList ID="rblGender" runat="server" RepeatDirection="Horizontal">
        <asp:ListItem Text="Male" Value="Male" />
        <asp:ListItem Text="Female" Value="Female" />
        <asp:ListItem Text="Other" Value="Other" />
    </asp:RadioButtonList>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="rblGender" InitialValue="" ErrorMessage="Gender is required" CssClass="validator" />

    <label>Blood Group Required</label>
    <asp:DropDownList ID="ddlBlood" runat="server" CssClass="dropdown">
        <asp:ListItem Text="--Select--" Value="" />
        <asp:ListItem>A+</asp:ListItem><asp:ListItem>A-</asp:ListItem>
        <asp:ListItem>B+</asp:ListItem><asp:ListItem>B-</asp:ListItem>
        <asp:ListItem>AB+</asp:ListItem><asp:ListItem>AB-</asp:ListItem>
        <asp:ListItem>O+</asp:ListItem><asp:ListItem>O-</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlBlood" InitialValue="" ErrorMessage="Select a blood group" CssClass="validator" />

    <label>Contact Number</label>
    <asp:TextBox ID="txtPhone" runat="server" CssClass="input" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone" ErrorMessage="Contact number is required" CssClass="validator" />
    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPhone" ValidationExpression="^[6-9]\d{9}$" ErrorMessage="Enter a valid 10-digit mobile" CssClass="validator" />

    <label>Email</label>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="input" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" CssClass="validator" />
    <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,}$" ErrorMessage="Enter a valid email" CssClass="validator" />

    <label>Hospital Name</label>
    <asp:TextBox ID="txtHospital" runat="server" CssClass="input" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtHospital" ErrorMessage="Hospital name is required" CssClass="validator" />

    <label>Request Reason</label>
    <asp:TextBox ID="txtReason" runat="server" TextMode="MultiLine" Rows="3" CssClass="textarea" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtReason" ErrorMessage="Reason is required" CssClass="validator" />

    <br /><br />
    <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn" OnClick="btnRegister_Click" />
    <a class="btn secondary" href="RequestBlood.aspx">Request Blood</a>

    <br /><br />
    <a href="../Donor/WhyDonate.aspx">Why Donate Blood</a> | <a href="../Donor/WhoNeedsBlood.aspx">Who Needs Blood</a>

    <br /><br />
    <asp:Label ID="lblResult" runat="server" />
</div>
</asp:Content>

