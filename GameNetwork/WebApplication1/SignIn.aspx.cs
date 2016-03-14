using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebApplication1
{
    public partial class SignIn1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RadioButtonList genre = (RadioButtonList)Page.FindControl("gen");
        genre.Items.Add(new ListItem("Sport", "0"));
        genre.Items.Add(new ListItem("Action", "1"));
        genre.Items.Add(new ListItem("RPG", "2"));
        genre.Items.Add(new ListItem("Staretegy", "3"));
        RadioButtonList members = (RadioButtonList)Page.FindControl("Members");
        members.Items.Add(new ListItem("Normal User", "0"));
        members.Items.Add(new ListItem("Development Team", "1"));
        members.Items.Add(new ListItem("Verified Viewer", "2"));
        string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        String email = Email.Text;
        String password = Password.Text;
        SqlCommand cm = new SqlCommand("SELECT dbo.exisFUNC  (@Email)", conn);
        SqlParameter parm = new SqlParameter("@Email", SqlDbType.VarChar);
        parm.Value = email;
        parm.Direction = ParameterDirection.Input;
        cm.Parameters.Add(parm);
        bool check = (Boolean)cm.ExecuteScalar();

        if (IsPostBack)
        {


            if (Password.Text.Equals(ConfirmP.Text) && !Password.Text.Equals(""))
            {



                if (check)
                {
                    string gen = "Sport";
                    if (genre.SelectedIndex == 0)
                    {
                        gen = "Sport";
                    }
                    else
                    {

                        if (genre.SelectedIndex == 1)
                        {
                            gen = "Action";
                        }
                        else
                        {

                            if (genre.SelectedIndex == 2)
                            {
                                gen = "RPG";
                            }
                            else
                            {
                                if (genre.SelectedIndex == 3)
                                {
                                    gen = "Staretegy";
                                }
                            }
                        }

                    }
                    SqlCommand cmd = new SqlCommand("SignUp", conn);
                    SqlParameter parmt = new SqlParameter("@Email", SqlDbType.VarChar);
                    parmt.Value = email;
                    parmt.Direction = ParameterDirection.Input;
                    cmd.Parameters.Add(parmt);
                    SqlParameter par = new SqlParameter("@Password", SqlDbType.VarChar);
                    par.Value = password;
                    par.Direction = ParameterDirection.Input;
                    cmd.Parameters.Add(par);
                    SqlParameter Genr = new SqlParameter("@prefered_game_genre", SqlDbType.VarChar);
                    Genr.Value = gen;
                    Genr.Direction = ParameterDirection.Input;
                    cmd.Parameters.Add(Genr);
                    cmd.CommandType = CommandType.StoredProcedure;


                    cmd.ExecuteNonQuery();

                    if (members.SelectedIndex == 0)
                    {
                        Response.Redirect("NormalSign.aspx?Email=" + email);
                    }
                    else
                    {
                        if (members.SelectedIndex == 1)
                        {
                            Response.Redirect("DevelopmentSign.aspx?Email=" + email);
                        }
                        else
                        {
                            if (members.SelectedIndex == 2)
                            {
                                Response.Redirect("VerifiedSign.aspx?Email=" + email);
                            }
                        }
                    }
                }

                else
                {
                    em.Text = "Already Exiests";

                }

            }

            else
            {
                ComP.Text = "Not A Match";
            }
        }
        conn.Close();
    }

}
}
