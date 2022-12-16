//using InternalShop.Models;
//using InternalShop.Reports.ExecuteSP;
//using InternalShop.Reports.ReportSalesInvoice;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;

//namespace InternalShop.Reports.ReportCategories
//{
//    public class ReportCategories : IExecuteCategories
//    {
//        private readonly IExecuteCategories _executeSp;

//        public IEnumerable<CategoriesT> ExecuteSPCategories(string SPName)
//        {
//            throw new NotImplementedException();
//        }

//        public string GetHTMLString()
//        {

//            //var sqlParms = new Microsoft.Data.SqlClient.SqlParameter { ParameterName = "@BranchCode", Value = ParamValue };

//            var CategoriesObject = _executeSp.ExecuteSPCategories("dbo.SP_CreateReportCategories");

//            var sb = new StringBuilder();
//            sb.Append(@"
//                        <html>
//                            <head>
   

//                            </ head>
//                            <body>
//<img src='' alt='Girl in a jacket' width='' height=''>
//                                <table align='center'>
//                                    <tr>
//                                         <th>CategoryName</th>
//                                        <th>DateAdd</th>
 

 
//                                    </tr>");
//            foreach (var _CategoriesObject in CategoriesObject)
//            {
//                sb.AppendFormat(@"<tr>
//                                    <td>{0}</td>
//                                    <td>{1}</td>
//                                     </tr>
//",
// _CategoriesObject.CategoryName,
// _CategoriesObject.DateAdd
//          );
//            }
//            sb.Append(@"</table></body></html>");


//            return sb.ToString();
//        }

      
//    }
//}
  
