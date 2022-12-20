using InternalShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.ClassProject.SalesinvoiceSVC
{
    public interface ISalesinvoice
    {
        // public   Task<ResponseObject> CreateSalesinvoiceAsync(SalesinvoiceMasterT salesinvoiceMaster  ,
        //        SalesinvoiceT salesinvoice,SalesinvoiceObject salesinvoiceObject);
        //}
        public Task<ResponseObject> CreateSalesinvoiceAsync(   SalesinvoiceObject salesinvoiceObject);

        IEnumerable<SalesinvoiceObject> GetAllsalesinvoice(string SPName);   
        /// <summary>
        /// Get new Invoice Report
        /// </summary>
        //public bool GetInvoiceReportByID(int SellingMasterID);
    }


}
