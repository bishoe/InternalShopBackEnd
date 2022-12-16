using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject.CustomersSVC
{
 public interface ICustomers
    {


          Task<ResponseObject> CreateCustomersAsync(CustomersT customersT);

         Task <bool> UpdateCustomersAsync(int CustomerId,CustomersT customersT );

        Task <List<CustomersT>> GETCustomersAsync();

        Task<CustomersT> GETCustomersBYIdAsync(int CustomerId);
        Task<bool> DeleteCustomersAsync(int CustomerId);

 
    }
}
