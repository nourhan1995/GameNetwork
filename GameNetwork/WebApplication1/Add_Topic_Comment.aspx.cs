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
    public partial class Add_Topic_Comment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            email_label.Text = Request.QueryString["email"].ToString();
            topic_label.Text = Request.QueryString["topic_id"].ToString();
            community_label.Text = Request.QueryString["community_id"].ToString();
        }

        protected void add_button_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("AddCommentOnCT", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@user_email", email_label.Text));
            cmd.Parameters.Add(new SqlParameter("@topic_ID", Int32.Parse(topic_label.Text)));
            cmd.Parameters.Add(new SqlParameter("@comment", comment_textBox.Text));
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            if(i == 1)
            {
                Response.Redirect("Topic_Details.aspx?email=" + email_label.Text + "&topic_id=" + topic_label.Text + "&community_id=" + community_label.Text);
            }
        }
    }
}