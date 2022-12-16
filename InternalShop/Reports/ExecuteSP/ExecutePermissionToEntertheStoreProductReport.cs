using DataBaseService;
using InternalShop.Models;
using Microsoft.EntityFrameworkCore;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using Stimulsoft.Svg.ExCSS;
using Microsoft.Data.SqlClient;
using DinkToPdf.Contracts;

namespace InternalShop.Reports.ExecuteSP
{
    public class ExecutePermissionToEntertheStoreProductReport : IReportExecutePermissionToEntertheStoreProduct
    {
        private readonly ApplicationDbContext _db;


        public ExecutePermissionToEntertheStoreProductReport(ApplicationDbContext db)
        {
            _db = db; 
        }
        public IEnumerable<ReportPermissionToEntertheStoreProduct> ExecuteSPPermissionToEntertheStoreProduct(string SPName, [Optional] SqlParameter ParamValue)
        {
            var result = _db.PermissionToEntertheStoreProduct.FromSqlRaw(SPName, ParamValue).ToList();
            _db.Dispose();
            return ((IEnumerable<ReportPermissionToEntertheStoreProduct>)result);
        }

        public string GetHTMLString(SqlParameter ParamValue)
        {
 
            var PermissionToEntertheStoreProductObject
                =
ExecuteSPPermissionToEntertheStoreProduct("dbo.SP_PermissionToEntertheStoreProductById @PermissionToEntertheStoreProductId", ParamValue);

            var sb = new StringBuilder();
            sb.Append(@"
                        <html>
                            <head>
   <link rel='Stylesheet' href='StyleSheet.css'>

                            </ head>
                            <body>
<img src='' alt='Girl in a jacket' width='' height=''>
 <table align='center'   style='margin: 0 0 40px 0;color:blue;
    width: 100%;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
    display: table; direction: rtl;'>
 <tr>
                                         <th style='text-align: center;'>رقم اذن الصرف</th>
                                        <th style='text-align: center;'>اسم المخزن</th>
                                        <th style='text-align: center;'>اسم المنتج</th>
                                        <th style='text-align: center;'>الكميه</th>
  

 
                                    </tr>");
            foreach (var _PermissionToEntertheStoreProductObject in PermissionToEntertheStoreProductObject)
            {
                sb.AppendFormat(@"<tr>
                                    <td style='text-align: center;'>{0}</td>
                                    <td style='text-align: center;'>{1}</td>
                                    <td style='text-align: center;'>{2}</td>
  
                                    </tr>",
 _PermissionToEntertheStoreProductObject.PermissionToEntertheStoreProductId,
 _PermissionToEntertheStoreProductObject.ManageStorename,
                             _PermissionToEntertheStoreProductObject.ProdouctName,
 _PermissionToEntertheStoreProductObject.quantityProduct

);
            }
            sb.Append(@"</table></body></html>");


            return sb.ToString();
        }

        public string GetHTMLString()
        {

            var PermissionToEntertheStoreProductObject
                =
ExecuteSPPermissionToEntertheStoreProduct("dbo.SP_PermissionToEntertheStoreProduct");

            var sb = new StringBuilder();
            sb.Append(@"
                        <html>
                            <head>
   

                            </ head>
                            <body>
<img src='' alt='Girl in a jacket' width='' height=''>
                                <table align='center'>
                                    <tr>
                                         <th style='text-align: center;'>رقم اذن الصرف</th>
                                        <th style='text-align: center;'>اسم المخزن</th>
                                        <th style='text-align: center;'>اسم المنتج</th>
                                        <th style='text-align: center;'>الكميه</th>


 
                                    </tr>");
            foreach (var _PermissionToEntertheStoreProductObject in PermissionToEntertheStoreProductObject)
            {
                sb.AppendFormat(@"<tr>
                                    <td style='text-align: center;'>{0}</td>
                                    <td style='text-align: center;'>{1}</td>
                                    <td style='text-align: center;'>{2}</td>
                                   
                                    </tr>
",
 _PermissionToEntertheStoreProductObject.PermissionToEntertheStoreProductId,
 _PermissionToEntertheStoreProductObject.ManageStorename,
                             _PermissionToEntertheStoreProductObject.ProdouctName,
 _PermissionToEntertheStoreProductObject.quantityProduct
);
            }
            sb.Append(@"</table></body></html>");


            return sb.ToString();
        }
    }
}

