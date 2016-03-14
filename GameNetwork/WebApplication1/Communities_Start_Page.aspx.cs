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
    public partial class Communities_Start_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            email_label.Text = Request.QueryString["email"];
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("SELECT dbo.Check_Normal_User(@email)", conn);
            SqlParameter email = new SqlParameter("@email", SqlDbType.VarChar);
            email.Value = email_label.Text;
            cmd.Parameters.Add(email);
            conn.Open();
            bool check = (Boolean)cmd.ExecuteScalar();
            conn.Close();
            if (!check)
                create_button.Visible = false;
        }

        protected void Create_Community(object sender, EventArgs e)
        {
            Response.Redirect("Create_Community.aspx?Parameter=" + email_label.Text);
            Server.Transfer("Create_Community.aspx");
        }

        protected void view(object sender, EventArgs e)
        {
            Response.Redirect("View_Communities.aspx?Parameter=" + email_label.Text);
            Server.Transfer("View_Communities.aspx");
        }
    }
}