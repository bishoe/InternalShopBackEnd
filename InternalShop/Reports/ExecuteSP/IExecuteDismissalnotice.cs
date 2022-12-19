using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;

namespace InternalShop.Reports.ExecuteSP
{
 public   interface IExecuteDismissalnotice
    {
        public IEnumerable<ReportDismissalnotice> ExecuteSPDismissalnotice(string SPName, [Optional] SqlParameter ParamValue);
        public string GetHTMLString([Optional] SqlParameter ParamValue);
        public string GetHTMLStringWithoutParam();
    }
}
