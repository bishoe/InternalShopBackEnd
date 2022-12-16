using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject.ConvertofStoresSVC
{
 public   interface IConvertofStores
    {
         
        //Task<List<ConvertofStoresT>> GetAllConvertofStoresAsync();

        Task <ConvertofStoresT> GetConvertofStoresByidAsync(int ConvertofStoresId);

        Task<ResponseObject> CreateConvertofStoresAsync(ConvertofStoresT   convertofStoresT);

        Task<bool> UpdateConvertofStoresAsync(int ConvertofStoresId, ConvertofStoresT convertofStoresT  );
        Task<bool> DeleteConvertofStoresAsync(int ConvertofStoresId);
        public IEnumerable<object> GetAllConvertofStoresAsync(string SPName);


    }
}
