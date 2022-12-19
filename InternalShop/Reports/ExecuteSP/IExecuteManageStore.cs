using InternalShop.Models;
using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;

namespace InternalShop.Reports.ExecuteSP
{
 public   interface IExecuteManageStore
    {
        public IEnumerable<ManageStoreT> ExecuteSPManageStore(string SPName, [Optional] SqlParameter ParamValue);
        public string GetHTMLString([Optional]SqlParameter ParamValue);
        //public string GetHTMLString();

        public string GetHTMLStringWithoutParam();

    }
}
