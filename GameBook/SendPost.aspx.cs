using System;
using System.Collections.Generic;
using System.Data;
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
        {
            if(Session["Username"] != null)
                Response.Redirect("CreateForm.aspx");
            else
                Response.Redirect("Login.aspx");
        }
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
        SqlCommand newPost = new SqlCommand("INSERT INTO [Note] (PosterID, Message, PowerUpNumber) VALUES (@posterID, @NoteText, 0); SELECT SCOPE_IDENTITY()", sqlConn);
        newPost.Parameters.Add("@posterID", SqlDbType.Int, Int32.MaxValue, "PosterID");
        newPost.Parameters.Add("@NoteText", SqlDbType.NVarChar, 255, "Message");
        newPost.Parameters[0].Value = Session["LoginCID"];
        newPost.Parameters[1].Value = tbPost.Text;


        SqlCommand toUser = new SqlCommand("INSERT INTO [PostToCharacter] (PostID, CharacterID) VALUES ( @postID, @charID)", sqlConn);
        toUser.Parameters.Add("@postID", SqlDbType.Int, Int32.MaxValue, "PostID");
        toUser.Parameters.Add("@charID", SqlDbType.Int, Int32.MaxValue, "CharacterID");
        toUser.Parameters[0].Value = int.Parse(newPost.ExecuteScalar().ToString());
        toUser.Parameters[1].Value = int.Parse(ddlPostTo.SelectedValue);
        toUser.ExecuteNonQuery();
        sqlConn.Close();
        Response.Redirect("Live Feed.aspx");
    }
    protected void btnLiveFeed_Click(object sender, EventArgs e)
    {
        Response.Redirect("Live Feed.aspx");
    }
}