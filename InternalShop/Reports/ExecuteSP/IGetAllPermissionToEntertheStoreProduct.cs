using Microsoft.Data.SqlClient;
using System.Collections.Generic;

namespace InternalShop.Reports.ExecuteSP
{
    public interface IGetAllPermissionToEntertheStoreProduct
    {
        public IEnumerable<object> ExecuteSP(string SPName);

    }
}
