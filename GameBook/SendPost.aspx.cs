using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SendPost : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["LoginCID"] == null)
            Response.Redirect("Login.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //SqlDSPostTo.ConnectionString = "Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False";
        //SqlDSPostTo.SelectCommand = "SELECT c.FirstName, r.Damsel " +
        //                            "FROM Rescue AS r, Character AS c " +
        //                            "WHERE " + Session["LoginID"] + " = r.Hero AND r.Damsel = c.CharacterID AND r.Status = 1 " +
        //                            "ORDER BY c.FirstName ASC";
       // ddlPostTo.DataTextField = SqlDSPostTo. FirstName;
    }
    protected void btnCreatePost_Click(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection("Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False");
        sqlConn.Open();
        SqlCommand newPost = new SqlCommand("INSERT INTO [Note] (PosterID, PostTime, Message, PowerUpNumber) VALUES ( " + Session["LoginID"]+ ", (CONVERT([smalldatetime],getdate(),(0))) ,"+tbPost.Text+", 0); SELECT SCOPE_IDENTITY()", sqlConn);
        SqlCommand toUser = new SqlCommand("INSERT INTO [PostToCharacter] (PostID, CharacterID) VALUES ( " + int.Parse(newPost.ExecuteScalar().ToString()) + ", " + ddlPostTo.SelectedValue + ")", sqlConn);
        toUser.ExecuteNonQuery();
        sqlConn.Close();
        Response.Redirect("Live Feed.aspx");
    }
}