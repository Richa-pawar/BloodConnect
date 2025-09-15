<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="SearchDonor.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Motivational Quote -->
    <div class="card quote-box">
        <p>🩸 <em>"A single pint can save three lives. Be the reason someone smiles today."</em></p>
    </div>

    <!-- Blood Group Legend -->
    <div class="card blood-legend">
        <span class="blood-tag">A+</span><span class="blood-tag">A-</span>
        <span class="blood-tag">B+</span><span class="blood-tag">B-</span>
        <span class="blood-tag">AB+</span><span class="blood-tag">AB-</span>
        <span class="blood-tag">O+</span><span class="blood-tag">O-</span>
    </div>

    <!-- Search Tip -->
    <div class="card tip-box">
        <strong>💡 Tip:</strong> Use filters below or click a quick search button to find matching donors instantly.
    </div>

    <!-- Search Form -->
    <div class="card">
        <h2>Search Donors</h2>

        <label>Select Blood Group</label>
        <asp:DropDownList ID="ddlBlood" runat="server" CssClass="dropdown">
            <asp:ListItem Text="--Select--" Value="" />
            <asp:ListItem>A+</asp:ListItem><asp:ListItem>A-</asp:ListItem>
            <asp:ListItem>B+</asp:ListItem><asp:ListItem>B-</asp:ListItem>
            <asp:ListItem>AB+</asp:ListItem><asp:ListItem>AB-</asp:ListItem>
            <asp:ListItem>O+</asp:ListItem><asp:ListItem>O-</asp:ListItem>
        </asp:DropDownList>

        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click" />
        <asp:Label ID="lblSearchStatus" runat="server" CssClass="status-label" />

        <hr />


        <!-- Donor Statistics -->
        <div class="card donor-stats">
            <h3>Current Donor Availability</h3>
            <div class="stats-grid">
                <div class="stat-box">A+ : <asp:Label ID="lblAplus" runat="server" /></div>
                <div class="stat-box">A- : <asp:Label ID="lblAminus" runat="server" /></div>
                <div class="stat-box">B+ : <asp:Label ID="lblBplus" runat="server" /></div>
                <div class="stat-box">B- : <asp:Label ID="lblBminus" runat="server" /></div>
                <div class="stat-box">AB+ : <asp:Label ID="lblABplus" runat="server" /></div>
                <div class="stat-box">AB- : <asp:Label ID="lblABminus" runat="server" /></div>
                <div class="stat-box">O+ : <asp:Label ID="lblOplus" runat="server" /></div>
                <div class="stat-box">O- : <asp:Label ID="lblOminus" runat="server" /></div>
            </div>
        </div>

        <!-- Results Table -->
        <asp:GridView ID="gvDonors" runat="server" AutoGenerateColumns="false" CssClass="gridview" GridLines="None">
            <Columns>
                <asp:BoundField DataField="DonorId" HeaderText="ID" />
                <asp:BoundField DataField="Name" HeaderText="Name" />
                <asp:BoundField DataField="Age" HeaderText="Age" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="BloodGroup" HeaderText="Blood Group" />
                <asp:BoundField DataField="ContactNumber" HeaderText="Contact" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="AvailabilityStatus" HeaderText="Status" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>


