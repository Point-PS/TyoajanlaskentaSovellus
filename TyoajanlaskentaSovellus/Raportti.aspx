<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="TyoajanlaskentaSovellus.WebForm1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=14.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Raportointi</title>
    <style>
        html, body, form, #div1 {
            height: 429px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <br />
            Hae raportti ajalle:
            <asp:TextBox ID="txtFrom" runat="server">YYYY-MM-DD</asp:TextBox>&nbsp; /
            <asp:TextBox ID="txtTo" runat="server">YYYY-MM-DD</asp:TextBox>&nbsp;
            <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="SHOW" />
            <br />
            <br />
            <rsweb:ReportViewer ID="rptViewer" runat="server" Height="80%" Width="100%" Style="margin-bottom: 64px" BorderStyle="Solid" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" DocumentMapWidth="90%" SizeToReportContent="True" EnableTheming="True" CssClass="ActiveLink">
                <LocalReport ReportPath="Report1.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="AzureTehtavaMvc.TestiDataSetTableAdapters.uspAlkuPvmJaLoppuPvmParametreinaTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="AzureTehtavaMvc.AsiakastietokantaDataSetTableAdapters.uspAlkuPvmJaLoppuPvmParametreinaTableAdapter"></asp:ObjectDataSource>
        </div>
    </form>
</body>
</html>
