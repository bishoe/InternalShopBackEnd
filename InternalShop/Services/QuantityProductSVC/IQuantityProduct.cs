using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject.QuantityProductSVC
{
     public interface IQuantityProduct
    {
        Task<QuantityProductT> GetQuantityProductBYIDandManageStoreIdAsync(int manageStoreID, int ProdouctsID);
        //  public async Task<object> GetQt(int ProdouctsID, int BranchCode);
        //  Task<bool> UpdateQTafterSelling(int ProductId, QuantityProductT _ObjectQuantityProductT);
        Task<ResponseObject> AddQtProduct(  int ProdouctsID);
        IEnumerable<QuantityProductT> GetAllquantityProducts(string SPName);

        Task<ResponseObject> UpdateQTafterSelling(int ProductId, ObjectQuantityProductT _ObjectQuantityProduct);

    }
}
