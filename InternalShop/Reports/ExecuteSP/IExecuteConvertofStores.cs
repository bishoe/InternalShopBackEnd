using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using InternalShop.ClassProject.ConvertofStoresSVC;

namespace InternalShop.Reports.ExecuteSP
{
 public   interface IExecuteConvertofStores
    {
        public IEnumerable<ReportConvertofStoresT> ExecuteSPConvertofStores(string SPName, [Optional] SqlParameter ParamValue);
        public string GetHTMLString( [Optional]SqlParameter ParamValue);
        

    }
}
