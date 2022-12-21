using System.Runtime.InteropServices;

namespace InternalShop.Reports.ReportSalesInvoice
{
    public interface IReportS
    {
        //public IEnumerable<ReportSalesInvoiceById> CreateReportSalesInvoice(string SPName, Microsoft.Data.SqlClient.SqlParameter ParamValue);
        public string GetHTMLString([Optional] int ParamValue);
    }
}
