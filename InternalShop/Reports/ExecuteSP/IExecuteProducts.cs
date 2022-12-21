using InternalShop.Models;
using System.Data.SqlClient;
using System.Runtime.InteropServices;

namespace InternalShop.Reports.ExecuteSP
{
    public interface IExecuteProducts
    {
        public IEnumerable<ProductsT> ExecuteSPProducts(string SPName, [Optional] SqlParameter ParamValue);
        public string GetHTMLString([Optional] SqlParameter ParamValue);

        public string GetHTMLStringWithoutParam();


    }
}
