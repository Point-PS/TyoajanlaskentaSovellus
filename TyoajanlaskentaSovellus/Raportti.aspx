<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Raportti.aspx.cs" Inherits="TyoajanlaskentaSovellus.WebForm1" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=14.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>


<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>    
<html>
<head>  
<title>Raportointi</title>
<style> 
html, body, form {
}
#ReportViewer1 {
  margin-left: 10%;
}
#div1 {
    }
#div2 {
  text-align: center;
  width: 100%;
  background-color: black;
    }
#btnShow {
    border-style: none;
        border-color: inherit;
        border-width: medium;
        display: inline-block;
        padding: 5px 25px;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        outline: none;
        color: #fff;
        background-color: black;
        border-radius: 5px;
        box-shadow: 0 9px #999;
}
#btnShow:hover {
  background-color: #fff;
  color: black;
}
#btnShow:active {
  background-color: #fff;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="div2">
                <br />
                <asp:Label ID="Label1" runat="server" BackColor="Black" ForeColor="White" Text="Hae työaikaraportti ajalle:  "></asp:Label>
            <asp:TextBox ID="txtFrom" runat="server"  type="date" name="date" min="2000-01-01" max="2100-01-01" lang="fi" required BackColor="Black" BorderColor="Black" ForeColor="White" style="text-align: center" ToolTip="Anna haluttu pvm">YYYY-MM-DD</asp:TextBox> /<asp:Label ID="Label2" runat="server" ForeColor="White" Text="-"></asp:Label>
&nbsp;<asp:TextBox ID="txtTo" runat="server" type="date" name="date" min="2000-01-01" max="2100-01-01" lang="fi" BackColor="black" required ForeColor="White" BorderColor="Black" style="text-align: center" ToolTip="Anna haluttu pvm">YYYY-MM-DD</asp:TextBox>
            <asp:Button ID="btnShow" runat="server" OnClick="btnShow_Click" Text="Näytä raportti" />
            &nbsp;
            <br />
            <br />
                </div>
            <div id="div1">
            <asp:ScriptManager runat="server"></asp:ScriptManager>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="100%" SizeToReportContent="True" Height="377px" style="text-align: left">
                <LocalReport ReportPath="Raportti.rdlc">
                           <datasources>
                               <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet1" />
                           </datasources>
                </LocalReport>
            </rsweb:ReportViewer>
                </div>
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