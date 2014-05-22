using System;
using System.Collections.Generic;
using System.Data;
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
        SqlCommand newRelation = new SqlCommand();
        newRelation.Connection = sqlConn;
        newRelation.CommandType = CommandType.StoredProcedure;
        newRelation.CommandText = "Create_Relation";
        //SqlCommand newRelation = new SqlCommand("INSERT INTO [Relations] (UserCID, RescuedCID, RelationshipName) VALUES ( " + Session["LoginCID"] + " , " + ddlRescued.SelectedValue + ", " + tbRelationName.Text + ")", sqlConn);
        newRelation.Parameters.Add("@UserCID", SqlDbType.Int, Int32.MaxValue, "UserCID").Value = Session["LoginCID"];
        newRelation.Parameters.Add("@RescuedCID", SqlDbType.Int, Int32.MaxValue, "RescuedCID").Value = ddlRescued.SelectedValue;
        newRelation.Parameters.Add("@RelationshipName", SqlDbType.NVarChar, 8000 , "RelationshipName").Value = tbRelationName.Text.ToString();
        newRelation.ExecuteNonQuery();
        sqlConn.Close();
        gvRelationships.DataBind();
    }
}