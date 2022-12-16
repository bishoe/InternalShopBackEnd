using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject.SuppliersSVC
{
    public interface ISuppliers
    {
               Task<List<SuppliersT>> GETALLSuppliersASYNC();
        Task<SuppliersT> GETSupplierByidASYNC(int SuppliersID);

        Task<ResponseObject> CreateSuppliers(SuppliersT suppliersT );

        Task<bool> UpdateSuppliers(int SuppliersID, SuppliersT suppliersT);


    }
}
