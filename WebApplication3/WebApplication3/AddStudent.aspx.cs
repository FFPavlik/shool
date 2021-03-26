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

using System.Text;

namespace School
{
    public partial class AddStudent : System.Web.UI.Page
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
                con = new SqlConnection();
                con.ConnectionString = @"Data Source=ID3482\SQLEXPRESS;Initial Catalog=DatabaseSchool;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";
                con.Open();
            }
        }

        //string Sex = null;
        //protected void Button4_Click(object sender, EventArgs e)
        //{// Запись в базу    {
        //    List<TextBox> tb = new List<TextBox>();
        //    bool exp = true;

        //    if (RbLSex.Items[0].Selected == true)
        //        Sex = "Муж";
        //    if (RbLSex.Items[1].Selected == true)
        //        Sex = "Жен";

        //    foreach (Control item in Page.Form.FindControl("ContentPlaceHolder1").Controls) // ищем все textbox
        //    {
        //        if (item is TextBox)
        //        {
        //            tb.Add(((TextBox)item));
        //        }
        //    }

        //    for (int i = 1; i < tb.Count - 1; i++) // проверяем на их заполнение
        //    {
        //        if (tb[i].Text == string.Empty)
        //        {
        //            tb[i].BorderColor = System.Drawing.Color.Red;
        //            exp = false;
        //        }
        //        else // если не заполнены выделяем textbox
        //        {
        //            tb[i].BorderStyle = BorderStyle.NotSet;
        //            tb[i].BorderWidth = 1;
        //            tb[i].BorderColor = System.Drawing.Color.Black; ;
        //            tb[i].Font.Size = 13;
        //        }
        //    }

        //    if (exp) // Если заполнены вносим новые данные
        //    {
        //        cmd.Insert(TbName.Text, TbSurname.Text, TbMiddleName.Text, Convert.ToInt32(DDLAge.Text), Sex,
        //            Convert.ToDateTime(TbDate_of_Birth.Text), Convert.ToDateTime(TbStart_Date_Of_Training.Text), TbNumber_Phone.Text, DDLNumber.Text, DDLBukva.Text);
        //    }
        //    else Response.Write("<script>confirm('Заполните все обязательные поля')</script>");
        //}

        //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        if (Convert.ToInt16(DataBinder.Eval(e.Row.DataItem, "Age")) == 6) // or e.Row.Cells[5].Text
        //        {
        //            e.Row.BackColor = System.Drawing.Color.Red;
        //        }
        //    }
        //}



        //protected void Update_Click(object sender, EventArgs e) // Изменение
        //{
        //    int key = Convert.ToInt32(TbId.Text);
        //    if (RbLSex.Items[0].Selected == true)
        //        Sex = "Муж";
        //    if (RbLSex.Items[1].Selected == true)
        //        Sex = "Жен";

        //    if (TbDate_of_Birth.Text == "")
        //        TbDate_of_Birth.Text = ((Label)GridView1.SelectedRow.FindControl("LlDate_of_Birth")).Text;
        //    if (TbStart_Date_Of_Training.Text == "")
        //        TbStart_Date_Of_Training.Text = ((Label)GridView1.SelectedRow.FindControl("LbStart_Date_Of_Training")).Text;

        //    cmd.Update(key, TbName.Text, TbSurname.Text, TbMiddleName.Text, Convert.ToInt32(DDLAge.Text), Sex,
        //           TbDate_of_Birth.Text,
        //           TbStart_Date_Of_Training.Text,
        //           TbNumber_Phone.Text, DDLNumber.Text, DDLBukva.Text);
        //    Refresh();
        //}


        //protected void Button6_Click(object sender, EventArgs e) // поиск
        //{
        //    if (DropDownList1.Text != "")
        //        klass = DropDownList1.Text;
        //    if (DropDownList4.Text != "")
        //        bukva = DropDownList4.Text;

        //    for (int i = 0; i < GridView1.Rows.Count; i++)              // поиск и  выделение значения
        //    {
        //        GridView1.Rows[i].Visible = false;
        //        if (klass + bukva == ((Label)GridView1.Rows[i].FindControl("LbKlass")).Text)
        //        {
        //            GridView1.Rows[i].Visible = true;
        //            GridView1.Rows[i].BackColor = System.Drawing.Color.SkyBlue;
        //            CountStudent++;
        //        }
        //    }

        //    if (TBSurnameSearch.Text != "")
        //        for (int i = 0; i < GridView1.Rows.Count; i++)              // поиск и  выделение значения
        //        {
        //            GridView1.Rows[i].Visible = false;
        //            if (TBSurnameSearch.Text == ((Label)GridView1.Rows[i].FindControl("LbSurName")).Text)
        //            {
        //                GridView1.Rows[i].Visible = true;
        //                GridView1.Rows[i].BackColor = System.Drawing.Color.SkyBlue;
        //                CountStudent++;
        //            }
        //        }
        //    Label1.Text = "Всего учеников " + CountStudent;
        //}

        //protected void Delete_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        int key = Convert.ToInt32(TbId.Text);
        //        cmd.Delete(key);
        //        Refresh();
        //        zapolnenie();
        //    }
        //    catch (Exception)
        //    {
        //        Response.Write("<script>confirm('Выберите удаляемое значение')</script>");
        //    }
        //}
    }
}