using InternalShop.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject.BranchesSVC
{
 public   interface IBranches

    {

        IEnumerable< BranchesReportT>   GETALLBRANCHESASYNC(string SPName);
        Task<BranchesT> GETBRANCHByidASYNC(int BranchCode);

        Task<ResponseObject> CreateBranches(BranchesT branches);

        Task<bool> UpdateBranches(int BranchCode, BranchesT branches);


    }
}
