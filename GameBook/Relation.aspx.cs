using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Relation : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["LoginCID"] == null)
            Response.Redirect("Login.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Live Feed.aspx");
    }
    protected void bttnNewRelation_Click(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection("Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False");
        sqlConn.Open();
        SqlCommand newRelation = new SqlCommand("INSERT INTO [Relations] (UserCID, RescuedCID, RelationshipName) VALUES ( " + Session["LoginCID"] + " , " + ddlRescued.SelectedValue + ", " + tbRelationName.Text + ")", sqlConn);
        newRelation.ExecuteNonQuery();
        sqlConn.Close();
        gvRelationships.DataBind();
    }
}