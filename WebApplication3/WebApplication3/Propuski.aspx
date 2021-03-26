<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="School.WebForm1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/Propuski.css" rel="stylesheet" />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:Button CssClass="button" ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />

    <div class="report"> 
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="1326px" Height="800px">
        </rsweb:ReportViewer>
    </div>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceKlass" DataTextField="Column1" DataValueField="id_klass" Font-Size="14pt" Height="30px" Width="150px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceKlass" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseSchoolConnectionString1 %>" SelectCommand="select concat(Number, ' ', Bukva), id_klass from klass"></asp:SqlDataSource>

</asp:Content>
