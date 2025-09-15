<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="LifeSavingContacts.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <!-- Emergency Numbers -->
    <section class="card emergency-box">
    <h2>🚨 Emergency Numbers</h2>
    <div class="emergency-grid">
        <div class="emergency-item">
            <span class="icon">🚑</span>
            <strong>Ambulance</strong>
            <span>108</span>
        </div>
        <div class="emergency-item">
            <span class="icon">🚓</span>
            <strong>Police</strong>
            <span>100</span>
        </div>
        <div class="emergency-item">
            <span class="icon">🚒</span>
            <strong>Fire</strong>
            <span>101</span>
        </div>
        <div class="emergency-item">
            <span class="icon">📞</span>
            <strong>Women Helpline</strong>
            <span>1091</span>
        </div>
    </div>
</section>

    <!-- Intro -->
    <section class="card">
        <h1>Life Saving Contacts – Hospitals in Bhopal</h1>
        <p>In case of medical emergencies, here are some of the key hospitals in Bhopal with their contact details.</p>
    </section>

    <!-- AIIMS Bhopal -->
    <section class="card">
        <h2>AIIMS Bhopal</h2>
        <p><strong>Address:</strong> Saket Nagar, Bhopal, Madhya Pradesh – 462020</p>
        <p><strong>Hospital Helpline:</strong> 0755‑2982607, 0755‑2985569</p>
        <p><strong>Emergency:</strong> 9343639369</p>
        <p><strong>Website:</strong> <a href="https://aiimsbhopal.edu.in" target="_blank">aiimsbhopal.edu.in</a></p>
    </section>

    <!-- 1250 Hospital -->
    <section class="card">
        <h2>Government Jai Prakash District Hospital (1250 Hospital)</h2>
        <p><strong>Address:</strong> 1250, Link Road No. 2, Tulsi Nagar, Shivaji Nagar, Bhopal, Madhya Pradesh – 462001</p>
        <p><strong>Phone:</strong> 0755‑2556812</p>
        <p><strong>Website:</strong> <a href="http://www.jphospital.org" target="_blank">jphospital.org</a></p>
    </section>

    <!-- Bansal Hospital -->
    <section class="card">
        <h2>Bansal Hospital</h2>
        <p><strong>Address:</strong> Shahpura, Bhopal, Madhya Pradesh – 462016</p>
        <p><strong>Phone:</strong> 0755‑4086000</p>
        <p><strong>Website:</strong> <a href="https://www.bansalhospital.net" target="_blank">bansalhospital.net</a></p>
    </section>
</asp:Content>
