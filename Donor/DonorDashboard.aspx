<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="DonorDashboard.aspx.cs" Inherits="Donor_DonorDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Registration form HTML and ASP.NET controls here -->
  <div class="card">
    <h2 style="margin-top:0;">Welcome, <asp:Label ID="lblName" runat="server" /></h2>

    <div class="grid-2">
      <div>
        <p><strong>Blood Group:</strong> <asp:Label ID="lblBlood" runat="server" /></p>
        <p><strong>Contact:</strong> <asp:Label ID="lblContact" runat="server" /></p>
        <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
        <p><strong>Address:</strong> <asp:Label ID="lblAddress" runat="server" /></p>
      </div>
      <div>
        <h4>Quick actions</h4>
        <ul>
          <li><a href="../Acceptor/SearchDonor.aspx">Search donors by blood group</a></li>
          <li><a href="WhyDonate.aspx">Why donate blood</a></li>
          <li><a href="WhoNeedsBlood.aspx">Who needs blood</a></li>
        </ul>
      </div>
    </div>

    <div style="margin-top:14px;">
      <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn" OnClick="btnLogout_Click" />
      <a class="btn secondary" href="DonorRegister.aspx" style="margin-left:8px;">Register another donor</a>
    </div>
  </div>
</asp:Content>

