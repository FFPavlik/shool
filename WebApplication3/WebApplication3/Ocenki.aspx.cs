using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
using System.Configuration;

namespace School
{
    public partial class Ocenki : System.Web.UI.Page
    {
        BoundField field;
        SqlConnection con;
        SqlDataReader reader;
        float Summa = 0;
        float Count = 0;
        int Propusk = 0;
        float SrBall = 0;
        string student = null;
        int month;
        int days;
        int year;
        DateTime datatime = new DateTime();

        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DatabaseSchoolConnectionString"].ConnectionString;
            con = new SqlConnection();
            con.ConnectionString = connStr;
            con.Open();

            if (!IsPostBack)
            {
                for (int i = 0; i < DropDownListMonth.Items.Count; i++)
                {
                    if (DropDownListMonth.Items[i].Text == DateTime.Now.Month.ToString())
                    {
                        DropDownListMonth.ClearSelection();
                        DropDownListMonth.Items[i].Selected = true;
                    }
                }
            }
            print_table();
        }

        void print_table()
        {
            GridView1.Font.Size = 14;
            GridView1.Columns[0].ItemStyle.ForeColor = System.Drawing.Color.Black;

            month = Convert.ToInt16(DropDownListMonth.Text);
            days = DateTime.DaysInMonth(2021, month);
            year = datatime.Year;

            int count_colums = GridView1.Columns.Count;

            if (IsPostBack)
            {
                for (int i = 1; i < count_colums; i++)
                    GridView1.Columns.RemoveAt(1);
            }

            for (int i = 1; i < days + 1; i++)
            {
                field = new BoundField();
                GridView1.Columns.Add(field);
                field.HeaderText = i.ToString();
                GridView1.Columns[i].ItemStyle.HorizontalAlign = HorizontalAlign.Center;
                GridView1.Columns[i].HeaderStyle.Font.Bold = false;
                GridView1.Columns[i].HeaderStyle.ForeColor = System.Drawing.Color.Black;
                GridView1.Columns[i].ItemStyle.Width = 25;
            }

            field = new BoundField();
            field.HeaderText = "Средний бал";
            field.HeaderStyle.Font.Bold = false;
            field.HeaderStyle.ForeColor = System.Drawing.Color.Black;
            field.ItemStyle.Width = 25;
            field.ItemStyle.ForeColor = System.Drawing.Color.Black;
            field.ItemStyle.HorizontalAlign = HorizontalAlign.Right;
            GridView1.Columns.Add(field);

            field = new BoundField();
            field.HeaderText = "Пропусков";
            field.HeaderStyle.Font.Bold = false;
            field.HeaderStyle.ForeColor = System.Drawing.Color.Black;
            field.ItemStyle.Width = 25;
            field.ItemStyle.ForeColor = System.Drawing.Color.Black;
            field.ItemStyle.HorizontalAlign = HorizontalAlign.Right;
            GridView1.Columns.Add(field);
        }

        protected void GridView1_DataBinding(object sender, EventArgs e)
        {

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    print(e);
                }
        }

        void print(GridViewRowEventArgs e)
        {
            Summa = 0;
            Count = 0;
            SrBall = 0;
            Propusk = 0;

            if (DropDownList3.SelectedValue != "")
                student = DropDownList3.SelectedValue;
            else student = "1";

            for (int i = 1; i < GridView1.Columns.Count - 2; i++)
            {
                string data = (string.Format(month + "." + GridView1.Columns[i].HeaderText) + ".2021");
                SqlCommand cmd = new SqlCommand("Select ocenka from ocenki, Lessons where Ocenki.Id_Lesson = Lessons.ID_Lessons and Id_Sdunent = " + student + " and  Lesson = N'" + e.Row.Cells[0].Text + "'  and ocenki.Date = CONVERT ( DATETIME, '" + data + "', 102 ) ", con);
                reader = cmd.ExecuteReader();

                int ocenka = 0;
                while (reader.Read())
                {
                    ocenka = reader.GetInt16(0);
                }

                reader.Close();
                string StrOcenka;

                if (Convert.ToString(ocenka) == "0")
                    StrOcenka = null;
                else if (Convert.ToString(ocenka) == "99")
                    StrOcenka = "Н";
                else
                {
                    StrOcenka = ocenka.ToString();
                    Count = Count + 1;
                }

                e.Row.Cells[i].Text = StrOcenka;

                if (ocenka != 99)
                {
                    Summa = Summa + ocenka;
                }
                else
                    Propusk = Propusk + 1;

                switch (StrOcenka)
                {
                    case "2": e.Row.Cells[i].ForeColor = System.Drawing.Color.Red; break;
                    case "3": e.Row.Cells[i].ForeColor = System.Drawing.Color.Orange; break;
                    case "4": e.Row.Cells[i].ForeColor = System.Drawing.Color.Green; break;
                    case "5": e.Row.Cells[i].ForeColor = System.Drawing.Color.Green; break;
                }
            }

            if (Count != 0)
                SrBall = Summa / Count;

            e.Row.Cells[GridView1.Columns.Count - 2].Text = SrBall.ToString();
            e.Row.Cells[GridView1.Columns.Count - 1].Text = Propusk.ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList3.DataBind();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            switch (month)
            {
                case 1: Label2.Text = " январь"; break;
                case 2: Label2.Text = " февраль"; break;
                case 3: Label2.Text = " март"; break;
                case 4: Label2.Text = " апрель"; break;
                case 5: Label2.Text = " май"; break;
                case 6: Label2.Text = " июнь"; break;
                case 7: Label2.Text = " июль"; break;
                case 8: Label2.Text = " август"; break;
                case 9: Label2.Text = " сентябрь"; break;
                case 10: Label2.Text = " октябрь"; break;
                case 11: Label2.Text = " ноябрь"; break;
                case 12: Label2.Text = " декабрь"; break;
            }

            Label3.Text = DropDownList3.SelectedItem.Text;
            Label4.Text = DropDownList2.SelectedItem.Text;
        }
    }
}
