using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateForm : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
     //   if (Session["Username"] == null)
     //       Response.Redirect("Register.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection("Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False");
        sqlConn.Open();
        SqlCommand newChar = new SqlCommand("INSERT INTO [Character] (FirstName ,LastName ,Title ,About ,DOB ,Gender ,ImagePath) VALUES (@FName, @LName, @Title, @about, @DOB, @Gender, @ImagPath); SELECT SCOPE_IDENTITY()", sqlConn);
        newChar.Parameters.Add("@FName", SqlDbType.NVarChar, 30, "FirstName");
        newChar.Parameters.Add("@LName", SqlDbType.NVarChar, 30, "LastName");
        newChar.Parameters.Add("@Title", SqlDbType.NVarChar, 30, "Title");
        newChar.Parameters.Add("@about", SqlDbType.NText, 255, "About");
        newChar.Parameters.Add("@DOB", SqlDbType.Date, 3, "DOB");
        newChar.Parameters.Add("@Gender", SqlDbType.NChar, 1, "Gender");
        newChar.Parameters.Add("@ImagPath", SqlDbType.VarChar, 8000 , "ImagePath");
        newChar.Parameters[0].Value = tbFName.Text;
        newChar.Parameters[1].Value = (tbLName.Text == null) ? null : tbLName.Text;
        newChar.Parameters[2].Value = (tbTitle.Text == null) ? null : tbTitle.Text;
        newChar.Parameters[3].Value = (tbAbout.Text == null) ? null : tbAbout.Text;
        newChar.Parameters[4].Value = tbDOB.Text;
        newChar.Parameters[5].Value = RadioButtonList1.SelectedValue;
        newChar.Parameters[6].Value = "~/Images/default.png";

        SqlCommand LoginValues = new SqlCommand("INSERT INTO [Login] (Username, CharacterID) VALUES (@username, @CID)", sqlConn);
        LoginValues.Parameters.Add("@username", SqlDbType.NVarChar, 30, "Username");
        LoginValues.Parameters.Add("@CID", SqlDbType.Int, Int32.MaxValue, "CharacterID");
        LoginValues.Parameters[0].Value = Session["Username"];
        Session["Name"] = newChar.Parameters[0].Value;
        lblAbout.Text = newChar.ExecuteScalar().ToString();
        LoginValues.Parameters[1].Value = (int)newChar.ExecuteScalar();

        Session["LoginCID"] = LoginValues.Parameters[1].Value;
        LoginValues.ExecuteNonQuery();
        if(fulImgUpload.HasFile){
            fulImgUpload.SaveAs(Server.MapPath("Images/" + Session["LoginCID"] + ".png"));
            SqlCommand imagepath = new SqlCommand("UPDATE [Character] SET ImagePath = @imagePath WHERE CharacterID = @CID", sqlConn);
            imagepath.Parameters.Add("@CID", SqlDbType.Int, Int32.MaxValue, "CharacterID");
            imagepath.Parameters.Add("@imagePath", SqlDbType.VarChar, 8000, "ImagePath");
            imagepath.Parameters[0].Value = Session["LoginCID"];
            imagepath.Parameters[1].Value = "~/Images/" + Session["LoginCID"] + ".png";
            imagepath.ExecuteNonQuery();
        }
        sqlConn.Close();
        Response.Redirect("Live Feed.aspx");




    }
}