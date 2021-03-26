<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Ocenki.aspx.cs" Inherits="School.Ocenki" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/Ocenki.css" rel="stylesheet" />

    <div class="zagolovok">
        <table class="auto-style1">
            <tr>
                <td class="td">
                    <asp:Label ID="Label1" runat="server" Text="Месяц" ForeColor="Black" Width="108px"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" ForeColor="Black" Width="297px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td">Ученик</td>
                <td>
                    <asp:Label ID="Label3" runat="server" ForeColor="Black" Width="534px"></asp:Label>

                </td>
            </tr>
            <tr>
                <td class="td">Класс</td>
                <td>
                    <asp:Label ID="Label4" runat="server" ForeColor="Black" Width="110px"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <div class="greed">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnDataBinding="GridView1_DataBinding" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound" Width="100%">
            <Columns>
                <asp:BoundField DataField="Lesson" HeaderText="" SortExpression="Lesson" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseSchoolConnectionString %>" SelectCommand="SELECT Lessons.Lesson FROM LessonsAndKlass, Klass, Lessons where LessonsAndKlass.ID_Klass = Klass.ID_Klass and Lessons.ID_Lessons = LessonsAndKlass.ID_Lesson and  Klass.ID_Klass = @ID_Klass">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="ID_Klass" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div class="select">
        <table style="width: 100%;">
            <tr>
                <td>Месяц</td>
                <td>Класс</td>
                <td>Ученик</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownListMonth" runat="server" Height="30px" Width="140px" Font-Size="12pt">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList></td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceKlass" DataTextField="Klass" DataValueField="ID_Klass" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Height="30px" Width="140px" Font-Size="12pt"></asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceStudent" DataTextField="Name" DataValueField="Id_Studend" Height="30px" Width="310px" Font-Size="12pt">
                        <asp:ListItem Value=" "> </asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Применить" Height="33px" Width="115px" OnClick="Button1_Click1" />
                </td>
            </tr>
        </table>

        <asp:SqlDataSource ID="SqlDataSourceKlass" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseSchoolConnectionString %>" SelectCommand="SELECT ID_Klass, concat(Klass.Number, '', Klass.Bukva) as Klass FROM Klass"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceStudent" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseSchoolConnectionString %>" SelectCommand="SELECT Id_Studend, CONCAT([Surname], ' ',  [name], ' ', [MiddleName]) Name FROM [Students] WHERE ([ID_Klass] = @ID_Klass)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="ID_Klass" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <a href="InsertOcenki.aspx">Выстовить оценки</a>

    </div>

</asp:Content>
