<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="School.AddStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


                    <div class="blok_add" style="overflow-y: scroll; height: 400px">
                        <table class="auto-style11">
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label12" runat="server" Text="Код ученика" Font-Size="14pt"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="TbId" runat="server" Width="170px" Font-Size="12pt" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label3" runat="server" Text="Фамилия" Font-Size="14pt"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="TbSurname" runat="server" Width="170px" Font-Size="12pt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label2" runat="server" Text="Имя" Font-Size="14pt"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="TbName" runat="server" Width="170px" Font-Size="12pt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label4" runat="server" Text="Отчество" Font-Size="14pt"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="TbMiddleName" runat="server" Width="170px" Font-Size="12pt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label6" runat="server" Text="Возраст" Font-Size="14pt"></asp:Label>
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
                                    <asp:Label ID="Label7" runat="server" Text="Пол" Font-Size="14pt"></asp:Label>
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
                                    <asp:Label ID="Label8" runat="server" Text="Дата рождения" Font-Size="14pt"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="TbDate_of_Birth" runat="server" Width="170px" Font-Names="Arial" Font-Size="12pt" TextMode="Date"></asp:TextBox>
                                    &nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label9" runat="server" Text="Дата начала обучения" Font-Size="14pt"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="TbStart_Date_Of_Training" TextMode="Date" runat="server" Width="170px" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label10" runat="server" Text="Номер Телефона" Font-Size="14pt"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="TbNumber_Phone" runat="server" Width="170px" Font-Names="Arial" Font-Size="12pt"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label13" runat="server" Text="Класс" Font-Size="14pt"></asp:Label>
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
                                    <asp:Label ID="Label14" runat="server" Text="Родетели" Font-Size="14pt"></asp:Label>
                                </td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="TextBox11" runat="server" Font-Size="12pt" Width="170px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label15" runat="server" Text="Телефон родителей" Font-Size="14pt"></asp:Label>
                                </td>
                                <td class="auto-style8">

                                    <asp:TextBox ID="TextBox10" runat="server" Font-Size="12pt" Width="170px"></asp:TextBox>

                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">
                                    <asp:Label ID="Label16" runat="server" Text="Адрес" Font-Size="14pt"></asp:Label>
                                </td>
                                <td class="auto-style10">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style6">
                                    <asp:Button ID="Button4" CssClass="button" runat="server" Text="Добавить" Font-Size="12pt" Height="30px" Width="125px" />
                                </td>
                                <td class="auto-style10">
                                    <asp:Button ID="Button8" runat="server" CssClass="button" Text="Изменить" Font-Size="12pt" Width="125px" Height="30px"/>
                                </td>

                            </tr>
                            <tr>
                                <td class="auto-style6">
                                    <asp:Button ID="Button1" runat="server" CssClass="button" Text="Удалить" Font-Size="12pt" Width="125px" Height="30px"  />
                                </td>
                                <td class="auto-style10"></td>
                            </tr>
                        </table>
                    </div>
         


         
             

     

            <br />

            <div class="btDw">
                <asp:Button ID="Button5" runat="server" CssClass="button" Text="Родители" Font-Size="12pt" Width="125px" Height="30px" />
                <asp:Button ID="Button3" runat="server" CssClass="button" Text="Отмена" Font-Size="12pt" Width="125px" Height="30px"  />
            </div>
   

</asp:Content>
