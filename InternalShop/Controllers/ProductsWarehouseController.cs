using InternalShop.ClassProject.MasterProductsWarehouseSVC.ProductsWarehouseSVC;
using InternalShop.ClassProject.MasterProductsWarehouseSVC;
using DataBaseService;
using InternalShop.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DinkToPdf;
using System.IO;
using System.Data.SqlClient;
using DinkToPdf.Contracts;
using InternalShop.Reports.ExecuteSP;

namespace InternalShop.Controllers
{
    [Route("api/[controller]")]
    //[ApiController]
    public class ProductsWarehouseController : ControllerBase
    {
        private readonly ApplicationDbContext _db;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private IConverter _converter;
        private readonly IExecuteProductsWarehouse _executeProductsWarehouse;


        //private readonly IMasterProductsWarehouse _masterProductsWarehouse;
        private readonly IProductsWarehouse _productsWarehouse;


        public ProductsWarehouseController(ApplicationDbContext db, IProductsWarehouse productsWarehouse, IHttpContextAccessor httpContextAccessor, IConverter converter, IExecuteProductsWarehouse executeProductsWarehouse
            //, IMasterProductsWarehouse masterProductsWarehouse
            )
        {
            _db = db;
            //_masterProductsWarehouse = masterProductsWarehouse;
            _productsWarehouse = productsWarehouse;
            this._httpContextAccessor = httpContextAccessor;
            _executeProductsWarehouse = executeProductsWarehouse;
        }
        //[HttpGet]
        //public async Task<IActionResult> GETCustomersAsync()
        //{
        //    var GETCustomers = await _customers.GETCustomersAsync();
        //    return Ok(GETCustomers);
        //}
        //[HttpGet("{id}")]
        //public async Task<IActionResult> GetProductsWarehouseBYBillnoAsync(int Billno)

        //{
        //    if (Billno == 0) return NotFound();

        //    var GetProductsWarehouseBYBill = await _productsWarehouse.GetProductsWarehouseBYBillnoAsync(Billno);

        //    return Ok(GetProductsWarehouseBYBill);

        //}
        //[HttpGet("{ManageStoreID}")]
        //public async Task<IActionResult> GetProductsWarehouseBYIDAsync(int ManageStoreID)

        //{
        //    if (ManageStoreID == 0) return NotFound();

        //    var GetProductsWarehouseBYManageStoreID = await _productsWarehouse.GetProductsWarehouseBYIDAsync(ManageStoreID);

        //    return Ok(GetProductsWarehouseBYManageStoreID);

        //}
       
        [HttpPost]
        public async Task<IActionResult> CreateProductsWarehouse(  [FromBody] ProductsWarehouseObjectT ProductsWarehouseModel )
        {
            object GetNoColumn = ProductsWarehouseModel.Nocolumn;

            //Delete the cookie object  
            MasterProductsWarehouseT masterProductsWarehouse =new();
            //ProductsWarehouseObjectT productsWarehouseObjectT = new();
            ProductsWarehouseT productsWarehouseT = new();
            //int NoColumn;

            var AddProductsWarehouseModelresult = await _productsWarehouse.CreateProductsWarehouse(masterProductsWarehouse, productsWarehouseT, ProductsWarehouseModel);

            //var AddProductsWarehouseModelresult = await _productsWarehouse.AddFirstRowINDB(masterProductsWarehouse);

            if (AddProductsWarehouseModelresult.IsValid)
            {
           return Ok(new { Message = "Added successfully", masterProductsWarehouse.ManageStoreID }) ;
                //return Ok(new { Message = "Success" });

            }
            return BadRequest("Cannot Save");

        }


        [HttpGet("GetSellingPrice/{ProdouctsID}")]
        public IActionResult GetSellingPrice( int ProdouctsID)
        {
            var checkexistsId = true;

            checkexistsId=   _db.ProductsWarehouse.Any(x => x.ProdouctsID == ProdouctsID);
            if (checkexistsId is false) return BadRequest("Cannot Find Prodouct");

            var GetSellingPrice = _db.ProductsWarehouse.Where(x => x.ProdouctsID == ProdouctsID).FirstOrDefault().SellingPrice;

            GC.Collect();

            return Ok(GetSellingPrice);







        }
         
        public IActionResult ReportAllProductsWarehouse()
        {

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\AllProductsWarehouse.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeProductsWarehouse.GetHTMLString(),
                WebSettings = { DefaultEncoding = "utf-8", UserStyleSheet = Path.Combine(Directory.GetCurrentDirectory(), "assets", "styles.css") },
                HeaderSettings = { FontName = "Arial", FontSize = 9, Right = "Page [page] of [toPage]", Line = true },
                FooterSettings = { FontName = "Arial", FontSize = 9, Line = true, Center = "Report Footer" }
            };
            var pdf = new HtmlToPdfDocument()
            {

                GlobalSettings = globalSettings,
                Objects = { objectSettings }
            };
            _converter.Convert(pdf);
            return Ok("Successfully created PDF document.");

        }
        [HttpGet("ReportProductsWarehouse/{ManageStoreID}")]
        public IActionResult ReportProductsWarehouse(int ManageStoreID)
        {
            var sqlParms = new SqlParameter { ParameterName = "@ManageStoreID", Value = ManageStoreID };

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\ProductsWarehouse.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeProductsWarehouse.GetHTMLString(sqlParms),
                WebSettings = { DefaultEncoding = "utf-8", UserStyleSheet = Path.Combine(Directory.GetCurrentDirectory(), "assets", "styles.css") },
                HeaderSettings = { FontName = "Arial", FontSize = 9, Right = "Page [page] of [toPage]", Line = true },
                FooterSettings = { FontName = "Arial", FontSize = 9, Line = true, Center = "Report Footer" }
            };
            var pdf = new HtmlToPdfDocument()
            {

                GlobalSettings = globalSettings,
                Objects = { objectSettings }
            };
            _converter.Convert(pdf);

            return Ok("Successfully created PDF document.");

        }

    }

}
 
