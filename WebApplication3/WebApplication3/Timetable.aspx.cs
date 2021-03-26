using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Text;


namespace School
{
    public partial class Timetable : System.Web.UI.Page
    {
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            dt.Columns.Add("Name", typeof(string));
            dt.Columns.Add("Size", typeof(string));
            dt.Columns.Add("Type", typeof(string));
            dt.Columns.Add("Date", typeof(string));
            PrintFile();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Excel/") + FileUpload1.FileName);            
            }

            PrintFile();
        }

        void PrintFile()
        {
            dt.Clear();
            int i = 0;
            foreach (string filestr in Directory.GetFiles(Server.MapPath("~/Excel/")))
            {
                FileInfo file = new FileInfo(filestr);
                dt.Rows.Add(file.Name, (file.Length / 1024) + " Кб", GetTypeName(file.Extension), File.GetLastWriteTime(filestr));
                i++;
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        string GetTypeName(string Type)
        {
            switch (Type.ToLower())
            {
                case ".xls":
                case ".xlsx": return "Документ Microsoft Excel";
                case ".doc": return "Документ Microsoft Word";
                default: return "Unkmown";
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/Excel/") + e.CommandArgument);
                Response.End();
            }
        }
    }
}