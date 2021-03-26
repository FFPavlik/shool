using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace School
{
    public partial class Teachers : System.Web.UI.Page
    {
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["DatabaseSchoolConnectionString"].ConnectionString;
            con = new SqlConnection();
            con.ConnectionString = connStr;
            con.Open();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            HttpPostedFile PostedFile = FileUpload1.PostedFile;
            string fileName = Path.GetFileName(PostedFile.FileName);
            string fileExtension = Path.GetFileName(fileName);
            int FileSize = PostedFile.ContentLength;



            //if (fileExtension.ToLower() == "png" || fileExtension.ToLower() == "gif" || fileExtension.ToLower() == "jpg" || fileExtension.ToLower() == "bmp")
            //{
            Stream stream = PostedFile.InputStream;
            BinaryReader binaryreader = new BinaryReader(stream);
            byte[] bytes = binaryreader.ReadBytes((int)stream.Length);

            SqlCommand command = new SqlCommand("update Teachers set Image = @Image", con);
            command.Parameters.AddWithValue("@Image", bytes);
            command.ExecuteNonQuery();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            string ID_Teacher = null;
            if ((e.Item.ItemType == ListItemType.Item) || (e.Item.ItemType == ListItemType.AlternatingItem))
            {
                ID_Teacher = ((Label)e.Item.FindControl("ID_TeachersLabel")).Text;
            }

            SqlDataAdapter da = new SqlDataAdapter("SELECT Lessons.Lesson FROM Lessons INNER JOIN TeacherAndLessons ON Lessons.ID_Lessons = TeacherAndLessons.ID_Lessons WHERE TeacherAndLessons.ID_Teacher = @ID_Teacher", con);
            da.SelectCommand.Parameters.AddWithValue("@ID_Teacher", ID_Teacher);
            DataSet ds = new DataSet();
            da.Fill(ds);

            ((Label)e.Item.FindControl("ID_TeachersLabel")).Text = "";
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {     
                ((Label)e.Item.FindControl("ID_TeachersLabel")).Text = ((Label)e.Item.FindControl("ID_TeachersLabel")).Text + " " + ds.Tables[0].Rows[i].ItemArray[0];
            }
        }

    }
}