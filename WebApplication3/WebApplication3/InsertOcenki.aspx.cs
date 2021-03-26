using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;


namespace School
{
    public partial class InsertOcenki : System.Web.UI.Page
    {
        DateTime data;
        public static SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Calendar1.TodaysDate.ToShortDateString();
            if (!IsPostBack)
            {
                string connStr = ConfigurationManager.ConnectionStrings["DatabaseSchoolConnectionString"].ConnectionString;
                con = new SqlConnection();
                con.ConnectionString = connStr;
                con.Open();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {                    
                Label1.Text = (string.Format("{0:D}", Calendar1.SelectedDate.Date.ToShortDateString()));
            if (Label1.Text == "01.01.0001")
                Label1.Text = Calendar1.TodaysDate.ToShortDateString();
            data = Convert.ToDateTime(Label1.Text);

            Response.Write("<script>confirm('Оценка поставлена')</script>");

            SqlCommand command = new SqlCommand("INSERT INTO Ocenki VALUES(@Id_Studend, @Id_Lesson, @Id_Teacher, @Date, @Ocenka, @Id_Klass)", con);
            command.Parameters.AddWithValue("@Id_Studend", DropDownListStudent.SelectedValue);
            command.Parameters.AddWithValue("@Id_Lesson", DropDownListLesson.SelectedValue);
            command.Parameters.AddWithValue("@Id_Teacher", 1);
            command.Parameters.AddWithValue("@Date", data);
            command.Parameters.AddWithValue("@Ocenka", DropDownListOcenka.SelectedValue);
            command.Parameters.AddWithValue("@Id_Klass", DropDownListKlass.SelectedValue);
            command.ExecuteNonQuery();           
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Label1.Text = (string.Format("{0:D}", Calendar1.SelectedDate.Date.ToShortDateString()));
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = false;
        }
    }
}