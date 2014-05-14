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
		SqlConnection sqlConn = new SqlConnection("Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False");
		sqlConn.Open();
		SqlCommand notes = new SqlCommand("SELECT TOP 30 c.FirstName, c.LastName, n.Message " +
												"FROM Character AS c, Note AS n " +
												"WHERE c.CharacterID = n.PosterID " +
												"ORDER BY n.PostTime DESC", sqlConn);
		SqlDataReader drNotes = notes.ExecuteReader();

		List<string> names = new List<string>();
		List<string> posts = new List<string>();

		while (drNotes.Read())
		{
			Object[] arr = new Object[3];
			drNotes.GetValues(arr);

			string name = (string) arr[0];
			if (arr[1].GetType() != typeof(DBNull)) 
			{
				name += " " + arr[1];
			}

			names.Add(name);
			posts.Add ( (string) arr[2]);
		}


		drNotes.Close();

		sqlConn.Close();
    }
}