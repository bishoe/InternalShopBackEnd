using DataBaseService;
using InternalShop.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InternalShop.Reports.ExecuteSP
{
    public class ExecuteGetAllPermissionToEntertheStoreProduct : IGetAllPermissionToEntertheStoreProduct

    {
        ApplicationDbContext _db;
        public ExecuteGetAllPermissionToEntertheStoreProduct(ApplicationDbContext db)
        {
            _db = db;
        }
        public IEnumerable<object> ExecuteSP(string SPName)
        {
            var result = _db.reportPermissionToEntertheStoreProducts.FromSqlRaw(SPName).ToList();
            return result;
        }


    }
}
