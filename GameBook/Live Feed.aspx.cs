using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Live_Feed : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["LoginCID"] == null)
            Response.Redirect("Login.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}