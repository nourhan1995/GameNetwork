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
    public partial class Add_ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            email_label.Text = Request.QueryString["Parameter1"].ToString();
            theme_label.Text = Request.QueryString["Parameter2"].ToString();
        }

        protected void add_button_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int community_id = Int32.Parse(theme_label.Text);
            SqlCommand cmd = new SqlCommand("Add_Topic", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter comm_id = new SqlParameter("@community_id", SqlDbType.Int);
            SqlParameter email = new SqlParameter("@email", SqlDbType.VarChar);
            SqlParameter title = new SqlParameter("@title", SqlDbType.VarChar);
            SqlParameter description = new SqlParameter("@description", SqlDbType.VarChar);
            comm_id.Value = community_id;
            email.Value = email_label.Text;
            title.Value = title_textBox.Text;
            description.Value = description_textBox.Text;
            cmd.Parameters.Add(email);
            cmd.Parameters.Add(comm_id);
            cmd.Parameters.Add(title);
            cmd.Parameters.Add(description);
            conn.Open();
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            if (i == 1)
                Response.Redirect("Community_Details.aspx?Param="+theme_label.Text+"&Parameter="+email_label.Text);
        }

        protected void title_textBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}