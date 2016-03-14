using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Windows.Forms;
namespace WebApplication1
{
    public partial class RatingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }


        protected void submit_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Your ratings is submitted");
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string email = (string)(Session["email"]);
            int i = Convert.ToInt32(I.Text);
            int u = Convert.ToInt32(U.Text);
            int l = Convert.ToInt32(L.Text);
            int g = Convert.ToInt32(G.Text);
            int id3 = Convert.ToInt16(Session["id"]);

            SqlCommand cmd = new SqlCommand("Rate", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@game_id", id3));
            cmd.Parameters.Add(new SqlParameter("@user_email", email));
            cmd.Parameters.Add(new SqlParameter("@rating1", g));
            cmd.Parameters.Add(new SqlParameter("@rating2", l));
            cmd.Parameters.Add(new SqlParameter("@rating3", i));
            cmd.Parameters.Add(new SqlParameter("@rating4", u));


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();



        }

        protected void Button2_Click(object sender, EventArgs e)

        {


            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id4 = Convert.ToInt16(Session["id"]);

            SqlCommand cmd = new SqlCommand("GetRate", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@game_id", id4));
            SqlParameter rate = cmd.Parameters.Add("@rate", SqlDbType.Int);

            rate.Direction = ParameterDirection.Output;
            SqlParameter c = cmd.Parameters.Add("@c", SqlDbType.Int);
            c.Direction = ParameterDirection.Output;



            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Write("The new rating of this game is: " + rate.Value.ToString());

        }

        protected int giveme(int x)
        {
            return x;
        }




    }
}
