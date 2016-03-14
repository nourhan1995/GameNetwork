using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication1
{
    public partial class GameProfile : System.Web.UI.Page

    {

        protected void Page_Load(object sender, EventArgs e)

        {
            form1.Attributes.CssStyle.Add("BACKGROUND-COLOR", "#00FFFF");

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd0 = new SqlCommand("IfVR", conn);

            cmd0.CommandType = CommandType.StoredProcedure;
            string email = (string)(Session["email"]);
            cmd0.Parameters.Add(new SqlParameter("@email", email));
            SqlParameter iff = cmd0.Parameters.Add("@if", SqlDbType.Int);
            iff.Direction = ParameterDirection.Output;
            conn.Open();
            cmd0.ExecuteNonQuery();
            conn.Close();

            if (iff.Value.ToString().Equals("1"))
            {
                revt.Visible = true;
                addrev.Visible = true;
            }

            int id2 = Convert.ToInt16(Session["id"]);

            SqlCommand cmd = new SqlCommand("View_Game_Details", conn);
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.Add(new SqlParameter("@game_id", id2));

            SqlParameter checker = new SqlParameter();
            checker = cmd.Parameters.Add("@checker", SqlDbType.Bit);
            checker.Direction = ParameterDirection.Output;
            SqlParameter iftype = cmd.Parameters.Add("@iftype", SqlDbType.Bit);
            iftype.Direction = ParameterDirection.Output;

            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.Default);
            while (rdr.Read())

            {
                string name = rdr.GetString(rdr.GetOrdinal("name"));
                DateTime release_date = rdr.GetDateTime(rdr.GetOrdinal("release_date"));
                int age = rdr.GetInt32(rdr.GetOrdinal("age_limit"));
                string developer = rdr.GetString(rdr.GetOrdinal("development_team_email"));

                if (rdr.IsDBNull(4))
                {

                    Screenshot.Text = "This game does not have screenshots!";
                    Screenshot.ForeColor = System.Drawing.Color.Red;
                }

                else
                {

                    string ss = rdr.GetString(rdr.GetOrdinal("ScreenShot Describtion"));
                    Screenshot.Text = ss;
                }
                if (rdr.IsDBNull(5))
                {

                    Video.Text = "This game does not have videos!";
                    Video.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    string v = rdr.GetString(rdr.GetOrdinal("Video Describtion"));
                    Video.Text = v;
                }


                Name.Text = name;
                Date.Text = release_date.ToString();
                Age.Text = age.ToString();
                Develop.Text = developer;

            }

            rdr.Close();
            conn.Close();




            SqlCommand cmd2 = new SqlCommand("getGameType", conn);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.Add(new SqlParameter("@game_id", id2));
            SqlParameter type = cmd2.Parameters.Add("@type", SqlDbType.NVarChar);
            type.Direction = ParameterDirection.Output;
            type.Size = 15;
            conn.Open();
            cmd2.ExecuteNonQuery();
            conn.Close();
            Type.Text = type.Value.ToString();


            SqlCommand cmd3 = new SqlCommand("GetRate", conn);
            cmd3.CommandType = CommandType.StoredProcedure;
            cmd3.Parameters.Add(new SqlParameter("@game_id", id2));
            SqlParameter rate = cmd3.Parameters.Add("@rate", SqlDbType.Int);
            rate.Direction = ParameterDirection.Output;
            SqlParameter c = cmd3.Parameters.Add("@c", SqlDbType.Int);
            c.Direction = ParameterDirection.Output;
            conn.Open();
            cmd3.ExecuteNonQuery();
            conn.Close();
            if (c.Value.ToString().Equals("1"))
            {
                Rating.Text = "No ratings submitted for this game!";
                Rating.ForeColor = System.Drawing.Color.Red;
            }
            else

                Rating.Text = rate.Value.ToString();


            SqlCommand cmd4 = new SqlCommand("GetGameRev", conn);
            cmd4.CommandType = CommandType.StoredProcedure;
            cmd4.Parameters.Add(new SqlParameter("game_id", id2));
            SqlParameter check = new SqlParameter();
            check = cmd4.Parameters.Add("@checker", SqlDbType.Bit);
            check.Direction = ParameterDirection.Output;
            conn.Open();




            SqlDataReader rdr2 = cmd4.ExecuteReader(CommandBehavior.CloseConnection);
            /* if (check.Value.ToString().Equals("1"))

             {


                 ll.Text = "No reviews for this game!";

             }
             else
             {*/

            while (rdr2.Read())
            {


                string r = rdr2.GetString(rdr2.GetOrdinal("Reviewer"));
                string content = rdr2.GetString(rdr2.GetOrdinal("Content"));
                int revid = rdr2.GetInt32(rdr2.GetOrdinal("ID"));
                HyperLink l = new HyperLink();
                l.Text = r + "<br/><br />";

                form1.Controls.Add(l);
                l.NavigateUrl = "Review.aspx?x=" + r + "&y=" + content + "&z=" + revid;


            }
            rdr2.Close();

            conn.Close();








        }

        protected void rate_Click(object sender, EventArgs e)
        {
            Response.Redirect("RatingPage.aspx");
        }

        protected void recommend_Click(object sender, EventArgs e)
        {
            Response.Redirect("Recommend.aspx");

        }

        protected void addrev_Click(object sender, EventArgs e)

        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id2 = Convert.ToInt32(Session["id"]);
            string email = (string)Session["email"];
            string textt = revt.Text.ToString();
            SqlCommand cmd2 = new SqlCommand("AddReview", conn);
            cmd2.CommandType = CommandType.StoredProcedure;
            cmd2.Parameters.Add(new SqlParameter("@user_email", email));
            cmd2.Parameters.Add(new SqlParameter("@game", id2));
            cmd2.Parameters.Add(new SqlParameter("@review", textt));
            conn.Open();
            cmd2.ExecuteNonQuery();
            conn.Close();

            Response.Redirect(Request.RawUrl);

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}