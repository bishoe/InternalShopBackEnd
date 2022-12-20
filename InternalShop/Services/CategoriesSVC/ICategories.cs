using Microsoft.AspNetCore.Http;
using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject
{
   public interface ICategories
    {
           IEnumerable<CategoriesT> GeTCategoriesAsync(string SPName);
          Task<CategoriesT> GeTCategoriesByIdAsync(int CategoryProductId);

          Task<ResponseObject> CreateCategoriesAsync(CategoriesT categoriesViewModel);

          Task<ResponseObject> UpdateCategoriesAsync(int CategoryProductId,CategoriesT  categories);

        Task<bool> DeleteCategoriesAsync(int CategoryProductId);

    }
}
