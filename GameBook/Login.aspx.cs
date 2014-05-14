using System;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Boolean validUser = false;
        Boolean validPass = false;
        SqlConnection sqlConn = new SqlConnection("Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False");
        sqlConn.Open();
        SqlCommand un = new SqlCommand("SELECT Username FROM [User]", sqlConn);
        
        SqlDataReader drUN = un.ExecuteReader();

        while (drUN.Read())
        {
            if ((String)drUN["Username"] == tbUser.Text)
                validUser = true;
        }
        drUN.Close();
        if (validUser == true)
        {
            lbName.Visible = false;
            SqlCommand password = new SqlCommand("SELECT * FROM [User] WHERE Username = @username AND Password = @password", sqlConn);

            password.Parameters.Add("@username", SqlDbType.NVarChar, 30, "Username");
            password.Parameters.Add("@password", SqlDbType.NVarChar, 16, "Password");
            password.Parameters[0].Value = tbUser.Text;
            password.Parameters[1].Value = tbPass.Text;

            SqlDataReader drpass = password.ExecuteReader();
            if (drpass.HasRows)
                validPass = true;

            if (validPass == true)
            {
                
                SqlCommand CID = new SqlCommand("SELECT CharacterID FROM [Login] WHERE Username = @username", sqlConn);
                CID.Parameters.Add("@username", SqlDbType.NVarChar, 30, "Username");
                CID.Parameters[0].Value = password.Parameters[0].Value;
                drpass.Close();
                SqlDataReader drCID = CID.ExecuteReader();
                if (!drCID.HasRows)
                {
                    Session["Username"] = CID.Parameters[0].Value;
                    sqlConn.Close();
                    Response.Redirect("CreateForm.aspx");
                }
				drCID.Read();
                Session["LoginCID"] = (int) drCID.GetValue(0);
                SqlCommand Fname = new SqlCommand("SELECT FirstName FROM [Character] WHERE CharacterID = @CID", sqlConn);
                Fname.Parameters.Add("@CID", SqlDbType.Int, Int32.MaxValue, "CharacterID");
                Fname.Parameters[0].Value = (int) drCID.GetValue(0);
                drCID.Close();
                Session["Name"] = (string) Fname.ExecuteScalar();
                sqlConn.Close();
                Response.Redirect("Live Feed.aspx");
            }
            else
                lbPass.Visible = true;

            sqlConn.Close();
        }
        else
        {
            lbName.Visible = true;
            lbPass.Visible = true;
            sqlConn.Close();
        }

        
    }
}