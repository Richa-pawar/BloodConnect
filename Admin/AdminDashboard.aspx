<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AdminDashboard.aspx.cs" Inherits="AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Summary Stats -->
    <section class="card stats-grid">
        <div class="stat-box">
            <h2><asp:Label ID="lblDonorCount" runat="server" /></h2>
            <p>Total Donors Registered</p>
        </div>
        <div class="stat-box">
            <h2><asp:Label ID="lblAcceptorCount" runat="server" /></h2>
            <p>Total Acceptors Registered</p>
        </div>
        <div class="stat-box">
            <h2><asp:Label ID="lblPendingRequests" runat="server" /></h2>
            <p>Pending Blood Requests</p>
        </div>
    </section>

    <!-- Your Existing Dashboard -->
    <div class="card">
        <h2>Admin Dashboard</h2>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn secondary" OnClick="btnLogout_Click" />

        <h3>Registered Donors</h3>
        <asp:GridView ID="gvDonors" runat="server" AutoGenerateColumns="false" DataKeyNames="DonorId" OnRowDeleting="gvDonors_RowDeleting">
            <Columns>
                <asp:BoundField DataField="DonorId" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact" />
                <asp:CommandField ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>

        <h3>Registered Acceptors</h3>
        <asp:GridView ID="gvAcceptors" runat="server" AutoGenerateColumns="false" DataKeyNames="AcceptorId" OnRowDeleting="gvAcceptors_RowDeleting">
            <Columns>
                <asp:BoundField DataField="AcceptorId" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact" />
                <asp:CommandField ShowDeleteButton="true" />
            </Columns>
        </asp:GridView>

        <h3>Blood Requests</h3>
        <asp:GridView ID="gvRequests" runat="server" AutoGenerateColumns="false" DataKeyNames="RequestId" OnRowCommand="gvRequests_RowCommand">
            <Columns>
                <asp:BoundField DataField="RequestId" HeaderText="ID" />
                <asp:BoundField DataField="AcceptorId" HeaderText="Acceptor ID" />
                <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                <asp:BoundField DataField="Units" HeaderText="Units" />
                <asp:BoundField DataField="Urgency" HeaderText="Urgency" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:ButtonField Text="Approve" CommandName="Approve" />
                <asp:ButtonField Text="Reject" CommandName="Reject" />
            </Columns>
        </asp:GridView>
    </div>

    <!-- Recent Activity -->
    <section class="card">
        <h3>Recent Donor Registrations</h3>
        <asp:GridView ID="gvRecentDonors" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                <asp:BoundField DataField="RegisteredDate" HeaderText="Registered On" DataFormatString="{0:dd-MMM-yyyy}" />
            </Columns>
        </asp:GridView>
    </section>

    <section class="card">
        <h3>Recent Blood Requests</h3>
        <asp:GridView ID="gvRecentRequests" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="RequestId" HeaderText="Request ID" />
                <asp:BoundField DataField="AcceptorName" HeaderText="Acceptor Name" />
                <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                <asp:BoundField DataField="Units" HeaderText="Units" />
                <asp:BoundField DataField="RequestDate" HeaderText="Requested On" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
            </Columns>
        </asp:GridView>
    </section>
</asp:Content>
