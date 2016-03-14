using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class VerifiedProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String email = Request.QueryString["Email"];
        string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["MyDbConnection"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        SqlCommand cmd = new SqlCommand("Findver", conn);

        SqlParameter Email = new SqlParameter("@Email", SqlDbType.VarChar);
        Email.Value = email;
        Email.Direction = ParameterDirection.Input;
        cmd.Parameters.Add(Email);
        SqlParameter Fnam = new SqlParameter("@FirstName", SqlDbType.VarChar);
        Fnam.Direction = System.Data.ParameterDirection.Output;
        Fnam.Size = 1;
        cmd.Parameters.Add(Fnam);
        SqlParameter Lnam = new SqlParameter("@LastName", SqlDbType.VarChar);
        Lnam.Direction = System.Data.ParameterDirection.Output;
        Lnam.Size = 1;
        cmd.Parameters.Add(Lnam);
        SqlParameter year = new SqlParameter("@year", SqlDbType.Int);
        year.Direction = System.Data.ParameterDirection.Output;
        year.Size = 1;
        cmd.Parameters.Add(year);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        SqlDataReader rdr = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
        while (rdr.Read())
        {
            string fname = rdr.GetString(rdr.GetOrdinal("first_name"));
            string lname = rdr.GetString(rdr.GetOrdinal("last_name"));



            string y = "" + rdr.GetInt32(rdr.GetOrdinal("years_of_experience"));
            YearsOf.Text = y;
            FirstName.Text = fname;
            LastName.Text = lname;





        }


    }
}
}