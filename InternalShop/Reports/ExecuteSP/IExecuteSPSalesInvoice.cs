using InternalShop.Models;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
 using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
 namespace InternalShop.Reports.ExecuteSP
{
    public interface   IExecuteSPSalesInvoice
    {
         public IEnumerable<ReportSalesInvoiceById> ExecuteSPSalesInvoice(string SPName,[Optional]SqlParameter ParamValue);

 
    }
}
