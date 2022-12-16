﻿using DataBaseService;
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

namespace InternalShop.Reports.ExecuteSP
{
    public class ExecuteBranches : IExecuteBranches
    {
        private readonly ApplicationDbContext _db;
        public ExecuteBranches(ApplicationDbContext db)
        {
            _db = db;
        }
        public IEnumerable<BranchesT> ExecuteSPBranches(string SPName, [Optional] SqlParameter ParamValue)
        {
            var result = _db.Branches.FromSqlRaw(SPName, ParamValue).ToList();
            _db.Dispose();
            return (result);
        }

        //public IEnumerable<BranchesT> ExecuteSPBranches(string SPName)
        //{
        //    var result = _db.reportSalesInvoiceByIds.FromSqlRaw(SPName).ToList();

        //    return ((IEnumerable<BranchesT>)result);
        //}


        public string GetHTMLString(SqlParameter ParamValue)
        {
            //var sqlParms = new Microsoft.Data.SqlClient.SqlParameter { ParameterName = "@BranchCode", Value = ParamValue };

            var BranchesObject
                =
ExecuteSPBranches("dbo.SP_CreateReportBranchesBYCode @BranchCode", ParamValue);

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
                                         <th style='text-align: center;'>BranchID</th>
                                        <th style='text-align: center;'>كود الفرع</th>
                                        <th style='text-align: center;'>اسم الفرع</th>
                                        <th style='text-align: center;'>عنوان الفرع</th>
                                         <th style='text-align: center;'>هاتف الفرع</th>
                                         <th style='text-align: center;'>هاتف الفرع الثانى</th>
 

 
                                    </tr>");
            foreach (var _BranchesObject in BranchesObject)
            {
                sb.AppendFormat(@"<tr>
                                    <td style='text-align: center;'>{0}</td>
                                    <td style='text-align: center;'>{1}</td>
                                    <td style='text-align: center;'>{2}</td>
                                    <td style='text-align: center;'>{3}</td>
                                    <td style='text-align: center;'>{4}</td>
                                    <td style='text-align: center;'>{5}</td>
 
                                    </tr>",
 _BranchesObject.BranchID,
 _BranchesObject.BranchCode,
                             _BranchesObject.BranchName,
                            _BranchesObject.BranchAddress,
_BranchesObject.BranchPhone,
_BranchesObject.BranchMobile
//,_BranchesObject.ManageStorename

);
            }
            sb.Append(@"</table></body></html>");


            return sb.ToString();
        }

        public string GetHTMLString()
        {

            var BranchesObject
                =
ExecuteSPBranches("dbo.SP_CreateReportBranches");

            var sb = new StringBuilder();
            sb.Append(@"
                        <html>
                            <head>
   

                            </ head>
                            <body>
<img src='' alt='Girl in a jacket' width='' height=''>
                                <table align='center'>
                                    <tr>
                                         <th>BranchID</th>
                                        <th>BranchCode</th>
                                        <th>BranchName</th>
                                        <th>BranchAddress</th>
                                         <th>BranchPhone</th>
                                         <th>BranchMobile</th>
                                         <th>WearhouseBranche</th>


 
                                    </tr>");
            foreach (var _BranchesObject in BranchesObject)
            {
                sb.AppendFormat(@"<tr>
                                    <td>{0}</td>
                                    <td>{1}</td>
                                    <td>{2}</td>
                                    <td>{3}</td>
                                    <td>{4}</td>
                                    <td>{5}</td>
                                   
                                    </tr>
",
 _BranchesObject.BranchID,
 _BranchesObject.BranchCode,
 _BranchesObject.BranchName,
 _BranchesObject.BranchAddress,
_BranchesObject.BranchPhone,
_BranchesObject.BranchMobile);
            }
            sb.Append(@"</table></body></html>");


            return sb.ToString();
        }
    }
}

