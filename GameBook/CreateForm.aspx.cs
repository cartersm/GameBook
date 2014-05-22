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
        if (Session["Username"] == null)
            Response.Redirect("Register.aspx");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
    protected void btnCreate_Click(object sender, EventArgs e)
    {
        SqlConnection sqlConn = new SqlConnection("Server=titan.csse.rose-hulman.edu;Database=GameBook;User ID=finkac;Password=password;Trusted_Connection=False");
        sqlConn.Open();
        SqlCommand newChar = new SqlCommand();
        newChar.Connection = sqlConn;
        newChar.CommandType = CommandType.StoredProcedure;
        newChar.CommandText = "Create_Character_Profile";

       // SqlCommand newChar = new SqlCommand("INSERT INTO [Character] (FirstName ,LastName ,Title ,About ,DOB ,Gender ,ImagePath) VALUES (@FName, @LName, @Title, @about, @DOB, @Gender, @ImagPath); SELECT SCOPE_IDENTITY()", sqlConn);
        newChar.Parameters.Add("@FName", SqlDbType.NVarChar, 30, "FirstName").Direction = ParameterDirection.Input;
        newChar.Parameters.Add("@LName", SqlDbType.NVarChar, 30, "LastName").Direction = ParameterDirection.Input;
        newChar.Parameters.Add("@Title", SqlDbType.NVarChar, 30, "Title").Direction = ParameterDirection.Input;
        newChar.Parameters.Add("@about", SqlDbType.NText, 255, "About").Direction = ParameterDirection.Input;
        newChar.Parameters.Add("@DOB", SqlDbType.Date, 3, "DOB").Direction = ParameterDirection.Input;
        newChar.Parameters.Add("@Gender", SqlDbType.NChar, 1, "Gender").Direction = ParameterDirection.Input;
        newChar.Parameters.Add("@ImagPath", SqlDbType.VarChar, 8000 , "ImagePath").Direction = ParameterDirection.Input;
        newChar.Parameters[0].Value = tbFName.Text;
        newChar.Parameters[1].Value = (tbLName.Text == null) ? null : tbLName.Text;
        newChar.Parameters[2].Value = (tbTitle.Text == null) ? null : tbTitle.Text;
        newChar.Parameters[3].Value = (tbAbout.Text == null) ? null : tbAbout.Text;
        newChar.Parameters[4].Value = tbDOB.Text;
        newChar.Parameters[5].Value = RadioButtonList1.SelectedValue;
        newChar.Parameters[6].Value = "~/Images/default.png";
        
        
        SqlCommand LoginValues = new SqlCommand();
        LoginValues.Connection = sqlConn;
        LoginValues.CommandType = CommandType.StoredProcedure;
        LoginValues.CommandText = "Create_Login";
        //SqlCommand LoginValues = new SqlCommand("INSERT INTO [Login] (Username, CharacterID) VALUES (@username, @CID)", sqlConn);
        LoginValues.Parameters.Add("@username", SqlDbType.NVarChar, 30, "Username").Direction = ParameterDirection.Input;
        LoginValues.Parameters.Add("@CID", SqlDbType.Int, Int32.MaxValue, "CharacterID").Direction = ParameterDirection.Input;
        LoginValues.Parameters[0].Value = Session["Username"];
        Session["Name"] = newChar.Parameters[0].Value;
        
        LoginValues.Parameters[1].Value = int.Parse(newChar.ExecuteScalar().ToString());
        Session["LoginCID"] = LoginValues.Parameters[1].Value;
        
       // SqlCommand rescue = new SqlCommand();
       // rescue.Connection = sqlConn;
       // rescue.CommandType = CommandType.StoredProcedure;
       // rescue.CommandText = "Create_Rescue";
       //// SqlCommand rescue = new SqlCommand("INSERT INTO [Rescue] (Hero, Damsel, Rescue_Status) VALUES ( @currUser, @currUser, 1)", sqlConn);
       // rescue.Parameters.Add("@Hero", SqlDbType.Int, Int32.MaxValue, "Hero").Direction = ParameterDirection.Input;
       // rescue.Parameters.Add("@Damsel", SqlDbType.Int, Int32.MaxValue, "Damsel").Direction = ParameterDirection.Input;
       // rescue.Parameters.Add("@Rescue_Status", SqlDbType.Int, Int32.MaxValue, "Rescue_Status").Value = 1;        
       // rescue.Parameters[0].Value = Session["LoginCID"];
       // rescue.Parameters[1].Value = Session["LoginCID"];
       // rescue.ExecuteNonQuery();
        
        LoginValues.ExecuteNonQuery();
        if(fulImgUpload.HasFile){
            fulImgUpload.SaveAs(Server.MapPath("Images/" + Session["LoginCID"] + ".png"));
            SqlCommand imagepath = new SqlCommand();
            imagepath.Connection = sqlConn;
            imagepath.CommandType = CommandType.StoredProcedure;
            imagepath.CommandText = "Update_Image";
            //SqlCommand imagepath = new SqlCommand("UPDATE [Character] SET ImagePath = @imagePath WHERE CharacterID = @CID", sqlConn);
            imagepath.Parameters.Add("@CID", SqlDbType.Int, Int32.MaxValue, "CharacterID").Direction = ParameterDirection.Input;
            imagepath.Parameters.Add("@imagePath", SqlDbType.VarChar, 8000, "ImagePath").Direction = ParameterDirection.Input;
            imagepath.Parameters[0].Value = Session["LoginCID"];
            imagepath.Parameters[1].Value = "~/Images/" + Session["LoginCID"] + ".png";
            imagepath.ExecuteNonQuery();
        }
        sqlConn.Close();
        Response.Redirect("Live Feed.aspx");
    }
}