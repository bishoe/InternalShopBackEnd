using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject.PermissionToEntertheStoreProductSVC
{
  public  interface IPermissionToEntertheStoreProduct
    {

        //Task<List<PermissionToEntertheStoreProductT>> GetAllPermissionToEntertheStoreProductAsync();

        Task<PermissionToEntertheStoreProductT> GetPermissionToEntertheStoreProductByidAsync(int PermissionToEntertheStoreProductId);

        Task<ResponseObject> CreatePermissionToEntertheStoreProductAsync(PermissionToEntertheStoreProductT PermissionToEntertheStoreProduct  );

        Task<bool> UpdatePermissionToEntertheStoreProductAsync(int PermissionToEntertheStoreProductId, PermissionToEntertheStoreProductT PermissionToEntertheStoreProduct );

        Task<bool> DeletePermissionToEntertheStoreProductAsync(int PermissionToEntertheStoreProductId);
        public IEnumerable<object> GetAllPermissionToEntertheStoreProductAsync(string SPName);


    }
}
