using InternalShop.Models;
using InternalShop.Reports.ReportSalesInvoice;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;

namespace InternalShop.Reports.ExecuteSP
{
    public class ExcuteSpSalesInvoice : IExecuteSPSalesInvoice
    {
        private readonly ApplicationDbContext _db;
        public ExcuteSpSalesInvoice(ApplicationDbContext db)
        {
            _db = db;
        }
        public IEnumerable<ReportSalesInvoiceById> ExecuteSPSalesInvoice(string SPName,  SqlParameter ParamValue)
        {
            //var sqlParms = new Microsoft.Data.SqlClient.SqlParameter { ParameterName = "ParamName", Value = ParamValue };
            //var result = _db.reportSalesInvoiceByIds.FromSqlRaw("'" + SPName + "'"  + "@"+ParamName , sqlParms).ToList();
            var result = _db.reportSalesInvoiceByIds.FromSqlRaw(SPName, ParamValue).ToList();

            return (result);



        }


    }
}
