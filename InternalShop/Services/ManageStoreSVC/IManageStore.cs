using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject.MasterOFSToresSVC
{
 public   interface IManageStore
    {

        // insert products in stores 
        //ManageStoreT   MasterOFstores 
        Task<List<ManageStoreT>> GetAllManageStoreAsync();

        Task<ManageStoreT> GetManageStoreByidAsync(int ManageStoreId);

        Task<ResponseObject> CreateManageStoreAsync(ManageStoreT   ManageStoreT);

        Task<bool> UpdateManageStoreAsync(int ManageStoreId, ManageStoreT  ManageStoreT );

        Task<bool> DeleteManageStoreAsync(int ManageStoreId);

    }
}
