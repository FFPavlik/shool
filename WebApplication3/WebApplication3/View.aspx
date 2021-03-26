<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="School.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style6 {
            padding-top: 10px;
            width: 1668px;
            text-align: center;
        }

        .auto-style7 {
            width: 1668px;
            height: 30px;
        }

        .auto-style8 {
            width: 404px;
            margin-left: 40px;
            height: 30px;
        }

        .auto-style9 {
            width: 404px;
            height: 30px;
        }

        .auto-style10 {
            padding-top: 10px;
            width: 404px;
            text-align: center;
        }

        .auto-style11 {
            width: 100%;
        }

        .auto-style12 {
            margin-right: 0px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/ViewForm.css" rel="stylesheet" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="js/jquery.sumoselect.min.js"></script>
    <link href="css/sumoselect.css" rel="stylesheet" />

    <div class="zagolovok">
        <div class="export">
            <asp:DropDownList ID="DropDownList2" runat="server" Height="30px" Width="160px" Font-Size="12pt">
                <asp:ListItem>excel</asp:ListItem>
                <asp:ListItem>word</asp:ListItem>
                <asp:ListItem>pdf</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button2" CssClass="button" runat="server" OnClick="Export_Click" Text="Экспорт" Width="100px" Height="31px" />
        </div>

        <div class="ChekList">
            <asp:ListBox runat="server" ID="lstBoxTest1" SelectionMode="Multiple">
                <asp:ListItem Selected="True" Value="Id_Studend">Номер</asp:ListItem>
                <asp:ListItem Value="Name" Selected="True">Имя</asp:ListItem>
                <asp:ListItem Selected="True" Value="SurName">Фамилия</asp:ListItem>
                <asp:ListItem Selected="True" Value="MiddleName">Отчество</asp:ListItem>
                <asp:ListItem Selected="True" Value="Age">Возраст</asp:ListItem>
                <asp:ListItem Selected="True" Value="Sex">Пол</asp:ListItem>
                <asp:ListItem Selected="True" Value="Date_of_Birth">Дата рождения</asp:ListItem>
                <asp:ListItem Selected="True" Value="Start_Date_Of_Training">Дата начала обучения</asp:ListItem>
                <asp:ListItem Selected="True" Value="Number_Phone">Номер телефона</asp:ListItem>
                <asp:ListItem Selected="True" Value="Klass">Класс</asp:ListItem>
            </asp:ListBox>

            <asp:Button ID="Button7" CssClass="button" runat="server" OnClick="Refresh_Data_Click" Text="Пременить" Height="31px" Width="120px" />
        </div>
    </div>



    <div id="mySidenav" class="sidenav">
      <%--  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="#">Список учеников</a>
        <a href="#">Просмотр пропусков</a>
        <a href="#">Добавить ученика</a>--%>
    </div>

    <div id="main">
       <%-- <span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776; open</span>--%>
    </div>

    <script>
        //function openNav() {
        //    document.getElementById("mySidenav").style.width = "350px";
        //    document.getElementById("main").style.marginLeft = "350px";
        //}

        //function closeNav() {
        //    document.getElementById("mySidenav").style.width = "0";
        //    document.getElementById("main").style.marginLeft = "0";
        //}
    </script>



    <script type="text/javascript">
        $(document).ready(function () {
            $(<%=lstBoxTest1.ClientID%>).SumoSelect({ selectAll: true });
        });
    </script>

    <div class="richt-panel">
        <div class="Greed">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" Width="100%" PageSize="5" OnRowDataBound="GridView1_RowDataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="Id_Studend" CssClass="auto-style12" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdated="GridView1_RowUpdated" OnRowUpdating="GridView1_RowUpdating">
                <AlternatingRowStyle BackColor="White" BorderStyle="Outset" HorizontalAlign="Center" />
                <Columns>
                    <asp:CommandField ButtonType="Link" ControlStyle-CssClass="link_grid" ShowDeleteButton="True">
                        <ControlStyle CssClass="link_grid"></ControlStyle>
                    </asp:CommandField>
                    <asp:CommandField ButtonType="Link" ControlStyle-CssClass="link_grid" ShowEditButton="true">
                        <ControlStyle CssClass="link_grid"></ControlStyle>
                    </asp:CommandField>
                    <asp:CommandField ButtonType="Link" ControlStyle-CssClass="link_grid" ShowSelectButton="true">
                        <ControlStyle CssClass="link_grid"></ControlStyle>
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="Номер">
                        <EditItemTemplate>
                            <asp:Label ID="LbId" runat="server" Text='<%# Eval("Id_Studend") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LbId" runat="server" Text='<%# Bind("Id_Studend") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Имя">
                        <EditItemTemplate>
                            <asp:TextBox ID="TbName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Фамилия">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SurName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LbSurName" runat="server" Text='<%# Bind("SurName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Отчество">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MiddleName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LbMiddleName" runat="server" Text='<%# Bind("MiddleName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Возраст">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Age") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LbAge" runat="server" Text='<%# Bind("Age") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Пол">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("Sex") %>'>
                                <asp:ListItem>Муж</asp:ListItem>
                                <asp:ListItem>Жен</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbSex" runat="server" Text='<%# Bind("Sex") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Дата рождения">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Date_of_Birth") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LlDate_of_Birth" runat="server" Text='<%# Bind("Date_of_Birth", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Дата начала обучения">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Start_Date_Of_Training") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LbStart_Date_Of_Training" runat="server" Text='<%# Bind("Start_Date_Of_Training", "{0:D}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Номер телефона">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Number_Phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LbNumber_Phone" runat="server" Text='<%# Bind("Number_Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Класс">
                        <EditItemTemplate>
                            <asp:TextBox ID="TbKlass" runat="server" Text='<%# Bind("Klass") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LbKlass" runat="server" Text='<%# Bind("Klass") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#D1DDF1" HorizontalAlign="Center" Wrap="False" />
                <EmptyDataRowStyle BorderStyle="Outset" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#34495E" BorderStyle="Outset" Font-Bold="True" ForeColor="White" Wrap="False" />
                <PagerSettings NextPageText="&gt;" />
                <PagerStyle BackColor="#2461BF" BorderStyle="Outset" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" Wrap="False" BorderStyle="Outset" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" Wrap="False" HorizontalAlign="Center" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </div>
    </div>

    <div class="Lef-Panel">
        <ul class="nav">
            <li>
                <div class="buttonClass">
                    <asp:LinkButton ID="LinkButton3" runat="server" Font-Underline="False" OnClick="LinkButton3_Click1" Font-Size="14pt" ForeColor="Black">Поиск</asp:LinkButton>
                </div>
            </li>
            <li>
                <div class="buttonClass">
                    <asp:LinkButton ID="LinkButton2" runat="server" Font-Underline="False" OnClick="LinkButton2_Click" Font-Size="14pt" ForeColor="Black">Добавить ученика</asp:LinkButton><br />
                </div>
            </li>
        </ul>

        <hr />

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
            <asp:View ID="View1" runat="server">
                <div class="blok_add" style="overflow-y: scroll;">
                    <table class="auto-style11">
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label12" runat="server" Text="Код ученика" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="TbId" runat="server" Width="170px" Font-Size="12pt" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label3" runat="server" Text="Фамилия" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="TbSurname" runat="server" Width="170px" Font-Size="12pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label2" runat="server" Text="Имя" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="TbName" runat="server" Width="170px" Font-Size="12pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label4" runat="server" Text="Отчество" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="TbMiddleName" runat="server" Width="170px" Font-Size="12pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label6" runat="server" Text="Возраст" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:DropDownList ID="DDLAge" runat="server" Height="25px" Width="178px" Font-Size="12pt">
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                    <asp:ListItem>13</asp:ListItem>
                                    <asp:ListItem>14</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>16</asp:ListItem>
                                    <asp:ListItem>17</asp:ListItem>
                                    <asp:ListItem>18</asp:ListItem>
                                    <asp:ListItem>19</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label7" runat="server" Text="Пол" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:RadioButtonList ID="RbLSex" runat="server" Height="10px" Width="159px" AutoPostBack="True" RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True">Муж</asp:ListItem>
                                    <asp:ListItem>Жен</asp:ListItem>

                                </asp:RadioButtonList>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label8" runat="server" Text="Дата рождения" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="TbDate_of_Birth" runat="server" Width="170px" Font-Names="Arial" Font-Size="12pt" TextMode="Date"></asp:TextBox>
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label9" runat="server" Text="Дата начала обучения" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="TbStart_Date_Of_Training" TextMode="Date" runat="server" Width="170px" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label10" runat="server" Text="Номер Телефона" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="TbNumber_Phone" runat="server" Width="170px" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label13" runat="server" Text="Класс" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:DropDownList ID="DDLNumber" runat="server" Width="85px" Font-Names="Arial" Font-Size="12pt" Height="25px">
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
                                </asp:DropDownList>
                                <asp:DropDownList ID="DDLBukva" runat="server" Width="85px" Font-Names="Arial" Font-Size="12pt" Height="25px">
                                    <asp:ListItem>А</asp:ListItem>
                                    <asp:ListItem>Б</asp:ListItem>
                                    <asp:ListItem>В</asp:ListItem>
                                    <asp:ListItem>Г</asp:ListItem>
                                    <asp:ListItem>Д</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label15" runat="server" Text="Телефон родителей" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style8">

                                <asp:TextBox ID="TextBox10" runat="server" Font-Size="12pt" Width="170px"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>

                            <td class="auto-style10">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <asp:Button ID="Button4" CssClass="button" runat="server" OnClick="Button4_Click" Text="Добавить" Font-Size="12pt" Height="30px" Width="125px" />
                            </td>
                            <td class="auto-style10">
                                <asp:Button ID="Button8" runat="server" CssClass="button" Text="Изменить" Font-Size="12pt" Width="125px" Height="30px" OnClick="Update_Click" />
                            </td>

                        </tr>
                        <tr>
                            <td class="auto-style6">
                                <asp:Button ID="Button1" runat="server" CssClass="button" Text="Удалить" Font-Size="12pt" Width="125px" Height="30px" OnClick="Delete_Click" />
                            </td>
                            <td class="auto-style10"></td>
                        </tr>
                    </table>
                </div>
            </asp:View>

            <asp:View ID="View2" runat="server">
                <div class="search">
                    <table>
                        <tr>
                            <td class="auto-style13">
                                <asp:Label ID="Label5" runat="server" Text="Введите класс" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td class="auto-style14">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="85px" Font-Names="Arial" Font-Size="12pt" Height="25px">
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
                                </asp:DropDownList>
                                <asp:DropDownList ID="DropDownList4" runat="server" Width="85px" Font-Names="Arial" Font-Size="12pt" Height="25px">
                                    <asp:ListItem>А</asp:ListItem>
                                    <asp:ListItem>Б</asp:ListItem>
                                    <asp:ListItem>В</asp:ListItem>
                                    <asp:ListItem>Г</asp:ListItem>
                                    <asp:ListItem>Д</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label11" runat="server" Text="Фамилия" Font-Size="14pt" ForeColor="black"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TBSurnameSearch" runat="server" Font-Size="12pt" Width="170px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div class="btSearch">
                        <asp:Button ID="Button6" runat="server" CssClass="button" Text="Поиск" Font-Size="12pt" Width="125px" Height="30px" OnClick="Button6_Click" />
                    </div>
                </div>
            </asp:View>

        </asp:MultiView>
        <br />
    </div>
    <footer>

        <div class="total">
            <asp:Label ID="Label1" runat="server" Font-Size="14pt " ForeColor="black"></asp:Label>
        </div>

    </footer>

</asp:Content>
