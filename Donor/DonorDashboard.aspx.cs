using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Donor_DonorDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string email = Session["DonorEmail"] as string;
            if (string.IsNullOrEmpty(email))
            {
                Response.Redirect("DonorLogin.aspx");
                return;
            }

            DataRow row = DataStore.GetDonorByEmail(email);
            if (row == null)
            {
                Session.Remove("DonorEmail");
                Response.Redirect("DonorLogin.aspx");
                return;
            }

            lblName.Text = row["Name"].ToString();
            lblBlood.Text = row["BloodGroup"].ToString();
            lblContact.Text = row["ContactNumber"].ToString();
            lblEmail.Text = row["Email"].ToString();
            lblAddress.Text = row["Address"].ToString();
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Remove("DonorEmail");
        Response.Redirect("DonorLogin.aspx");
    }
}