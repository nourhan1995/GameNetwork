using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;



namespace WebApplication1
{
    public partial class EnterAGameID : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)

        {


            //form1.Attributes.Add("style", "background-color:#FF5050;");
            form1.Attributes.CssStyle.Add("style", "background:url(/ Web / images / bk.JPEG)");
            //form1.Attributes.CssStyle.Add("background", "url(/ Web / images / bk.JPEG)";
            email_label.Text = Request.QueryString["email"];


        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("gameisthere", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            int iid = Convert.ToInt32(gameid.Text);
            cmd.Parameters.Add(new SqlParameter("@game", iid));
            SqlParameter x = cmd.Parameters.Add("@y", SqlDbType.Int);
            x.Direction = ParameterDirection.Output;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if (x.Value.ToString().Equals("1"))
            {
                MessageBox.Show("This game does not exist in the database!" + "\n" + "Please enter a valid game ID");
            }
            else
            {
                Session["email"] = email_label.Text;
                Session["id"] = gameid.Text.ToString();
                Server.Transfer("GameProfile.aspx");
            }
        }



    }
}

