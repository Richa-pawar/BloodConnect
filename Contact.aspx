<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Default2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Intro -->
    <section class="card">
        <h1>Contact Us</h1>
        <p>If you have questions about blood donation, need urgent assistance, or want to partner with us, we’re here to help. Reach out using the details below or send us a message through the form.</p>
    </section>

    <!-- Contact Details -->
    <section class="card contact-details">
        <h2>Our Office</h2>
        <p><strong>Address:</strong> BloodConnect HQ, Saket Nagar, Bhopal, Madhya Pradesh – 462020</p>
        <p><strong>Phone:</strong> +91‑9876543210</p>
        <p><strong>Email:</strong> <a href="mailto:info@bloodconnect.org">info@bloodconnect.org</a></p>
        <p><strong>Working Hours:</strong> Mon – Sat, 9:00 AM – 6:00 PM</p>
    </section>

    <!-- Contact Form -->
    <section class="card">
        <h2>Send Us a Message</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        <div class="form-group">
            <label for="txtName">Your Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="textbox"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtEmail">Your Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtMessage">Message</label>
            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="5" CssClass="textbox"></asp:TextBox>
        </div>
        <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn" OnClick="btnSubmit_Click" />
    </section>

    <!-- Google Map -->
    <section class="card">
        <h2>Find Us</h2>
        <iframe 
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3680.123456789!2d77.412345!3d23.233456!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c69d123456789%3A0xabcdef123456789!2sAIIMS%20Bhopal!5e0!3m2!1sen!2sin!4v1691234567890"
            width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy">
        </iframe>
    </section>
</asp:Content>
