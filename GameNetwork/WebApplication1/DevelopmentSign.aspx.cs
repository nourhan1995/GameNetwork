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
    public partial class DevelopmentSign : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void Update_Click(object sender, EventArgs e)
    {
        String email = Request.QueryString["Email"];
        String Tname = TeamName.Text;
        String Cname = CompanyName.Text;
        String Foun = FoudationDate.Text;
        DateTime F = Convert.ToDateTime(Foun);
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();

        SqlCommand cmd = new SqlCommand("SignUpAsDT", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlParameter mail = new SqlParameter("@Email", SqlDbType.VarChar);
        mail.Value = email;
        mail.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(mail);
        SqlParameter Team = new SqlParameter("@team_name", SqlDbType.VarChar);
        Team.Value = Tname;
        Team.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Team);
        SqlParameter cnam = new SqlParameter("@company", SqlDbType.VarChar);
        cnam.Value = Cname;
        cnam.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(cnam);
        SqlParameter fou = new SqlParameter("@formation_date", SqlDbType.DateTime);
        fou.Value = F;
        fou.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(fou);
        cmd.ExecuteNonQuery();
        conn.Close();
        Response.Redirect("Development.aspx?Email=" + email);
    }
}
}