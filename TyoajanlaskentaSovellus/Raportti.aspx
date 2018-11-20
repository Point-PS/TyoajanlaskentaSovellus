<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Raportti.aspx.cs" Inherits="TyoajanlaskentaSovellus.WebForm1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=14.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Raportointi</title>
    <style>
        html, body, form, #div1 {
            height: 429px;
            width: 919px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div style="width: 1040px">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            Hae raportti ajalle:
            <asp:TextBox ID="txtFrom" runat="server">YYYY-MM-DD</asp:TextBox> / <asp:TextBox ID="txtTo" runat="server">YYYY-MM-DD</asp:TextBox>
            <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="HAE" />
            <br />
            <br />
            <!--
            Hae henkilon Id:llä: 
            <asp:TextBox ID="txtHenkiloId" runat="server">Henkilö ID</asp:TextBox> 
            <asp:Button ID="btnHaeHenkiloId" runat="server" OnClick="btnHaeHenkiloId_Click" Text="HAE" />
            <br />
            <br />
            -->
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%" style="margin-right: 28px" SizeToReportContent="True">
                <LocalReport ReportPath="Raportti.rdlc">
                           <datasources>
                               <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                           </datasources>
                </LocalReport>
            </rsweb:ReportViewer>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="TyoajanlaskentaSovellus.scrumDatabaseDataSet1TableAdapters.uspAlkuPvmJaLoppuPvmParametreinaTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="alkuPvm" Type="DateTime" />
                <asp:Parameter Name="loppuPvm" Type="DateTime" />
            </SelectParameters>
        </asp:ObjectDataSource>
            </div>
    </form>
</body>
</html>