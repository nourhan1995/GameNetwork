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
    public partial class NormalUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Update_Click(object sender, EventArgs e)
    {
        String email = Request.QueryString["email"];
        String Fn = FName.Text;
        String Ln = LName.Text;
        String bi = BirhtDate.Text;
        DateTime Birth = Convert.ToDateTime(bi);
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        conn.Open();
        SqlCommand cmd = new SqlCommand("NormalUser_UpdateInfo", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter mail = new SqlParameter("@email", SqlDbType.VarChar);
        mail.Value = email;
        mail.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(mail);
        SqlParameter Fna = new SqlParameter("@first_name", SqlDbType.VarChar);
        Fna.Direction = ParameterDirection.Input;
        Fna.Value = Fn;
        cmd.Parameters.Add(Fna);
        SqlParameter lna = new SqlParameter("@last_name", SqlDbType.VarChar);
        lna.Value = Ln;
        lna.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(lna);
        SqlParameter bir = new SqlParameter("@date_of_birth", SqlDbType.DateTime);
        bir.Direction = ParameterDirection.Input;
        bir.Value = bi;
        cmd.Parameters.Add(bir);
        Response.Write(Fn);
        Response.Write(Ln);
        Response.Write(bi);
        cmd.ExecuteNonQuery();
        conn.Close();
        //Response.Redirect("NormalUser.aspx?Email=" + email);
    }
}
}