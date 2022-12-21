using InternalShop.Models;
using Microsoft.Data.SqlClient;
using System.Runtime.InteropServices;
namespace InternalShop.Reports.ExecuteSP
{
    public interface IExecuteBranches
    {
        public IEnumerable<BranchesT> ExecuteSPBranches(string SPName, [Optional] SqlParameter ParamValue);
        public string GetHTMLString([Optional] SqlParameter ParamValue);
        public string GetHTMLStringWithoutParam();


    }
}
