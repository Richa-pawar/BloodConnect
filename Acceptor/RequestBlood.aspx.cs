using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestBlood : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRequest_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        string connStr = ConfigurationManager.ConnectionStrings["BloodBankDB"].ConnectionString;

        int acceptorId = 0;

        // 1️⃣ Find the AcceptorId by ContactNumber (entered in txtEmail field)
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string findAcc = "SELECT AcceptorId FROM Acceptor WHERE ContactNumber = @ContactNumber";
            SqlCommand cmd = new SqlCommand(findAcc, con);
            cmd.Parameters.AddWithValue("@ContactNumber", txtPhone.Text.Trim());

            con.Open();
            object result = cmd.ExecuteScalar();
            if (result == null)
            {
                lblMsg.Text = "<span style='color:red;'>No registered acceptor found with that contact number. Please register first.</span>";
                return;
            }
            acceptorId = Convert.ToInt32(result);
        }

        // 2️⃣ Insert the blood request and get the new RequestId
        int reqId = 0;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string insertReq = @"
                INSERT INTO BloodRequests (AcceptorId, BloodGroup, Units, Urgency, Status)
                OUTPUT INSERTED.RequestId
                VALUES (@AcceptorId, @BloodGroup, @Units, @Urgency, @Status)";

            SqlCommand cmd = new SqlCommand(insertReq, con);
            cmd.Parameters.AddWithValue("@AcceptorId", acceptorId);
            cmd.Parameters.AddWithValue("@BloodGroup", ddlBlood.SelectedValue);
            cmd.Parameters.AddWithValue("@Units", Convert.ToInt32(txtUnits.Text.Trim()));
            cmd.Parameters.AddWithValue("@Urgency", ddlUrgency.SelectedValue);
            cmd.Parameters.AddWithValue("@Status", "Pending");

            con.Open();
            reqId = (int)cmd.ExecuteScalar();
        }

        // 3️⃣ Show success message
        lblMsg.Text = "<span style='color:green;'>Request submitted successfully! Request ID: " + reqId + ".</span>";
    }
}