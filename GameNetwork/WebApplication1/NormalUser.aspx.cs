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
    public partial class NormalUser : System.Web.UI.Page
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
        SqlParameter Fname = new SqlParameter("@FirstName", SqlDbType.VarChar);
        Fname.Direction = ParameterDirection.Output;
        Fname.Size = 1;

        cmd.Parameters.Add(Fname);
        SqlParameter lname = new SqlParameter("@lastName", SqlDbType.VarChar);
        lname.Size = 1;

        lname.Direction = ParameterDirection.Output;
        cmd.Parameters.Add(lname);
        SqlParameter bd = new SqlParameter("@B", SqlDbType.DateTime);
        bd.Direction = ParameterDirection.Output;
        bd.Size = 1;

        cmd.Parameters.Add(bd);
        SqlParameter Ag = new SqlParameter("@age", SqlDbType.Int);
        Ag.Size = 1;

        Ag.Direction = ParameterDirection.Output;
        cmd.Parameters.Add(Ag);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (rdr.Read())
        {
            string Fnam = rdr.GetString(rdr.GetOrdinal("first_name"));
            string Lname = rdr.GetString(rdr.GetOrdinal("last_name"));


            String d = "" + rdr.GetDateTime(rdr.GetOrdinal("date_of_birth"));
            Birthday.Text = d;
            string A = "" + rdr.GetInt32(rdr.GetOrdinal("age"));
            Age.Text = A;


            FName.Text = Fnam;
            LName.Text = Lname;





        }

    }

    protected void Se_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Update_Click(object sender, EventArgs e)
    {

        String email = Request.QueryString["email"];
        Response.Redirect("NormalUpdate.aspx?email=" + email);
    }

    protected void FriendR_Click(object sender, EventArgs e)
    {
        String email = Request.QueryString["email"];
        Response.Redirect("Requests.aspx?email=" + email);
    }

        protected void games_button_click(object sender, EventArgs e)
        {
            String email = Request.QueryString["email"];
            Response.Redirect("EnterAGameID.aspx?email=" + email);
        }

        protected void community_button_click(object sender, EventArgs e)
        {
            String email = Request.QueryString["email"];
            Response.Redirect("Communities_Start_Page.aspx?email=" + email);
        }

        protected void conferences_button_click(object sender, EventArgs e)
        {
            String email = Request.QueryString["email"];
            Response.Redirect("AllConfs.aspx?email=" + email);
        }
    }
}