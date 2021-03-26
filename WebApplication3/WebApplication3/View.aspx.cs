using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using OfficeOpenXml;
using System.IO;
using System.Reflection;
using OfficeOpenXml.Style;
using System.Configuration;

using System.Text;

namespace School
{
    public partial class View : System.Web.UI.Page
    {
        public static SqlConnection con;

        SqlCommands cmd = new SqlCommands();
        ExportToFile exports = new ExportToFile();
        int CountStudent = 0;
        string klass;
        string bukva;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connStr = ConfigurationManager.ConnectionStrings["DatabaseSchoolConnectionString"].ConnectionString;
                con = new SqlConnection();
                con.ConnectionString = connStr;
                con.Open();
                Refresh();
            }
        }

        string Sex = null;
        protected void Button4_Click(object sender, EventArgs e) // Запись в базу
        {
            IList<TextBox> tb = new List<TextBox>();
            bool exp = true;

            if (RbLSex.Items[0].Selected == true)
                Sex = "Муж";
            if (RbLSex.Items[1].Selected == true)
                Sex = "Жен";

            foreach (Control item in Page.Form.FindControl("ContentPlaceHolder1").Controls) // ищем все textbox
            {
                if (item is TextBox)
                {
                    tb.Add(((TextBox)item));
                }
            }

            for (int i = 1; i < tb.Count - 1; i++) // проверяем на их заполнение
            {
                if (tb[i].Text == string.Empty)
                {
                    tb[i].BorderColor = System.Drawing.Color.Red;
                    exp = false;
                }
                else // если не заполнены выделяем textbox
                {
                    tb[i].BorderStyle = BorderStyle.NotSet;
                    tb[i].BorderWidth = 1;
                    tb[i].BorderColor = System.Drawing.Color.Black; ;
                    tb[i].Font.Size = 13;
                }
            }

            if (exp) // Если заполнены вносим новые данные
            {
                cmd.Insert(TbName.Text, TbSurname.Text, TbMiddleName.Text, Convert.ToInt32(DDLAge.Text), Sex,
                    Convert.ToDateTime(TbDate_of_Birth.Text), Convert.ToDateTime(TbStart_Date_Of_Training.Text), TbNumber_Phone.Text, DDLNumber.Text, DDLBukva.Text);
                Response.Write("<script>confirm('Ученик добавлен')</script>");
                Refresh();
            }
            else Response.Write("<script>confirm('Заполните все обязательные поля')</script>");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "Age")) == 99) // or e.Row.Cells[5].Text
                {
                    e.Row.BackColor = System.Drawing.Color.Red;
                }
            }
        }

        void zapolnenie()
        {
            TbId.Text = ((Label)GridView1.SelectedRow.FindControl("LbId")).Text;
            TbName.Text = ((Label)GridView1.SelectedRow.FindControl("lbNAme")).Text;
            TbSurname.Text = ((Label)GridView1.SelectedRow.FindControl("LbSurName")).Text;
            TbMiddleName.Text = ((Label)GridView1.SelectedRow.FindControl("LbMiddleName")).Text;

            DateTime Date_of_Birth = Convert.ToDateTime(((Label)GridView1.SelectedRow.FindControl("LlDate_of_Birth")).Text);
            DateTime data_Start_Date_Of_Training = Convert.ToDateTime(((Label)GridView1.SelectedRow.FindControl("LbStart_Date_Of_Training")).Text);

            TbDate_of_Birth.Text = (string.Format("{0:d}", Date_of_Birth));
            TbStart_Date_Of_Training.Text = (string.Format("{0:d}", data_Start_Date_Of_Training));

            if (((Label)GridView1.SelectedRow.FindControl("LbNumber_Phone")).Text == "&nbsp;")
                TbNumber_Phone.Text = "";
            else
                TbNumber_Phone.Text = ((Label)GridView1.SelectedRow.FindControl("LbNumber_Phone")).Text;

            for (int i = 0; i < DDLAge.Items.Count; i++)
            {
                if (DDLAge.Items[i].Text == ((Label)GridView1.SelectedRow.FindControl("LbAge")).Text)
                {
                    DDLAge.ClearSelection();
                    DDLAge.Items[i].Selected = true;
                }
            }

            if (((Label)GridView1.SelectedRow.FindControl("lbSex")).Text == "Муж")
            {
                RbLSex.Items[0].Selected = true;
                RbLSex.Items[1].Selected = false;
            }
            else
            {
                RbLSex.Items[0].Selected = false;
                RbLSex.Items[1].Selected = true;
            }

            string Number;
            string Bukva;

            string KlassAndBukva = ((Label)GridView1.SelectedRow.FindControl("LbKlass")).Text;
            char[] Klass = new char[KlassAndBukva.Length];
            for (int i = 0; i < KlassAndBukva.Length; i++)
                Klass[i] = KlassAndBukva[i];

            if (KlassAndBukva.Length > 2)
            {
                Number = Klass[0].ToString() + Klass[1].ToString();
                Bukva = Klass[2].ToString();
            }
            else
            {
                Number = Klass[0].ToString();
                Bukva = Klass[1].ToString();
            }

            for (int i = 0; i < DDLNumber.Items.Count; i++)
            {
                if (DDLNumber.Items[i].Text == Number)
                {
                    DDLNumber.ClearSelection();
                    DDLNumber.Items[i].Selected = true;
                }
            }

            for (int i = 0; i < DDLBukva.Items.Count; i++)
            {
                if (DDLBukva.Items[i].Text == Bukva)
                {
                    DDLBukva.ClearSelection();
                    DDLBukva.Items[i].Selected = true;
                }
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e) // заполнение Контролов
        {
            zapolnenie();
        }

        protected void Update_Click(object sender, EventArgs e) // Изменение
        {
            int key = Convert.ToInt32(TbId.Text);
            if (RbLSex.Items[0].Selected == true)
                Sex = "Муж";
            if (RbLSex.Items[1].Selected == true)
                Sex = "Жен";

            if (TbDate_of_Birth.Text == "")
                TbDate_of_Birth.Text = ((Label)GridView1.SelectedRow.FindControl("LlDate_of_Birth")).Text;
            if (TbStart_Date_Of_Training.Text == "")
                TbStart_Date_Of_Training.Text = ((Label)GridView1.SelectedRow.FindControl("LbStart_Date_Of_Training")).Text;

            cmd.Update(key, TbName.Text, TbSurname.Text, TbMiddleName.Text, Convert.ToInt32(DDLAge.Text), Sex,
                   TbDate_of_Birth.Text,
                   TbStart_Date_Of_Training.Text,
                   TbNumber_Phone.Text, DDLNumber.Text, DDLBukva.Text);
            Response.Write("<script>confirm('Данные изменены')</script>");
            Refresh();
        }

        protected void Button6_Click(object sender, EventArgs e) // поиск
        {
            if (DropDownList1.Text != "")
                klass = DropDownList1.Text;
            if (DropDownList4.Text != "")
                bukva = DropDownList4.Text;

            for (int i = 0; i < GridView1.Rows.Count; i++)              // поиск и  выделение значения
            {
                GridView1.Rows[i].Visible = false;
                if (klass + bukva == ((Label)GridView1.Rows[i].FindControl("LbKlass")).Text)
                {
                    GridView1.Rows[i].Visible = true;
                    GridView1.Rows[i].BackColor = System.Drawing.Color.SkyBlue;
                    CountStudent++;
                }
            }

            if (TBSurnameSearch.Text != "")
                for (int i = 0; i < GridView1.Rows.Count; i++)              // поиск и  выделение значения
                {
                    GridView1.Rows[i].Visible = false;
                    if (TBSurnameSearch.Text == ((Label)GridView1.Rows[i].FindControl("LbSurName")).Text)
                    {
                        GridView1.Rows[i].Visible = true;
                        GridView1.Rows[i].BackColor = System.Drawing.Color.SkyBlue;
                        CountStudent++;
                    }
                }
            Label1.Text = "Всего учеников " + CountStudent;
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            try
            {
                int key = Convert.ToInt32(TbId.Text);
                cmd.Delete(key);
                Refresh();
                zapolnenie();
            }
            catch (Exception)
            {
                Response.Write("<script>confirm('Выберите удаляемое значение')</script>");
            }
        }

        protected void Refresh_Data_Click(object sender, EventArgs e)
        {
            Refresh();
        }

        void Refresh()
        {
            List<string> Visable = new List<string>();

            foreach (ListItem li in lstBoxTest1.Items)
            {
                if (li.Selected == false)
                {
                    Visable.Add(li.Text);
                }
            }

            GridView1.DataSource = cmd.Select();
            GridView1.DataBind();

            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                GridView1.Columns[i].Visible = true;
                for (int j = 0; j < Visable.Count; j++)
                {
                    if (Visable[j] == GridView1.Columns[i].HeaderText)
                        GridView1.Columns[i].Visible = false;
                }
            }

            Label1.Text = "Всего учеников " + GridView1.Rows.Count.ToString();
        }

        protected void Export_Click(object sender, EventArgs e)
        {
            if (DropDownList2.Text == "excel")
            {
                exports.ExportToExcel(GridView1);
                Response.Write("<script>confirm('Документ сохранен в ...')</script>");
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            cmd.Delete(Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value));
            Refresh();
        }

        string Name;
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            if (GridView1.Columns[4].Visible == false)
                Name = ((Label)GridView1.Rows[e.NewEditIndex].FindControl("LbNAme")).Text;

            Refresh();
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Refresh();
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string Number;
            string Bukva;
            string KlassAndBukva = (e.NewValues["Klass"].ToString());
            char[] Klass = new char[KlassAndBukva.Length];
            for (int i = 0; i < KlassAndBukva.Length; i++)
                Klass[i] = KlassAndBukva[i];

            if (KlassAndBukva.Length > 2)
            {
                Number = Klass[0].ToString() + Klass[1].ToString();
                Bukva = Klass[2].ToString();
            }
            else
            {
                Number = Klass[0].ToString();
                Bukva = Klass[1].ToString();
            }
            string s;
            if (GridView1.Columns[4].Visible == false)
                s = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("TbNAme")).Text;

            int key = Convert.ToInt32(GridView1.DataKeys[GridView1.EditIndex].Value);
            cmd.Update(key, e.NewValues["Name"].ToString(),
                            e.NewValues["SurName"].ToString(),
                            e.NewValues["MiddleName"].ToString(),
                            Convert.ToInt32(e.NewValues["Age"].ToString()),
                            ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("DropDownList3")).Text,
                            e.NewValues["Date_of_Birth"].ToString(),
                            e.NewValues["Start_Date_Of_Training"].ToString(),
                            e.NewValues["Number_Phone"].ToString(),
                            Number,
                            Bukva
                            );

            Refresh();
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            Response.Write("<script>alert('Обновлено строк )</script>");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Refresh();
            foreach (Control item in Page.Form.FindControl("ContentPlaceHolder1").Controls) // ищем все textbox
            {
                if (item is TextBox)
                {
                    ((TextBox)item).Text = string.Empty;
                }
            }

            MultiView1.ActiveViewIndex = -1;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void LinkButton3_Click1(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
}
