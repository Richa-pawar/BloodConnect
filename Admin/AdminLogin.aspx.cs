using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        // Simple hardcoded admin credentials for demo
        if (txtUser.Text.Trim() == "admin" && txtPass.Text.Trim() == "admin123")
        {
            Session["IsAdmin"] = true;
            Response.Redirect("AdminDashboard.aspx");
        }
        else
        {
            lblMsg.Text = "<span style='color:red;'>Invalid username or password.</span>";
        }
    }
}