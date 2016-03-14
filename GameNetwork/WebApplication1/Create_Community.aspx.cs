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
    public partial class Create_Community : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            email_label.Text = Request.QueryString["Parameter"].ToString();
        }

        protected void submit_button_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("NormalUser_RequestToCreateCommunity", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            int i = 0;
            String email = email_label.Text;
            String name = name_textBox.Text;
            String description = description_textBox.Text;
            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@name", name));
            cmd.Parameters.Add(new SqlParameter("@description", description));
            conn.Open();
            i = cmd.ExecuteNonQuery();
            conn.Close();
            if (i == 1)
            {
                Server.Transfer("Communities_Start_Page.aspx");
            }
            else
                confirm_submit.Text = "Make sure you are a normal user, and that all the fields are not empty. !!!";
        }
    }
}