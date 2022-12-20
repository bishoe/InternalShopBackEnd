using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject.MasterProductsWarehouseSVC.ProductsWarehouseSVC
{
 public   interface IProductsWarehouse
    {
//  insert products in  shop wareHouse
        Task<ResponseObject> CreateProductsWarehouse(MasterProductsWarehouseT masterProductsWarehouseT, ProductsWarehouseT ProductsWarehouseT, ProductsWarehouseObjectT productsWarehouseObjectT);

        Task <ProductsWarehouseT> GetProductsWarehouseBYIDAsync(int ManageStoreID);
        Task <ProductsWarehouseT> GetProductsWarehouseBYBillnoAsync(int Billno);
        Task <ResponseObject> GetNoColumn(int NoColumn);
        Task<ResponseObject> AddFirstRowINDB(MasterProductsWarehouseT masterProductsWarehouse);

        IEnumerable<ProductsWarehouseObjectT> GetAllProductsWarehouse(string SPName);

    }
}
