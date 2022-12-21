using InternalShop.Models;
using Microsoft.Data.SqlClient;
using System.Runtime.InteropServices;
namespace InternalShop.Reports.ExecuteSP
{
    public interface IExecuteSPSalesInvoice
    {
        public IEnumerable<ReportSalesInvoiceById> ExecuteSPSalesInvoice(string SPName, [Optional] SqlParameter ParamValue);


    }
}
