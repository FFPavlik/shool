using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using OfficeOpenXml;
using System.IO;
using System.Reflection;
using OfficeOpenXml.Style;
using OfficeOpenXml.Drawing;

namespace School
{
    public class ExportToFile
    {
        public void ExportToExcel (GridView GridView1)
        {
            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            ExcelPackage excelPackage = new ExcelPackage();

            //Сведения о документе
            excelPackage.Workbook.Properties.Author = Environment.UserName;
            excelPackage.Workbook.Properties.Title = "Title of Document";
            excelPackage.Workbook.Properties.Subject = "EPPlus demo export data";
            excelPackage.Workbook.Properties.Created = DateTime.Now;

            //добавляем новый лист
            ExcelWorksheet worksheet = excelPackage.Workbook.Worksheets.Add("Sheet 1");

            int a = 0;
            for (int i = 3; i < GridView1.Columns.Count; i++)
            {
                if (GridView1.Columns[i].Visible == true)
                {
                    worksheet.Cells[1, a + 1].Value = GridView1.Columns[i].HeaderText;
                    worksheet.Cells[1, a + 1].Style.Font.Size = 14;

                    worksheet.Cells[1, a + 1].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                    worksheet.Cells[1, a + 1].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                    worksheet.Cells[1, a + 1].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                    worksheet.Cells[1, a + 1].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                    a++;
                }
            }

            int rows = 2;
            int column = 1;
            List<int> ls = new List<int>();

            for (int j = 4; j < GridView1.Columns.Count + 1; j++)
            {
                if (GridView1.Columns[j - 1].Visible == true)
                {
                    int c = j;
                    ls.Add(c);

                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        if (GridView1.Rows[i].Visible == true)
                        {
                            switch (c)
                            {
                                case 4: worksheet.Cells[rows, ls.Count].Value = ((Label)GridView1.Rows[i].FindControl("LbId")).Text; break;
                                case 5: worksheet.Cells[rows, ls.Count].Value = ((Label)GridView1.Rows[i].FindControl("lbname")).Text; break;
                                case 6: worksheet.Cells[rows, ls.Count].Value = ((Label)GridView1.Rows[i].FindControl("LbSurName")).Text; break;
                                case 7: worksheet.Cells[rows, ls.Count].Value = ((Label)GridView1.Rows[i].FindControl("LbMiddleName")).Text; break;
                                case 8: worksheet.Cells[rows, ls.Count].Value = ((Label)GridView1.Rows[i].FindControl("LbAge")).Text; break;
                                case 9: worksheet.Cells[rows, ls.Count].Value = ((Label)GridView1.Rows[i].FindControl("LbSex")).Text; break;
                                case 10: worksheet.Cells[rows, ls.Count].Value = ((Label)GridView1.Rows[i].FindControl("LlDate_of_Birth")).Text; break;
                                case 11: worksheet.Cells[rows, ls.Count].Value = ((Label)GridView1.Rows[i].FindControl("LbStart_Date_Of_Training")).Text; break;
                                case 12: worksheet.Cells[rows, ls.Count].Value = ((Label)GridView1.Rows[i].FindControl("LbNumber_Phone")).Text; break;
                                case 13: worksheet.Cells[rows, ls.Count].Value = ((Label)GridView1.Rows[i].FindControl("LbKlass")).Text; break;
                            }

                            worksheet.Cells[rows, column].Style.Border.Top.Style = ExcelBorderStyle.Thin;
                            worksheet.Cells[rows, column].Style.Border.Right.Style = ExcelBorderStyle.Thin;
                            worksheet.Cells[rows, column].Style.Border.Bottom.Style = ExcelBorderStyle.Thin;
                            worksheet.Cells[rows, column].Style.Border.Left.Style = ExcelBorderStyle.Thin;
                            rows++;
                        }
                    }
                    column++;
                    rows = 2;
                }
            }

           // worksheet.Cells[1, 1].Value = worksheet.Dimension.End.Row;

            worksheet.Cells[worksheet.Dimension.Address].AutoFitColumns();
            worksheet.Row(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;

            //Autofit with minimum size for the column.
            double minimumSize = 10;
            worksheet.Cells[worksheet.Dimension.Address].AutoFitColumns(minimumSize);

            //Autofit with minimum and maximum size for the column.
            double maximumSize = 50;
            worksheet.Cells[worksheet.Dimension.Address].AutoFitColumns(minimumSize, maximumSize);

            //optional use this to make all columms just a bit wider, text would sometimes still overflow after AutoFitColumns().
            for (int col = 1; col <= worksheet.Dimension.End.Column; col++)
            {
                worksheet.Column(col).Width = worksheet.Column(col).Width + 1;
            }

            //Save your file
            FileInfo fi1 = new FileInfo(@"D:\Visul studio\ИЛ96-300_ПРИКАЗ 420 Ц.ИЗГ_095.xlsx");
            excelPackage.SaveAs(fi1);

        }
    }
}