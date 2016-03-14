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
    public partial class WebForm1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SIGN_Click(object sender, EventArgs e)
    {
        Response.Redirect("SignIn.aspx");
    }

    protected void LogIn_Click(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        String email = Email.Text;
        String password = Password.Text;
        SqlCommand cm = new SqlCommand("SELECT dbo.FUNCN (@Email ,@Password)", conn);
        SqlParameter parm = new SqlParameter("@Email", SqlDbType.VarChar);
        parm.Value = email;
        parm.Direction = ParameterDirection.Input;
        cm.Parameters.Add(parm);
        SqlParameter p = new SqlParameter("@Password", SqlDbType.VarChar);
        p.Value = password;
        p.Direction = ParameterDirection.Input;
        cm.Parameters.Add(p);
        bool check = (Boolean)cm.ExecuteScalar();
        if (check)
        {
            SqlCommand N = new SqlCommand("SELECT dbo.FindN  (@Email )", conn);
            SqlParameter e1 = new SqlParameter("@Email", SqlDbType.VarChar);
            e1.Value = email;
            e1.Direction = ParameterDirection.Input;
            N.Parameters.Add(e1);

            bool check1 = (Boolean)N.ExecuteScalar();
            if (check1)
            {
                Response.Redirect("NormalUser.aspx?email=" + email);
            }
            else
            {
                SqlCommand v = new SqlCommand("SELECT dbo.Findv  (@Email )", conn);
                SqlParameter e2 = new SqlParameter("@Email", SqlDbType.VarChar);
                e2.Value = email;
                ////e2.Direction = ParameterDirection.Input;
                v.Parameters.Add(e2);

                bool check2 = (Boolean)v.ExecuteScalar();
                if (check2)
                {
                    Response.Redirect("verified.aspx?email=" + email);
                }
                else
                {
                    SqlCommand D = new SqlCommand("SELECT dbo.FindD   (@Email )", conn);
                    SqlParameter e3 = new SqlParameter("@Email", SqlDbType.VarChar);
                    e3.Value = email;
                    e3.Direction = ParameterDirection.Input;
                    D.Parameters.Add(e3);

                    // bool check3 = (Boolean)v.ExecuteScalar();
                    // if (check3)
                    // {
                    Response.Redirect("Development.aspx?email=" + email);
                    //}
                }
            }
        }
        else
        {
            info.Text = "Wrong Info!!!";
        }

    }
}
}