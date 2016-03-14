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
    public partial class Requests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        String email = Request.QueryString["email"];
        SqlCommand cmd = new SqlCommand("request", conn);
        SqlParameter Email = new SqlParameter("@Email", SqlDbType.VarChar);
        Email.Value = email;
        Email.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Email);
        cmd.CommandType = CommandType.StoredProcedure;

        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (rdr.Read())
        {
            string em1 = rdr.GetString(rdr.GetOrdinal("email1"));


            HyperLink em = new HyperLink();
            em.NavigateUrl = "Accept";
            em.Text = em1;
            form1.Controls.Add(em);
            Button accept = new Button();
            accept.ID = em1;
            accept.Text = "Accept";
            accept.Click += new EventHandler(accept_Click);
            Button reject = new Button();
            reject.Text = "Reject";
            reject.Click += new EventHandler(reject_Click);
            form1.Controls.Add(accept);
            form1.Controls.Add(reject);



        }
    }
    protected void accept_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        String ema = b.ID;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("NormalUser_RespondToReq", conn);
        String email = Request.QueryString["email"];
        SqlParameter Email = new SqlParameter("@email", SqlDbType.VarChar);
        Email.Value = email;
        Email.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Email);
        SqlParameter Ema = new SqlParameter("@friendEmail", SqlDbType.VarChar);
        Ema.Value = ema;
        Ema.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Ema);
        SqlParameter acc = new SqlParameter("@accept", SqlDbType.Bit);
        acc.Value = 1;
        acc.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(acc);
        cmd.CommandType = CommandType.StoredProcedure;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        b.Visible = false;


    }
    protected void reject_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        String ema = b.ID;
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("NormalUser_RespondToReq", conn);
        String email = Request.QueryString["e"];
        SqlParameter Email = new SqlParameter("@Email", SqlDbType.VarChar);
        Email.Value = email;
        Email.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Email);
        SqlParameter Ema = new SqlParameter("@friendEmail", SqlDbType.VarChar);
        Ema.Value = ema;
        Ema.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Ema);
        SqlParameter acc = new SqlParameter("@accept", SqlDbType.VarChar);
        acc.Value = 0;
        acc.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(acc);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.ExecuteNonQuery();
        conn.Close();

    }
}
}