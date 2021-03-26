<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Teachers.aspx.cs" Inherits="School.Teachers" %>

<%--<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/Teachers.css" rel="stylesheet" />

    <div class="list">
        <asp:DataList ID="DataList1" runat="server"
            DataSourceID="SqlDataSource1" Width="850px" BorderStyle="None" Height="117px" GridLines="Horizontal" Font-Size="15pt" OnItemDataBound="DataList1_ItemDataBound">
            <ItemStyle Font-Bold="False" />
            <ItemTemplate>
                <table style="width: 100%">
                    <tr onclick="document.location = 'PersonalPage.aspx';">
                        <td>
                            <th style="width: 150px;">
                                <asp:Image ID="Image1" runat="server" Height="120px" ImageUrl="~/img/images.jfif" Width="170px" />
                            </th>
                            <th style="height: 100%; width: 300px">
                                <asp:Label ID="SurnameLabel" runat="server" Text='<%# Eval("Surname") %>' Font-Bold="False" />
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("Name") %>' Font-Bold="False" />
                                <asp:Label ID="MiddleNameLabel" runat="server" Text='<%# Eval("MiddleName") %>' Font-Bold="False" />
                            </th>
                            <th>
                                <asp:Label ID="Label5" runat="server" Text="Должность "></asp:Label>
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Position") %>' Font-Bold="False" />
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="Дисциплины: "></asp:Label>
                                <asp:Label ID="ID_TeachersLabel" runat="server" Text='<%# Eval("ID_Teachers") %>' Visible="true" Font-Bold="False" />
                                <asp:Label ID="LessonLb" runat="server" Text='' Font-Bold="False" />
                            </th>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseSchoolConnectionString %>" SelectCommand="SELECT [Name], [Surname], [MiddleName], [Image], [ID_Teachers], [Experience], [Position] FROM [Teachers]"></asp:SqlDataSource>
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Button" />
</asp:Content>
