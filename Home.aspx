<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <section class="card">
        <h1>Welcome to BloodConnect</h1>
        <p>Find or donate blood — fast, safe, and local.</p>
        <div>
            <a class="btn" href="Donor/DonorRegister.aspx">Become a Donor</a>
            <a class="btn secondary" href="Acceptor/RequestBlood.aspx" style="margin-left:10px;">Request Blood</a>
        </div>
    </section>
    <!-- Quick Links -->
    <div class="card">
        <h3 style="margin-top:0;">Quick Links</h3>
        <ul>
            <li><a href="Acceptor/SearchDonor.aspx">Search donors by blood group</a></li>
            <li><a href="Donor/WhyDonate.aspx">Why donate blood</a></li>
            <li><a href="Donor/WhoNeedsBlood.aspx">Who needs blood</a></li>
        </ul>
    </div>
    <!-- Image Gallery Section -->
    <section class="card">
        <h2>Our Mission in Action</h2>
        <div class="image-gallery">
            <div class="image-card">
                <img src="Content/images/donate1.jpg" alt="Donor giving blood" />
                <div class="overlay">Saving lives, one drop at a time</div>
            </div>
            <div class="image-card">
                <img src="Content/images/donate2.jpg" alt="Blood donation camp" />
                <div class="overlay">Community blood drives</div>
            </div>
            <div class="image-card">
                <img src="Content/images/donate3.jpg" alt="Medical team" />
                <div class="overlay">Trusted medical partners</div>
            </div>
            <div class="image-card">
                <img src="Content/images/donate4.jpg" alt="Blood storage" />
                <div class="overlay">Safe and secure storage</div>
            </div>
        </div>
    </section>

</asp:Content>

