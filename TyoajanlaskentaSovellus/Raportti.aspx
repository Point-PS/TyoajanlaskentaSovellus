<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Raportti.aspx.cs" Inherits="TyoajanlaskentaSovellus.WebForm1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=14.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<!DOCTYPE html>
<head>
    <title>Raportointi</title>
    <style>
        html, body, form, #div1 {

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
            height: 36px;
            width: 199px;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div style="width: 1074px">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            &nbsp;

            Hae työaikaraportti ajalle:

            <asp:TextBox ID="txtFrom" runat="server" type="date" name="date" min="2000-01-01" max="2100-01-01" lang="fi" required>YYYY-MM-DD</asp:TextBox> / <asp:TextBox ID="txtTo" runat="server" type="date" name="date" min="2000-01-01" max="2100-01-01" lang="fi" required>YYYY-MM-DD</asp:TextBox>
            <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="Näytä raportti" Height="25px" style="margin-left: 10px" />
            &nbsp;<br />
            <br />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%" style="margin-right: 28px" SizeToReportContent="True" Height="377px">
                <LocalReport ReportPath="Raportti.rdlc">
                           <datasources>
                               <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1" />
                           </datasources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="TyoajanlaskentaSovellus.scrumDatabaseDataSet1TableAdapters.uspAlkuPvmJaLoppuPvmParametreinaTableAdapter"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="TyoajanlaskentaSovellus.scrumDatabaseDataSet1TableAdapters.TunnitTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_TuntiId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="HenkiloId" Type="Int32" />
                    <asp:Parameter Name="TyoId" Type="Int32" />
                    <asp:Parameter DbType="Time" Name="Tuntimaara" />
                    <asp:Parameter Name="Paivamaara" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HenkiloId" Type="Int32" />
                    <asp:Parameter Name="TyoId" Type="Int32" />
                    <asp:Parameter DbType="Time" Name="Tuntimaara" />
                    <asp:Parameter Name="Paivamaara" Type="DateTime" />
                    <asp:Parameter Name="Original_TuntiId" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="TyoajanlaskentaSovellus.scrumDatabaseDataSet1TableAdapters.HenkilotTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_HenkiloId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Etunimi" Type="String" />
                    <asp:Parameter Name="Sukunimi" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Etunimi" Type="String" />
                    <asp:Parameter Name="Sukunimi" Type="String" />
                    <asp:Parameter Name="Original_HenkiloId" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            </div>
    </form>
</body>
</html>