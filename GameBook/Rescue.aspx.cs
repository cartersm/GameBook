using System;
using System.Collections.Generic;
using System.Data;
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
        SqlCommand newRescue = new SqlCommand("INSERT INTO [Rescue] (Hero, Damsel, Rescue_Status) VALUES (@hero , @damsel, 0)", sqlConn);
        newRescue.Parameters.Add("@hero", SqlDbType.Int, Int32.MaxValue, "Hero");
        newRescue.Parameters.Add("@damsel", SqlDbType.Int, Int32.MaxValue, "Damsel");
        newRescue.Parameters[0].Value = Session["LoginCID"];
        newRescue.Parameters[1].Value = ddlDamsel.SelectedValue;
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
        SqlCommand updateRescued = new SqlCommand("UPDATE [Rescue] SET Rescue_Status = 1 WHERE Hero = @hero AND Damsel = @damsel", sqlConn);
        updateRescued.Parameters.Add("@hero", SqlDbType.Int, Int32.MaxValue, "Hero");
        updateRescued.Parameters.Add("@damsel", SqlDbType.Int, Int32.MaxValue, "Damsel");
        updateRescued.Parameters[0].Value = ddlHero.SelectedValue;
        updateRescued.Parameters[1].Value = Session["LoginCID"];
        updateRescued.ExecuteNonQuery();
        SqlCommand insertRescued = new SqlCommand("INSERT INTO [Rescue] (Hero, Damsel, Rescue_Status) VALUES ( @hero, @damsel, 1)", sqlConn);
        insertRescued.Parameters.Add("@hero", SqlDbType.Int, Int32.MaxValue, "Hero");
        insertRescued.Parameters.Add("@damsel", SqlDbType.Int, Int32.MaxValue, "Damsel");
        insertRescued.Parameters[1].Value = ddlHero.SelectedValue;
        insertRescued.Parameters[0].Value = Session["LoginCID"];
        insertRescued.ExecuteNonQuery();
        sqlConn.Close();
        Response.Redirect("Rescue.aspx");
    }
}