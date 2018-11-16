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
            rptViewer.Reset();

            // datasource
            DataTable dt = GetData(DateTime.Parse(txtFrom.Text), DateTime.Parse(txtTo.Text));
            ReportDataSource rds = new ReportDataSource("DataSet1", dt);

            rptViewer.LocalReport.DataSources.Add(rds);

            // path
            rptViewer.LocalReport.ReportPath = "Raportti1.rdlc";

            // parameters
            ReportParameter[] rptParams = new ReportParameter[]
            {
                new ReportParameter("fromDate",txtFrom.Text),
            new ReportParameter("toDate",txtTo.Text)
            };
            rptViewer.LocalReport.SetParameters(rptParams);
            // refresh
            rptViewer.LocalReport.Refresh();
        }
        private DataTable GetData(DateTime fromDate, DateTime toDate)
        {
            DataTable dt = new DataTable();
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["AsiakastietokantaConnectionString"].ConnectionString;
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
    }
}