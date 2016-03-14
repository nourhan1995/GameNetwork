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
    public partial class Recommend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string ert = (string)Session["email"];
            SqlCommand cmd = new SqlCommand("IfNU", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@email", ert));

            SqlParameter iff = cmd.Parameters.Add("@if", SqlDbType.Int);
            iff.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();


            if (iff.Value.ToString().Equals("1"))
            {


                SqlCommand cmd2 = new SqlCommand("NormalUser_RecommendsGame", conn);
                cmd2.CommandType = CommandType.StoredProcedure;

                int id2 = Convert.ToInt16(Session["id"]);

                cmd2.Parameters.Add(new SqlParameter("@email", ert));
                cmd2.Parameters.Add(new SqlParameter("@receiver", u2.Text));
                cmd2.Parameters.Add(new SqlParameter("game", id2));
                SqlParameter x = cmd2.Parameters.Add("@x", SqlDbType.Int);
                x.Direction = ParameterDirection.Output;
                conn.Open();
                cmd2.ExecuteNonQuery();
                conn.Close();
                if (x.Value.ToString().Equals("1"))
                {
                    MessageBox.Show("You already recommended this game!");
                }
                else
                {
                    MessageBox.Show("Your recommendation is sent!");
                }




            }
            else
            {
                MessageBox.Show("Only normal users can recommend games!");
            }


        }
    }
}