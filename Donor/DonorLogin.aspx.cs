using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Donor_DonorLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        var donor = DataStore.GetDonorByEmail(txtEmail.Text.Trim());
        if (donor == null)
        {
            lblMsg.Text = "<span style='color:red;'>No donor found with that email.</span>";
            return;
        }

        Session["DonorEmail"] = donor["Email"].ToString();
        Response.Redirect("DonorDashboard.aspx");
    }
}