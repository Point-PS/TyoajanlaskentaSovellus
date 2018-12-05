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
    }
}
