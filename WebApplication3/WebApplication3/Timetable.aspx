<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Timetable.aspx.cs" Inherits="School.Timetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/TimeTable.css" rel="stylesheet" />

    <div class="Grid">
        <asp:GridView ID="GridView1" runat="server" Width="100%" AllowSorting="false" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" Font-Bold="False" Font-Italic="False" Font-Names="Arial" Font-Overline="False" Font-Size="14pt" Font-Strikeout="False" Font-Underline="False" GridLines="None" BorderStyle="None" ForeColor="#003399">
            <Columns>
                <asp:TemplateField HeaderText="Имя">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Name") %>' CommandName="Download" Text='<%# Eval("Name") %>' BorderStyle="None" ForeColor="#003399" EnableTheming="True" Font-Underline="False"></asp:LinkButton>
                        <hr />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Размер">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Size") %>'></asp:Label>
                        <hr />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Тип">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                        <hr />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Дата загрузки">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                        <hr />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle HorizontalAlign="Left" Height="50px" VerticalAlign="Top" />
            <RowStyle Height="50px" HorizontalAlign="Left" Width="1000px" Wrap="False" />
        </asp:GridView>
    </div>

    <div class="Upload">
        <asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" Font-Names="Arial" Font-Size="12pt" />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Загрузить" Font-Names="Arial" Font-Size="12pt" />
    </div>

</asp:Content>
