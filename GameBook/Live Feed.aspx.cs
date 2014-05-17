using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
        SqlDataSource1.ConnectionString="Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False";
        
    }
    protected void btnCreatePost_Click(object sender, EventArgs e)
    {
        Response.Redirect("SendPost.aspx");
    }
    protected void btnRescue_Click(object sender, EventArgs e)
    {
        Response.Redirect("Rescue.aspx");
    }
}