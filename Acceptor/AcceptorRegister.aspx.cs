using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AcceptorRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["BloodBankDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(connStr))
        {
            string query = @"INSERT INTO Acceptor (Name, BloodGroup, ContactNumber)
                         VALUES (@Name, @BloodGroup, @ContactNumber)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
            cmd.Parameters.AddWithValue("@BloodGroup", ddlBlood.SelectedValue);
            cmd.Parameters.AddWithValue("@ContactNumber", txtPhone.Text.Trim());

            con.Open();
            cmd.ExecuteNonQuery();
        }

        //Optional success message
         lblResult.Text = "Acceptor registered successfully!";

        // Redirect to Admin Dashboard to see the update
        //Response.Redirect("~/Admin/AdminDashboard.aspx");
    }

}