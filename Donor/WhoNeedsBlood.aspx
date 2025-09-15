<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="WhoNeedsBlood.aspx.cs" Inherits="Donor_WhoNeedsBlood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Intro -->
    <section class="card">
        <h1>Who Needs Blood?</h1>
        <p>People in need of blood include those facing severe injuries or accidents, patients undergoing surgeries, individuals with chronic illnesses like anemia, and those battling cancer or blood disorders. Blood and its components — red blood cells, white blood cells, platelets, and plasma — are crucial for carrying oxygen, fighting infection, and facilitating blood clotting.</p>
    </section>

    <!-- Who Needs Blood Section -->
    <section class="card">
        <h2>Who Needs Blood?</h2>
        <ul>
            <li><strong>Trauma and Injury:</strong> Individuals with severe blood loss from accidents or traumatic injuries require transfusions to replenish lost blood.</li>
            <li><strong>Surgeries:</strong> Patients undergoing complex surgical procedures often need donated blood to manage blood loss during and after the operation.</li>
            <li><strong>Chronic Illnesses:</strong> People with conditions like anemia, which involves a low count of red blood cells or hemoglobin, need transfusions to improve their oxygen-carrying capacity.</li>
            <li><strong>Blood Disorders:</strong> Patients with blood disorders may require blood or blood components to manage their condition.</li>
            <li><strong>Cancer and Chronic Diseases:</strong> Blood transfusions are essential for cancer patients who may experience anemia or other complications, and for those with various chronic illnesses that affect their blood.</li>
        </ul>
    </section>

    <!-- What Parts of Blood Are Needed -->
    <section class="card">
        <h2>What Parts of Blood Are Needed?</h2>
        <div class="facts-grid">
            <div class="fact-box">
                <h4>Red Blood Cells</h4>
                <p>Deliver oxygen from the lungs to the body's tissues.</p>
            </div>
            <div class="fact-box">
                <h4>Platelets</h4>
                <p>Help the blood clot to stop bleeding at injury sites.</p>
            </div>
            <div class="fact-box">
                <h4>Plasma</h4>
                <p>The liquid portion of blood that helps with blood clotting and contains antibodies that fight infection.</p>
            </div>
            <div class="fact-box">
                <h4>White Blood Cells</h4>
                <p>Defend the body against infections.</p>
            </div>
        </div>
    </section>

    <!-- Closing -->
    <section class="card">
        <p><strong>Blood donation is a lifeline</strong> — ensuring these vital components are available for those who need them most.</p>
    </section>
</asp:Content>

