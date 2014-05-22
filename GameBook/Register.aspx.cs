using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Boolean validUser = true;
        SqlConnection sqlConn = new SqlConnection("Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False");
        sqlConn.Open();
        SqlCommand un = new SqlCommand();
        un.Connection = sqlConn;
        un.CommandType = CommandType.StoredProcedure;
        un.CommandText = "Get_Num_Username";
        //SqlCommand un = new SqlCommand("SELECT COUNT(Username) FROM [User] WHERE Username = @username", sqlConn);
        un.Parameters.Add("@username", SqlDbType.NVarChar, 30, "Username");
        un.Parameters[0].Value = UserName.Text;

        if ((int)un.ExecuteScalar() > 0)
        {
            validUser = false;
            lbName.Visible = true;
            sqlConn.Close();
        }
        else
        {
            SqlCommand newUser = new SqlCommand();
            newUser.Connection = sqlConn;
            newUser.CommandType = CommandType.StoredProcedure;
            newUser.CommandText = "Create_User";
            lbName.Visible = false;
            //SqlCommand newUser = new SqlCommand("INSERT INTO [User] (Username, Password) VALUES (@username, @password)", sqlConn);
            newUser.Parameters.Add("@username", SqlDbType.NVarChar, 30, "Username");
            newUser.Parameters.Add("@password", SqlDbType.NVarChar, 16, "Password");
            newUser.Parameters[0].Value = un.Parameters[0].Value;
            newUser.Parameters[1].Value = Password.Text;
            newUser.ExecuteNonQuery();
            Session["Username"] = newUser.Parameters[0].Value;
            sqlConn.Close();
            Response.Redirect("CreateForm.aspx");

        }
    }
}