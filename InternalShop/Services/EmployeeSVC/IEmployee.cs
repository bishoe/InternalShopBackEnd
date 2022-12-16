using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject
{
   public interface IEmployee
    {

        Task<List<EmployeesT>> GETEmployeesAsync();

        Task<EmployeesT> GetEmployeesByIdAsync(int EmployeeId);

        Task<ResponseObject> CreateEmployeesAsync(EmployeesT employeeT);

        Task<bool> UpdateEmployeesAsync(  int EmployeeId, EmployeesT employeeT);
        Task<bool> DeleteEmployeesAsync(int EmployeeId);

    }
}
