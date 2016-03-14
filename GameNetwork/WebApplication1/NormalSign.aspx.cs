using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.IO;

namespace WebApplication1
{
    public partial class NormalSign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Update_Click(object sender, EventArgs e)
    {
        string FN = FName.Text;
        string LN = LName.Text;
        String b = BirhtDate.Text;

        DateTime Date = Convert.ToDateTime(b);



        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        String email = Request.QueryString["Email"].ToString();
        SqlCommand cmd = new SqlCommand("SignUpAsNU", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        SqlParameter Fname = new SqlParameter("@first_name", SqlDbType.VarChar);
        Fname.Value = FN;
        Fname.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Fname);
        SqlParameter Mail = new SqlParameter("@email", SqlDbType.VarChar);
        Mail.Value = email;
        Mail.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Mail);
        SqlParameter Lname = new SqlParameter("@last_name", SqlDbType.VarChar);
        Lname.Value = LN;
        Lname.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Lname);
        SqlParameter BD = new SqlParameter("@birth_date", SqlDbType.DateTime);
        BD.Value = Date;
        BD.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(BD);
        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("NormalUser.aspx?Email=" + email);

    }
}
}