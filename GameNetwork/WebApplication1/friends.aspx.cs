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
    public partial class friends : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        String email = Request.QueryString["email"];
        SqlCommand cmd = new SqlCommand("FindNormal", conn);

        SqlParameter Email = new SqlParameter("@Email", SqlDbType.VarChar);
        Email.Value = email;
        Email.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Email);

    }
}
}