using InternalShop.Models;
using Microsoft.Data.SqlClient;
using System.Runtime.InteropServices;

namespace InternalShop.Reports.ExecuteSP
{
    public interface IExecuteConvertofStores
    {
        public IEnumerable<ReportConvertofStoresT> ExecuteSPConvertofStores(string SPName, [Optional] SqlParameter ParamValue);
        public string GetHTMLString([Optional] SqlParameter ParamValue);

        public string GetHTMLStringWithoutParam();

    }
}
