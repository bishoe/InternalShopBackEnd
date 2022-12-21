using InternalShop.Models;
using System.Data.SqlClient;
using System.Runtime.InteropServices;

namespace InternalShop.Reports.ExecuteSP
{
    public interface IExecuteProductsWarehouse
    {
        public IEnumerable<ReportProductsWarehouse> ExecuteSPProductsWarehouse(string SPName, [Optional] SqlParameter ParamValue);
        public string GetHTMLString([Optional] SqlParameter ParamValue);

        public string GetHTMLStringWithoutParam();

    }
}
