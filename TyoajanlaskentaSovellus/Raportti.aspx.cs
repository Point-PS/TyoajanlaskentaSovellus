using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;

namespace TyoajanlaskentaSovellus
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShow_Click(object sender, EventArgs e)
        {
            ShowReport();
        }
        private void ShowReport()
        {
            // reset
            ReportViewer1.Reset();

            // datasource
            DataTable dt = GetData(DateTime.Parse(txtFrom.Text), DateTime.Parse(txtTo.Text));
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);

            ReportViewer1.LocalReport.DataSources.Add(rds);

            // path
            ReportViewer1.LocalReport.ReportPath = "Raportti.rdlc";

            // parameters
            ReportParameter[] rptParams = new ReportParameter[]
            {
                new ReportParameter("fromDate",txtFrom.Text),
            new ReportParameter("toDate",txtTo.Text)
            };
            ReportViewer1.LocalReport.SetParameters(rptParams);
            // refresh
            ReportViewer1.LocalReport.Refresh();
        }
        private DataTable GetData(DateTime fromDate, DateTime toDate)
        {
            DataTable dt = new DataTable();
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["scrumDatabaseConnectionString"].ConnectionString;
            using (SqlConnection cn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("uspAlkuPvmJaLoppuPvmParametreina", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@alkuPvm", SqlDbType.DateTime).Value = fromDate;
                cmd.Parameters.Add("@loppuPvm", SqlDbType.DateTime).Value = toDate;

                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
            }
            return dt;
        }

        protected void btnHaeHenkiloId_Click(object sender, EventArgs e)
        {
            ShowReportHenk();
        }
        private void ShowReportHenk()
        {
            // reset
            ReportViewer1.Reset();

            // datasource
            DataTable dtHenk = GetDataHenk(int.Parse(txtHenkiloId.Text));
            ReportDataSource rdsHenk = new ReportDataSource("DataDet2", dtHenk);

            ReportViewer1.LocalReport.DataSources.Add(rdsHenk);

            // path
            ReportViewer1.LocalReport.ReportPath = "RaporttiHenkiloId.rdlc";

            // parameters
            ReportParameter[] rptHenkParams = new ReportParameter[]
            {
                new ReportParameter("henkiloidpara",txtHenkiloId.Text)
            };
            ReportViewer1.LocalReport.SetParameters(rptHenkParams);
            // refresh
            ReportViewer1.LocalReport.Refresh();
        }
        private DataTable GetDataHenk(int henkiloId)
        {
            DataTable dtHenk = new DataTable();
            string connStrHenk = System.Configuration.ConfigurationManager.ConnectionStrings["scrumDatabaseConnectionString"].ConnectionString;
            using (SqlConnection cnHenk = new SqlConnection(connStrHenk))
            {
                SqlCommand cmdHenk = new SqlCommand("uspHenkiloIdParametrina", cnHenk);
                cmdHenk.CommandType = CommandType.StoredProcedure;
                cmdHenk.Parameters.Add("@henkiloidpara", SqlDbType.Int).Value = henkiloId;

                SqlDataAdapter adpHenk = new SqlDataAdapter(cmdHenk);
                adpHenk.Fill(dtHenk);
            }
            return dtHenk;
        }
    }
}
