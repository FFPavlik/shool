<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="InsertOcenki.aspx.cs" Inherits="School.InsertOcenki" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/InsertOcenki.css" rel="stylesheet" />
    <asp:Panel ID="Panel1" runat="server" Width="600px">
        <div class="panel">
            <table style="height: 600px; width: 500px">
                <tr>
                    <td>Класс
                    <br />
                        <asp:DropDownList ID="DropDownListKlass" runat="server" Height="25px" Width="170px" Font-Size="12pt" DataSourceID="SqlDataSourceKlass" DataTextField="Klass" DataValueField="ID_Klass" AutoPostBack="True"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Урок
                    <br />
                        <asp:DropDownList ID="DropDownListLesson" runat="server" Height="25px" Width="250px" Font-Size="12pt" DataSourceID="SqlDataSourceLessons" DataTextField="Lesson" DataValueField="ID_Lessons"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Ученик
                    <br />
                        <asp:DropDownList ID="DropDownListStudent" runat="server" Height="25px" Width="250px" Font-Size="12pt" DataSourceID="SqlDataSourceStudent" DataTextField="Name" DataValueField="Id_Studend"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Оценка
                    <br />
                        <asp:DropDownList ID="DropDownListOcenka" runat="server" Height="25px" Width="170px" Font-Size="12pt">
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem Value="99">Отсутствовал</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Выберите дату
                     <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="Calendar1_SelectionChanged">
                         <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                         <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                         <OtherMonthDayStyle ForeColor="#999999" />
                         <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                         <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                         <TodayDayStyle BackColor="#CCCCCC" />
                     </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td>Дата
                    <br />
                        <asp:Label ID="Label1" runat="server" Text="Label" Height="25px" Width="170px" Font-Size="12pt"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ok" Height="35px" Width="170px" />
    </asp:Panel>
    <div class="panel2">
        <asp:Panel ID="Panel2" runat="server" CssClass="auto-style1" Width="500px">
            asd
        </asp:Panel>
    </div>
    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" />

    <asp:SqlDataSource ID="SqlDataSourceKlass" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseSchoolConnectionString %>" SelectCommand="SELECT ID_Klass, concat(Klass.Number, '', Klass.Bukva) as Klass FROM Klass"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceLessons" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseSchoolConnectionString %>" SelectCommand="SELECT Lessons.Lesson, Lessons.ID_Lessons
  FROM LessonsAndKlass, Lessons, Klass
  where LessonsAndKlass.ID_Klass = Klass.ID_Klass
      and LessonsAndKlass.ID_Lesson = Lessons.ID_Lessons
      and (Klass.ID_Klass = @ID_Klass)
">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListKlass" Name="ID_Klass" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceStudent" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseSchoolConnectionString %>" SelectCommand="SELECT Id_Studend, CONCAT([Surname], ' ',  [name], ' ', [MiddleName]) Name FROM [Students] WHERE ([ID_Klass] = @ID_Klass)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownListKlass" Name="ID_Klass" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
