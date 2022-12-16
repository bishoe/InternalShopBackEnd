using DinkToPdf;
using DinkToPdf.Contracts;
using InternalShop.ClassProject;
using DataBaseService;
using InternalShop.Models;
using InternalShop.Reports.ExecuteSP;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Serilog;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using InternalShop.ClassProject.QuantityProductSVC;

namespace InternalShop.Controllers
{
    [Route("api/[controller]")]
    //[ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly ApplicationDbContext _db;
        private readonly IProducts _products;
        private IConverter _converter;
        private readonly IExecuteProducts  _executeProducts;

        public ProductsController(ApplicationDbContext db, IProducts products, IConverter converter, IExecuteProducts executeProducts
)
        {
            _db = db;
            _products = products;
            _converter = converter;
            _executeProducts = executeProducts;
        }
        [HttpGet]
        public async Task<IActionResult> GetALLProducts()
        {
            var _GetALLProducts = await _products.GetProductsAsync();
            if (_GetALLProducts == null)
            {
                return BadRequest();
            }
            return Ok(_GetALLProducts);
        }

      
        [HttpGet("{ProdouctsID}")]
         public async Task<IActionResult> GetProductsById( int ProdouctsID)
        {
            if ( ProdouctsID == 0)
            {
                return NotFound();
            }
            var GETPoductsBYId = await _products.GetProductsByIdAsync( ProdouctsID);

            return Ok(GETPoductsBYId);
        }
         
        [HttpGet("GetProductbyBarcode/{Barcode}")]
        public async Task<IActionResult> GetProductbyBarcode(int Barcode)
        {
            var GetProductbyName =  await   _products.GetProductbyBarcode(Barcode);
            return Ok(GetProductbyName);
        }

        [HttpPost]
        public async Task<IActionResult> CreateProducts([FromBody] ProductsT productsT)
        {

            var result = await _products.CreateProductsAsync(productsT);
           var my= productsT.ProdouctsID;
            if (result.IsValid)
            {
                return Ok(new { Message = "Added successfully" });
            }

            return BadRequest("Cannot Save");
        }

        [HttpPut("{prodouctsID}")]
        public async Task<IActionResult> UpdateProducts(int ProdouctsID, [FromBody] ProductsT productsT)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }
            try
            {
                var result = await _products.UpdateProductsAsync(ProdouctsID,   productsT);
                if (!result)
                {
                    return BadRequest();
                }
            }
            catch (Exception ex)
            {
                Log.Error("An error occurred while seeding the database  {Error} {StackTrace} {InnerException} {Source}",
                    ex.Message, ex.StackTrace, ex.InnerException, ex.Source);
                return BadRequest();
            }
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProducts(int productsId)
        {
            //var GETProductsId = await _db.Products.FindAsync(productsId);

            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest();
                }
                var GetproductsId = await _products.DeleteProductsAsync(productsId);
                if (!GetproductsId)
                {
                    return BadRequest();

                }

            }

            catch (Exception ex)
            {
                Log.Error("An error occurred while seeding the database  {Error} {StackTrace} {InnerException} {Source}",
                    ex.Message, ex.StackTrace, ex.InnerException, ex.Source);
                return BadRequest();
            }
            return Ok();


        }

        [HttpGet("ReportProducts")]
        public IActionResult ReportProducts()
        {

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\Products.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeProducts.GetHTMLString(),
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
        [HttpGet("ReportProduct/{ProdouctsID}")]
        public IActionResult ReportProduct(int ProdouctsID)
        {
            var sqlParms = new SqlParameter { ParameterName = "@ProdouctsID", Value = ProdouctsID };

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\Product.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeProducts.GetHTMLString(sqlParms),
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
 
