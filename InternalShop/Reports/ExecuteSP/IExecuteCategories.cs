using InternalShop.Models;
using System.Data.Sql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace InternalShop.Reports.ExecuteSP
{
    public interface IExecuteCategories
    {

        public IEnumerable<CategoriesT> ExecuteSPCategories([Optional] string SPName
                  );
        public string GetHTMLString([Optional] SqlParameter ParamValue);
        //public string GetHTMLString();

    }
}
