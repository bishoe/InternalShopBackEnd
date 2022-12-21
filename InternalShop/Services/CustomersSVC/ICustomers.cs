using InternalShop.Models;

namespace InternalShop.ClassProject.CustomersSVC
{
    public interface ICustomers
    {


        Task<ResponseObject> CreateCustomersAsync(CustomersT customersT);

        Task<bool> UpdateCustomersAsync(int CustomerId, CustomersT customersT);

        Task<List<CustomersT>> GETCustomersAsync();

        Task<CustomersT> GETCustomersBYIdAsync(int CustomerId);
        Task<bool> DeleteCustomersAsync(int CustomerId);


    }
}
