using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;

namespace InternalShop.Reports.ReportSalesInvoice
{
    public interface IReportS
    {
        //public IEnumerable<ReportSalesInvoiceById> CreateReportSalesInvoice(string SPName, Microsoft.Data.SqlClient.SqlParameter ParamValue);
        public string GetHTMLString([Optional]int ParamValue);
    }
}
