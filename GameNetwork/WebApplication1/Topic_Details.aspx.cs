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
    public partial class Topic_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            email_label.Text = Request.QueryString["email"].ToString();
            int topic_id = Int32.Parse(Request.QueryString["topic_id"].ToString());
            topic.Text = topic_id + "";
            community.Text = Request.QueryString["community_id"].ToString();
            int community_id = Int32.Parse(community.Text);
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("View_Topic_Details",conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@topic_id", topic_id));
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            while (rdr.Read())
            {
                title_label.Text = rdr.GetString(rdr.GetOrdinal("title"));
                author_topic_email.Text = rdr.GetString(rdr.GetOrdinal("member_ID"));
                description_label.Text = rdr.GetString(rdr.GetOrdinal("describe"));
            }
            conn.Close();
            SqlCommand cmd1 = new SqlCommand("View_Comments_Of_a_Topic", conn);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.Add(new SqlParameter("@topic_id", topic_id));
            conn.Open();
            SqlDataReader rdr2 = cmd1.ExecuteReader();
            while (rdr2.Read())
            {
                int comment_id = rdr2.GetInt32(rdr2.GetOrdinal("comment_ID"));
                HyperLink author_email = new HyperLink();
                Button delete_comment = new Button();
                delete_comment.ID = comment_id + "";
                delete_comment.Click += new EventHandler(Delete_Comment);
                delete_comment.Text = "Delete Comment";
                Label content_label = new Label();
                Label date_label = new Label();
                author_email.Text = rdr2.GetString(rdr2.GetOrdinal("member_ID")) + ":  ";
                content_label.Text = rdr2.GetString(rdr2.GetOrdinal("content")) + "  ";
                date_label.Text = "  " + rdr2.GetDateTime(rdr2.GetOrdinal("date_of_comment")) + "  <br /> <br />";
                form1.Controls.Add(author_email);
                form1.Controls.Add(content_label);
                form1.Controls.Add(delete_comment);
                form1.Controls.Add(date_label);
            }
            conn.Close();
            SqlCommand cmd2 = new SqlCommand("SELECT dbo.Check_member_of_community(@email, @theme)", conn);
            SqlParameter email = new SqlParameter("@email", SqlDbType.VarChar);
            email.Value = email_label.Text;
            SqlParameter community_theme = new SqlParameter("@theme", SqlDbType.Int);
            community_theme.Value = community_id;
            cmd2.Parameters.Add(email);
            cmd2.Parameters.Add(community_theme);
            conn.Open();
            bool isMember = (Boolean)cmd2.ExecuteScalar();
            conn.Close();
            if (isMember)
            {
                SqlCommand cmd3 = new SqlCommand("SELECT dbo.Check_same_email(@useremail, @authoremail)", conn);
                SqlParameter email1 = new SqlParameter("@useremail", SqlDbType.VarChar);
                SqlParameter email2 = new SqlParameter("@authoremail", SqlDbType.VarChar);
                email1.Value = email_label.Text;
                email2.Value = author_topic_email.Text;
                cmd3.Parameters.Add(email1);
                cmd3.Parameters.Add(email2);
                conn.Open();
                bool equal = (Boolean)cmd3.ExecuteScalar();
                conn.Close();
                if (equal)
                {
                    delete_button.Visible = true;
                    add_comment_button.Visible = true;
                }
                else
                {
                    delete_button.Visible = false;
                    add_comment_button.Visible = true;
                }
            }
            else
            {
                delete_button.Visible = false;
                add_comment_button.Visible = false;
            }
        }

        protected void delete_button_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("DeleteTopic", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@topic_id",topic.Text));
            cmd.Parameters.Add(new SqlParameter("@user_email", email_label.Text));
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            if(i == 1)
            {
                Response.Redirect("Community_Details.aspx?Param=" + community.Text + "&Parameter=" + email_label.Text);
            }
        }

        protected void Delete_Comment(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("SELECT dbo.Get_email(@comment_id)", conn);
            cmd.Parameters.Add(new SqlParameter("@comment_id", Int32.Parse(b.ID)));
            conn.Open();
            String email = (String)cmd.ExecuteScalar();
            conn.Close();
            SqlCommand cmd3 = new SqlCommand("SELECT dbo.Check_same_email(@useremail, @authoremail)", conn);
            SqlParameter email1 = new SqlParameter("@useremail", SqlDbType.VarChar);
            SqlParameter email2 = new SqlParameter("@authoremail", SqlDbType.VarChar);
            email1.Value = email_label.Text;
            email2.Value = email;
            cmd3.Parameters.Add(email1);
            cmd3.Parameters.Add(email2);
            conn.Open();
            bool equal = (Boolean)cmd3.ExecuteScalar();
            conn.Close();
            if (equal)
            {
                SqlCommand cmd1 = new SqlCommand("Delete_my_Topic_rev_comment", conn);
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add(new SqlParameter("@email", email_label.Text));
                cmd1.Parameters.Add(new SqlParameter("@topic", topic.Text));
                cmd1.Parameters.Add(new SqlParameter("@comment_id", Int32.Parse(b.ID)));
                conn.Open();
                int i = cmd1.ExecuteNonQuery();
                conn.Close();
                if(i == 1)
                {
                    Response.Redirect("Topic_Details.aspx?email=" + email_label.Text + "&topic_id=" + topic.Text + "&community_id=" + community.Text);
                    confirm_label.Text = "";
                }
            }
            else
            {
                confirm_label.Text = "Sorry you can't delete this comment!!";
            }
        }

        protected void add_comment_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Topic_Comment.aspx?email=" + email_label.Text + "&community_id=" + community.Text + "&topic_id=" + topic.Text);
        }
    }
}