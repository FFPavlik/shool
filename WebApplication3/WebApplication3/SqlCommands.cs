using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace School
{
    public class SqlCommands
    {
        SqlDataAdapter da;
        DataSet ds;
        SqlDataReader reader;

        public void Delete(int key)
        {
            SqlCommand command = new SqlCommand("delete from Students where Id_Studend = @Id_Studend", View.con);
            command.Parameters.AddWithValue("@Id_Studend", key);
            command.ExecuteNonQuery();
        }
        public void Update(int key, string Name, string Surname, string MiddleName, int Age,
            string Sex, string Date_of_Birth, string Start_Date_Of_Training, string Number_Phone, string Number_Klass, String Bukva)
        {
            SqlCommand command = new SqlCommand("update Students set Name = @Name, SurName = @Surname, MiddleName = @MiddleName, Age = @Age, Sex = @Sex, " +
                "Date_of_Birth = @Date_of_Birth, Start_Date_Of_Training = @Start_Date_Of_Training, Number_Phone = @Number_Phone, ID_Klass = @ID_Klass  where Id_Studend = @Id_Studend", View.con);
            command.Parameters.AddWithValue("@Id_Studend", key);
            command.Parameters.AddWithValue("@name", Name);
            command.Parameters.AddWithValue("@Surname", Surname);
            command.Parameters.AddWithValue("@MiddleName", MiddleName);
            command.Parameters.AddWithValue("@Age", Age);
            command.Parameters.AddWithValue("@Sex", Sex);
            command.Parameters.AddWithValue("@Date_of_Birth", Convert.ToDateTime(Date_of_Birth));
            command.Parameters.AddWithValue("@Start_Date_Of_Training", Convert.ToDateTime(Start_Date_Of_Training));
            try
            {
                command.Parameters.AddWithValue("@Number_Phone", Number_Phone);
            }
            catch (Exception) { command.Parameters.AddWithValue("@Number_Phone", DBNull.Value); }
            command.Parameters.AddWithValue("@ID_Klass", Return_ID_Klass(Number_Klass, Bukva));
            command.ExecuteNonQuery();


            SqlCommand command1 = new SqlCommand("update StudentAndKlass set ID_Klass = @ID_Klass where ID_Sdudents = @Id_Studend", View.con);
            command1.Parameters.AddWithValue("@ID_Klass", Return_ID_Klass(Number_Klass, Bukva));
            command1.Parameters.AddWithValue("@Id_Studend", key);
            try
            {
                command1.ExecuteNonQuery();
            }
            catch (Exception) { }



        }
        public void Insert(string Name, string Surname, string MiddleName, int Age,
            string Sex, DateTime Date_of_Birth, DateTime Start_Date_Of_Training, string Number_Phone, string Number_Klass, String Bukva)
        {
            SqlCommand command = new SqlCommand("insert into students (Name, SurName, MiddleName, Age, Sex,"
                               + "Date_of_Birth, Start_Date_Of_Training, Number_Phone, ID_Klass) VALUES (@name, @Surname, @MiddleName, @Age, @Sex, @Date_of_Birth, @Start_Date_Of_Training, @Number_Phone, @ID_Klass )", View.con);
            command.Parameters.AddWithValue("@name", Name);
            command.Parameters.AddWithValue("@Surname", Surname);
            command.Parameters.AddWithValue("@MiddleName", MiddleName);
            command.Parameters.AddWithValue("@Age", Age);
            command.Parameters.AddWithValue("@Sex", Sex);
            command.Parameters.AddWithValue("@Date_of_Birth", Date_of_Birth);
            command.Parameters.AddWithValue("@Start_Date_Of_Training", Start_Date_Of_Training);
            command.Parameters.AddWithValue("@Number_Phone", Number_Phone);
            command.Parameters.AddWithValue("@ID_Klass", Return_ID_Klass(Number_Klass, Bukva));
            command.ExecuteNonQuery();

            decimal ID_Student = 0;
             
            SqlDataReader reader2;
            SqlCommand command2 = new SqlCommand("SELECT IDENT_CURRENT('Students') as ID_Student", View.con);
            reader2 = command2.ExecuteReader();
            while (reader2.Read())
            {
                ID_Student = reader2.GetDecimal(0);
            }
            reader2.Close();

            SqlCommand command1 = new SqlCommand("insert into StudentAndKlass (ID_Klass, ID_Sdudents) values (@ID_Klass, @ID_Student) ", View.con);
            command1.Parameters.AddWithValue("@ID_Klass", Return_ID_Klass(Number_Klass, Bukva));
            command1.Parameters.AddWithValue("@ID_Student", ID_Student);
            command1.ExecuteNonQuery();

        }

        public DataTable Select()
        {
            da = new SqlDataAdapter("select Students.Id_Studend, Students.name, Students.Surname, Students.MiddleName, Students.Age, Students.Sex, Students.Date_of_Birth,Students.Start_Date_Of_Training, Students.Number_Phone,concat(Klass.Number, '', Klass.Bukva) as Klass from Students, Klass where Students.ID_Klass = Klass.ID_Klass", View.con);
            ds = new DataSet();
            da.Fill(ds);
            return ds.Tables[0];
        }


        int Return_ID_Klass(string Number_Klass, String Bukva)
        {
            int ID_Klass = 0;

            SqlCommand command_select_klass = new SqlCommand("select ID_Klass from Klass where Number = @Number and Bukva = @Bukva ", View.con);
            command_select_klass.Parameters.AddWithValue("@Number", Number_Klass);
            command_select_klass.Parameters.AddWithValue("@Bukva", Bukva);
            reader = command_select_klass.ExecuteReader();
            while (reader.Read())
            {
                ID_Klass = reader.GetInt32(0);
            }
            reader.Close();

            return ID_Klass;
        }

    }
}