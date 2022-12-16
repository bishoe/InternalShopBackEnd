using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject
{
  public  interface IProducts
    {
        Task<List<ProductsT>> GetProductsAsync();

         Task<ProductsT> GetProductsByIdAsync(int ProdouctsID);
        Task<ProductsT> GetProductbyBarcode(int Barcode);

        Task<ResponseObject> CreateProductsAsync(ProductsT products);

        Task<bool> UpdateProductsAsync(int ProdouctsID,ProductsT productsT);

        Task<bool> DeleteProductsAsync(int ProdouctsID);

    }
}
