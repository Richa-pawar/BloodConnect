using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminDashboard : System.Web.UI.Page
{
    string connStr = ConfigurationManager.ConnectionStrings["BloodBankDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDashboardStats();
            LoadDonors();
            LoadAcceptors();
            LoadRequests();
            LoadRecentActivity();
        }
    }

    private void LoadDashboardStats()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            SqlCommand cmd1 = new SqlCommand("SELECT COUNT(*) FROM Donor", con);
            lblDonorCount.Text = cmd1.ExecuteScalar().ToString();

            SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM Acceptor", con);
            lblAcceptorCount.Text = cmd2.ExecuteScalar().ToString();

            SqlCommand cmd3 = new SqlCommand("SELECT COUNT(*) FROM BloodRequests WHERE Status='Pending'", con);
            lblPendingRequests.Text = cmd3.ExecuteScalar().ToString();
        }
    }

    private void LoadDonors()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Donor", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvDonors.DataSource = dt;
            gvDonors.DataBind();
        }
    }

    private void LoadAcceptors()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Acceptor", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvAcceptors.DataSource = dt;
            gvAcceptors.DataBind();
        }
    }

    private void LoadRequests()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM BloodRequests", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvRequests.DataSource = dt;
            gvRequests.DataBind();
        }
    }

    private void LoadRecentActivity()
    {
        using (SqlConnection con = new SqlConnection(connStr))
        {
            con.Open();

            SqlCommand cmd1 = new SqlCommand("SELECT TOP 5 Name, BloodGroup, RegisteredDate FROM Donor ORDER BY RegisteredDate DESC", con);
            gvRecentDonors.DataSource = cmd1.ExecuteReader();
            gvRecentDonors.DataBind();

            con.Close();
            con.Open();

            SqlCommand cmd2 = new SqlCommand(@"SELECT TOP 5 r.RequestId, a.Name AS AcceptorName, r.BloodGroup, r.Units, r.RequestDate, r.Status
                                                   FROM BloodRequests r
                                                   INNER JOIN Acceptor a ON r.AcceptorId = a.AcceptorId
                                                   ORDER BY r.RequestDate DESC", con);
            gvRecentRequests.DataSource = cmd2.ExecuteReader();
            gvRecentRequests.DataBind();
        }
    }

    protected void gvDonors_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvDonors.DataKeys[e.RowIndex].Value);
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Donor WHERE DonorId=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        LoadDonors();
    }

    protected void gvAcceptors_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvAcceptors.DataKeys[e.RowIndex].Value);
        using (SqlConnection con = new SqlConnection(connStr))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Acceptor WHERE AcceptorId=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        LoadAcceptors();
    }

    protected void gvRequests_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Approve" || e.CommandName == "Reject")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvRequests.Rows[index];
            int requestId = Convert.ToInt32(row.Cells[0].Text);

            string newStatus = e.CommandName == "Approve" ? "Approved" : "Rejected";

            using (SqlConnection con = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("UPDATE BloodRequests SET Status=@status WHERE RequestId=@id", con);
                cmd.Parameters.AddWithValue("@status", newStatus);
                cmd.Parameters.AddWithValue("@id", requestId);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            LoadRequests();
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Clear session and redirect to login
        Session.Clear();
        Response.Redirect("AdminLogin.aspx");
    }
}

