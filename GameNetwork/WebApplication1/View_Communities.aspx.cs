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
    public partial class View_Communities : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            email_label.Text = Request.QueryString["Parameter"].ToString();
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("View_All_Communities", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int theme = rdr.GetInt32(rdr.GetOrdinal("theme"));
                String name = rdr.GetString(rdr.GetOrdinal("name"));
                Label theme_label = new Label();
                Label name_label = new Label();
                Label tmp = new Label();
                Button view_button = new Button();
                view_button.Text = "View  ";
                view_button.ID = theme+"";
                view_button.Click += new EventHandler(View_Community);
                theme_label.Text = ""+theme ;
                theme_label.Visible = false;
                name_label.Text = name + "   ";
                tmp.Text = "  <br /> <br />";
                form1.Controls.Add(theme_label);
                form1.Controls.Add(name_label);
                form1.Controls.Add(view_button);
                form1.Controls.Add(tmp);
            }
        }
        protected void View_Community(Object sender, EventArgs e)
        {
            Button b = (Button)sender;
            Response.Redirect("Community_Details.aspx?Parameter=" + email_label.Text+"&Param="+b.ID);
        }
    }
}