using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject.DismissalnoticeSVC
{
 public   interface IDismissalnotice
    {
        Task<List<DismissalnoticeT>> GetAllDismissalnoticeAsync();

        Task<DismissalnoticeT> GetDismissalnoticeByidAsync(int DismissalnoticeId);

        Task<ResponseObject> CreateDismissalnoticeAsync( DismissalnoticeT dismissalnotice);

        Task<bool> UpdateDismissalnoticeAsync(int IdDismissalnotice, DismissalnoticeT dismissalnotice);

        Task<bool> DeleteDismissalnoticeAsync(int DismissalnoticeId);

    }
}
