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
    public partial class Community_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // theme_label.Text = (String)Session["theme"];
            String theme = Request.QueryString["Param"].ToString();
            theme_label.Text = theme;
            theme_label.Visible = false;
            int theme_id = Int32.Parse(theme);
            email_label.Text = Request.QueryString["Parameter"].ToString();
            //Session["email"] = email_label.Text;
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd1 = new SqlCommand("View_a_community", conn);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.Add(new SqlParameter("@theme", theme_id));
            conn.Open();
            SqlDataReader rdr1 = cmd1.ExecuteReader();
            while (rdr1.Read())
            {
                name_label.Text = rdr1.GetString(rdr1.GetOrdinal("name"));
                name_label.Visible = true;
                description_label.Text = rdr1.GetString(rdr1.GetOrdinal("describe"));
                description_label.Visible = true;
            }
            conn.Close();
            SqlCommand cmd2 = new SqlCommand("SELECT dbo.Check_member_of_community(@email, @theme)", conn);
            SqlParameter email = new SqlParameter("@email", SqlDbType.VarChar);
            email.Value = email_label.Text;
            SqlParameter community_theme = new SqlParameter("@theme", SqlDbType.Int);
            community_theme.Value = theme_id;
            cmd2.Parameters.Add(email);
            cmd2.Parameters.Add(community_theme);
            conn.Open();
            bool isMember = (Boolean)cmd2.ExecuteScalar();
            conn.Close();
            if (isMember)
            {
                join_button.Visible = false;
                add_topic.Visible = true;
            }
            else
            {
                join_button.Visible = true;
                add_topic.Visible = false;
            }
            SqlCommand cmd3 = new SqlCommand("Topics_of_a_community", conn);
            cmd3.CommandType = CommandType.StoredProcedure;
            cmd3.Parameters.Add(new SqlParameter("@theme", theme_id));
            conn.Open();
            SqlDataReader rdr3 = cmd3.ExecuteReader();
            while (rdr3.Read())
            {
                int topic_id = rdr3.GetInt32(rdr3.GetOrdinal("topic_ID"));
                HyperLink topic_link = new HyperLink();
                topic_link.ID = topic_id + "";
                topic_link.NavigateUrl = "Topic_Details.aspx?topic_id="+topic_link.ID+"&community_id="+theme+"&email="+email_label.Text;
                topic_link.Text = rdr3.GetString(rdr3.GetOrdinal("title"))+"  <br/> <br/>";
                form1.Controls.Add(topic_link);
            }
            conn.Close();
        }

        protected void join_button_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("Join_Community", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter emailP = new SqlParameter("@email", SqlDbType.VarChar, 50);
            emailP.Value = email_label.Text.ToString();
            cmd.Parameters.AddWithValue("@email",email_label.Text.ToString());
            //cmd.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar,50, email_label.Text.ToString()));
            //email.Value =
           
            SqlParameter id = new SqlParameter("@community_id", SqlDbType.Int);
            id.Value = Int32.Parse(theme_label.Text);
            //(email);
            cmd.Parameters.Add(id);
            //Response.Write(cmd.Parameters["@email"].Value.ToString());
            //Response.Write(id.Value);
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            if (i == 1)
            {
                    join_button.Visible = false;
                    add_topic.Visible = true;
            }
        }

        protected void add_topic_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Topic.aspx?Parameter1="+email_label.Text+"&Parameter2="+theme_label.Text);
        }
    }
}