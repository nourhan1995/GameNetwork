using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace WebApplication1
{

    public partial class Review : System.Web.UI.Page

    {


        protected void Page_Load(object sender, EventArgs e)

        {





            Rev.Text = Request.QueryString["x"].ToString();
            Content.Text = Request.QueryString["y"].ToString();

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("GetComments", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            int id2 = Convert.ToInt16(Session["id"]);
            int id3 = Convert.ToInt32(Request.QueryString["z"].ToString());

            cmd.Parameters.Add(new SqlParameter("@game", id2));
            cmd.Parameters.Add(new SqlParameter("@rev", id3));
            SqlParameter x = cmd.Parameters.Add("@if", SqlDbType.Int);
            x.Direction = ParameterDirection.Output;
            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.Default);

            while (rdr.Read())
            {
                System.Web.UI.WebControls.Button b = new System.Web.UI.WebControls.Button();
                b.Text = "Delete";
                form1.Controls.Add(b);


                System.Web.UI.WebControls.Label l = new System.Web.UI.WebControls.Label();
                form1.Controls.Add(l);

                string content = rdr.GetString(rdr.GetOrdinal("content"));
                string member = rdr.GetString(rdr.GetOrdinal("member"));
                int commID = rdr.GetInt32(rdr.GetOrdinal("comment_ID")); //// <<<<-comment ID
                Session["commID"] = commID.ToString();
                Session["member"] = member;

                l.Text = "'" + content + "'" + " " + " " + "Commented by: " + member + "<br/><br />";

                b.ID = "" + commID;


                b.Click += new EventHandler(this.doit);////// << deleting 



            }



        }




        protected void Button2_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("AddCommentOnGR", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            int id3 = Convert.ToInt32(Request.QueryString["z"].ToString());

            string tt = com.Text;
            string email = (string)(Session["email"]);

            cmd.Parameters.Add(new SqlParameter("@user_email", email));
            cmd.Parameters.Add(new SqlParameter("@game_review_id", id3));
            cmd.Parameters.Add(new SqlParameter("@text", tt));
            SqlParameter i = cmd.Parameters.Add("@id", SqlDbType.Int);
            i.Direction = ParameterDirection.Output;


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect(Request.RawUrl);





        }

        protected void email_TextChanged(object sender, EventArgs e)
        {

        }

        protected void com_TextChanged(object sender, EventArgs e)
        {

        }

        protected void doit(object sender, EventArgs e)

        {




            string ert = (string)Session["email"];
            string member = (string)Session["member"];
            if (member == ert)
            {
                System.Web.UI.WebControls.Button button = (System.Web.UI.WebControls.Button)sender;
                int buttonId = Convert.ToInt32(button.ID);
                string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand cmd2 = new SqlCommand("Delete_my_game_rev_comment", conn);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.Add(new SqlParameter("@email", ert));
                cmd2.Parameters.Add(new SqlParameter("@game_rev_comment", buttonId));

                conn.Open();
                cmd2.ExecuteNonQuery();
                conn.Close();

                Response.Redirect(Request.RawUrl);
            }
            else
            {
                MessageBox.Show("You can not delete this comment!");
            }
        }



    }
}
