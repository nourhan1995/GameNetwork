using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class VerifiedSign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void Update_Click(object sender, EventArgs e)
    {
        String Fname = FirstName.Text;
        String Lname = LastName.Text;
        String Year = YearsOf.Text;
        int Years = Convert.ToInt32(Year);
        String email = Request.QueryString["Email"];
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        SqlCommand cmd = new SqlCommand("SignUpAsVR", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter mail = new SqlParameter("@Email", SqlDbType.VarChar);
        mail.Value = email;
        mail.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(mail);
        SqlParameter Fnam = new SqlParameter("@first_name", SqlDbType.VarChar);
        Fnam.Value = Fname;
        Fnam.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Fnam);
        SqlParameter lnam = new SqlParameter("@last_name", SqlDbType.VarChar);
        lnam.Value = Lname;
        lnam.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(lnam);
        SqlParameter year = new SqlParameter("@years_of_exp", SqlDbType.Int);
        year.Value = Year;
        year.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(year);
        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("verified.aspx?Email=" + email);
    }
}
}