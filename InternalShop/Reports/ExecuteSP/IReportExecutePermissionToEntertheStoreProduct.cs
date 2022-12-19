using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
namespace InternalShop.Reports.ExecuteSP
{
 public   interface IReportExecutePermissionToEntertheStoreProduct
    {
        public IEnumerable<ReportPermissionToEntertheStoreProduct> ExecuteSPPermissionToEntertheStoreProduct(string SPName, [Optional] SqlParameter ParamValue);
        public string GetHTMLString( [Optional]SqlParameter ParamValue);

        public string GetHTMLStringWithoutParam();

    }

}
