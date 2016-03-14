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
    public partial class Development : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        String email = Request.QueryString["Email"].ToString();
        SqlCommand cmd = new SqlCommand("FindDev", conn);

        SqlParameter Email = new SqlParameter("@Email", SqlDbType.VarChar);
        Email.Value = email;
        Email.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Email);
        SqlParameter Tname = new SqlParameter("@TeamName", SqlDbType.VarChar);
        Tname.Direction = ParameterDirection.Output;
        Tname.Size = 1;
        cmd.Parameters.Add(Tname);
        SqlParameter c = new SqlParameter("@company", SqlDbType.VarChar);
        c.Size = 1;
        c.Direction = ParameterDirection.Output;
        cmd.Parameters.Add(c);
        SqlParameter fn = new SqlParameter("@found", SqlDbType.DateTime);
        fn.Size = 1;
        fn.Direction = ParameterDirection.Output;
        cmd.Parameters.Add(fn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (rdr.Read())
        {
            string Tnam = rdr.GetString(rdr.GetOrdinal("team_name"));
            string cna = rdr.GetString(rdr.GetOrdinal("company"));
            string fun = "" + rdr.GetDateTime(rdr.GetOrdinal("formation_date"));
            FoundationDate.Text = fun;
            TeamName.Text = Tnam;
            ComanyName.Text = cna;
        }
    }

    protected void Update_Click(object sender, EventArgs e)
    {
        Response.Redirect("DevelopmentUpdate.aspx");
    }
}
}