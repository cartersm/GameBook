using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Rescue : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["LoginCID"] == null)
            Response.Redirect("Login.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRescueCharacter_Click(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection("Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False");
        sqlConn.Open();
        SqlCommand newRescue = new SqlCommand("INSERT INTO [Rescue] (Hero, Damsel, Rescue_Status) VALUES ( " + Session["LoginCID"] + ", " + ddlDamsel.SelectedValue + ", 0)", sqlConn);
        newRescue.ExecuteNonQuery();
        sqlConn.Close();
        Response.Redirect("Rescue.aspx");
    }
    protected void btnLiveFeed_Click(object sender, EventArgs e)
    {
       
        Response.Redirect("Live Feed.aspx");
    }
    protected void btnRescued_Click(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection("Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False");
        sqlConn.Open();
        SqlCommand updateRescued = new SqlCommand("UPDATE [Rescue] SET Rescue_Status = 1 WHERE Hero = " + ddlHero.SelectedValue + " AND Damsel = " + Session["LoginCID"], sqlConn);
        updateRescued.ExecuteNonQuery();
        SqlCommand insertRescued = new SqlCommand("INSERT INTO [Rescue] (Hero, Damsel, Rescue_Status) VALUES ( " + Session["LoginCID"] + ", " + ddlHero.SelectedValue + ", 1)", sqlConn);
        insertRescued.ExecuteNonQuery();
        sqlConn.Close();
        Response.Redirect("Rescue.aspx");
    }
}