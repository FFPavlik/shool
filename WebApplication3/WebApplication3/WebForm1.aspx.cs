using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Microsoft.Reporting.WebForms;

namespace School
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public static SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DatabaseSchoolConnectionString"].ConnectionString;
            con = new SqlConnection();
            con.ConnectionString = connStr;
            con.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ReportViewer1.LocalReport.ReportPath = "Report2.rdlc";
            ReportViewer1.LocalReport.DataSources.Clear();

            ReportDataSource rds = new ReportDataSource();
            rds.Name = "DataSet1";
            SqlDataAdapter da = new SqlDataAdapter("select concat( Students.Surname, ' ', Students.name, ' ', Students.MiddleName) as Surname," +
                                                       "Lessons.Lesson, case when count(Ocenki.Ocenka) = 0 then null else count( Ocenki.Ocenka) end as Ocenka " +
                                                  "from StudentAndKlass " +
                                                      "full outer join LessonsAndKlass on StudentAndKlass.ID_Klass = LessonsAndKlass.ID_Klass " +
                                                      "full outer join Ocenki on Ocenki.ID_Klass = StudentAndKlass.ID_Klass " +
                                                            "and StudentAndKlass.ID_Sdudents = Ocenki.Id_Sdunent " +
                                                            "and LessonsAndKlass.ID_Lesson = Ocenki.Id_Lesson " +
                                                      "inner join Students on StudentAndKlass.ID_Sdudents = Students.Id_Studend " +
                                                      "inner join Lessons on LessonsAndKlass.ID_Lesson = Lessons.ID_Lessons " +
                                                  " where StudentAndKlass.ID_Klass = " + DropDownList1.SelectedValue +
                                                      " and (Ocenki.Ocenka is null or Ocenka = 99) " +
                                                  "group  by  Students.Surname, Students.name, Students.MiddleName, Lessons.Lesson", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rds.Value = dt;
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
        }
    }
}