using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var path = Request.AppRelativeCurrentExecutionFilePath.ToLowerInvariant();
        Activate(lnkHome, path);
        Activate(lnkAbout, path);
        Activate(lnkContact, path);
        Activate(lnkDonor, path);
        Activate(lnkRequest, path);
        Activate(lnkAdmin, path);
        Activate(lnkContacts, path);
    }

    private void Activate(System.Web.UI.WebControls.HyperLink lnk, string path)
    {
        if (lnk == null) return;
        if (lnk.NavigateUrl.ToLowerInvariant() == path ||
            path.Contains(lnk.NavigateUrl.ToLowerInvariant().Replace("~", "")))
        {
            lnk.CssClass = "nav active";
        }
        else
        {
            lnk.CssClass = "nav";
        }
    }

}
