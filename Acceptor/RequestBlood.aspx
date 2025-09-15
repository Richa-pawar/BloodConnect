<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="RequestBlood.aspx.cs" Inherits="RequestBlood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Registration form HTML and ASP.NET controls here -->
<div class="card">
    <h2>Request Blood</h2>
    <asp:ValidationSummary runat="server" CssClass="validation-summary-errors" />

    <label>Acceptor Contact Number</label>
    <asp:TextBox ID="txtPhone" runat="server" CssClass="input" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPhone" ErrorMessage="Contact is required" CssClass="validator" />

    <label>Blood Group</label>
    <asp:DropDownList ID="ddlBlood" runat="server" CssClass="dropdown">
        <asp:ListItem Text="--Select--" Value="" />
        <asp:ListItem>A+</asp:ListItem><asp:ListItem>A-</asp:ListItem>
        <asp:ListItem>B+</asp:ListItem><asp:ListItem>B-</asp:ListItem>
        <asp:ListItem>AB+</asp:ListItem><asp:ListItem>AB-</asp:ListItem>
        <asp:ListItem>O+</asp:ListItem><asp:ListItem>O-</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlBlood" InitialValue="" ErrorMessage="Select a blood group" CssClass="validator" />

    <label>Units Required</label>
    <asp:TextBox ID="txtUnits" runat="server" CssClass="input" />
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtUnits" ErrorMessage="Units are required" CssClass="validator" />
    <asp:RangeValidator runat="server" ControlToValidate="txtUnits" MinimumValue="1" MaximumValue="10" Type="Integer" ErrorMessage="Enter 1–10 units" CssClass="validator" />

    <label>Urgency</label>
    <asp:DropDownList ID="ddlUrgency" runat="server" CssClass="dropdown">
        <asp:ListItem>Low</asp:ListItem>
        <asp:ListItem>Normal</asp:ListItem>
        <asp:ListItem>High</asp:ListItem>
    </asp:DropDownList>

    <label>Notes</label>
    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Rows="3" CssClass="textarea" />

    <br /><br />
    <asp:Button ID="btnRequest" runat="server" Text="Submit Request" CssClass="btn" OnClick="btnRequest_Click" />
    <asp:Label ID="lblMsg" runat="server" />
</div>
</asp:Content>


