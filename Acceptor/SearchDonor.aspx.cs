using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDonorStats();
        }
    }

    private void LoadDonorStats()
    {
        lblAplus.Text = CountDonors("A+").ToString();
        lblAminus.Text = CountDonors("A-").ToString();
        lblBplus.Text = CountDonors("B+").ToString();
        lblBminus.Text = CountDonors("B-").ToString();
        lblABplus.Text = CountDonors("AB+").ToString();
        lblABminus.Text = CountDonors("AB-").ToString();
        lblOplus.Text = CountDonors("O+").ToString();
        lblOminus.Text = CountDonors("O-").ToString();
    }

    private int CountDonors(string bloodGroup)
    {
        string connStr = ConfigurationManager.ConnectionStrings["BloodBankDB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = "SELECT COUNT(*) FROM Donor WHERE BloodGroup = @BloodGroup";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@BloodGroup", bloodGroup);
            con.Open();
            return (int)cmd.ExecuteScalar();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string bg = ddlBlood.SelectedValue;
        if (string.IsNullOrEmpty(bg))
        {
            lblSearchStatus.Text = "Please select a blood group.";
            gvDonors.DataSource = null;
            gvDonors.DataBind();
            return;
        }

        BindGrid(bg);
        lblSearchStatus.Text = "Showing donors with blood group " + bg + ".";
    }

    private void BindGrid(string bloodGroup)
    {
        string connStr = ConfigurationManager.ConnectionStrings["BloodBankDB"].ConnectionString;
        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = @"
            SELECT 
                DonorId, 
                ISNULL(Name, 'Unknown') AS Name, 
                ISNULL(Age, 0) AS Age, 
                ISNULL(Gender, 'Not Specified') AS Gender, 
                ISNULL(BloodGroup, 'N/A') AS BloodGroup, 
                ISNULL(ContactNumber, 'No Contact') AS ContactNumber, 
                ISNULL(Email, 'No Email') AS Email, 
                ISNULL(Address, 'No Address') AS Address, 
                ISNULL(AvailabilityStatus, 'Unknown') AS AvailabilityStatus
            FROM Donor
            WHERE BloodGroup = @BloodGroup";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@BloodGroup", bloodGroup);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvDonors.DataSource = dt;
            gvDonors.DataBind();
        }
    }
}