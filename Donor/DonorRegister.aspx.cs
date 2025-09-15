using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Donor_DonorRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrWhiteSpace(txtName.Text) ||
            string.IsNullOrWhiteSpace(txtAge.Text) ||
            string.IsNullOrWhiteSpace(rblGender.SelectedValue) ||
            string.IsNullOrWhiteSpace(ddlBlood.SelectedValue) ||
            string.IsNullOrWhiteSpace(txtPhone.Text) ||
            string.IsNullOrWhiteSpace(txtEmail.Text) ||
            string.IsNullOrWhiteSpace(txtAddress.Text))
        {
            lblResult.Text = "<span style='color:red;'>Please fill in all required fields.</span>";
            return;
        }

        try
        {
            string connStr = ConfigurationManager.ConnectionStrings["BloodBankDB"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO Donor 
                            (Name, Age, Gender, BloodGroup, ContactNumber, Email, Address, AvailabilityStatus)
                             VALUES 
                            (@Name, @Age, @Gender, @BloodGroup, @ContactNumber, @Email, @Address, 'Active')";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(txtAge.Text.Trim()));
                cmd.Parameters.AddWithValue("@Gender", rblGender.SelectedValue);
                cmd.Parameters.AddWithValue("@BloodGroup", ddlBlood.SelectedValue);
                cmd.Parameters.AddWithValue("@ContactNumber", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblResult.Text = "<span style='color:green;'>Registration successful!</span>";

            // Clear form
            txtName.Text = "";
            txtAge.Text = "";
            rblGender.ClearSelection();
            ddlBlood.SelectedIndex = 0;
            txtPhone.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
        }
        catch (Exception ex)
        {
            lblResult.Text = "<span style='color:red;'>Error: " + ex.Message + "</span>";
        }
    }
}