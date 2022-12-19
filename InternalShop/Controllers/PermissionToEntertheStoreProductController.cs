using InternalShop.ClassProject.PermissionToEntertheStoreProductSVC;

using InternalShop.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using DinkToPdf.Contracts;
using InternalShop.Reports.ExecuteSP;
using DinkToPdf;
using System.IO;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace InternalShop.Controllers
{
    [Route("api/[controller]")]
    //[ApiController]
    public class PermissionToEntertheStoreProductController : ControllerBase
    {
          private IConverter _converter;
        private readonly ApplicationDbContext _db;

        private readonly IPermissionToEntertheStoreProduct _IPermissionToEntertheStoreProduct;
        private readonly IReportExecutePermissionToEntertheStoreProduct _reportExecutePermissionToEntertheStoreProduct;

 
        //private readonly IGetAllPermissionToEntertheStoreProduct _getAllPermissionToEntertheStoreProduct;

 
        public PermissionToEntertheStoreProductController(



            IConverter converter,
            ApplicationDbContext db,
            IPermissionToEntertheStoreProduct IPermissionToEntertheStoreProduct,

      //IGetAllPermissionToEntertheStoreProduct getAllPermissionToEntertheStoreProduct ,
    
      IReportExecutePermissionToEntertheStoreProduct  reportExecutePermissionToEntertheStoreProduct

 
            )
        {
              _converter = converter; 
            _db = db;
            _IPermissionToEntertheStoreProduct = IPermissionToEntertheStoreProduct;
            //_getAllPermissionToEntertheStoreProduct = getAllPermissionToEntertheStoreProduct;
            _reportExecutePermissionToEntertheStoreProduct = reportExecutePermissionToEntertheStoreProduct;
          }
        [HttpGet]
        public IActionResult GetAllPermissionToEntertheStoreProduct()
        {
            try
            {
                //var bv =await  _db.PermissionToEntertheStoreProduct.Include
                //        (Per => Per.Products).
                //        ThenInclude(s => s.PermissionToEntertheStoreProduct).ThenInclude(MStore => MStore.ManageStore)
                //        .OrderBy(p => p.Products.ProdouctName).ToList();

                //var GetAllPermissionToEntertheStoreProductAsync = await _IPermissionToEntertheStoreProduct.GetAllPermissionToEntertheStoreProductAsync();

                //var sqlParms = new SqlParameter { ParameterName = "@SellingMasterID", Value = ParamValue };

                var ExecuteSPObject = _IPermissionToEntertheStoreProduct.GetAllPermissionToEntertheStoreProductAsync("dbo.SP_PermissionToEntertheStoreProduct");

                return Ok(ExecuteSPObject);
            }
            catch (Exception ex)
            {

                throw ex.InnerException;
            }



        }


        [HttpGet("{PermissionToEntertheStoreProductId}")]
   public async Task<IActionResult> GetPermissionToEntertheStoreProductByidAsync(int PermissionToEntertheStoreProductId)
        {
            if (PermissionToEntertheStoreProductId == 0) return NotFound();

            var PermissionToEntertheStoreProductIdById = await _IPermissionToEntertheStoreProduct.GetPermissionToEntertheStoreProductByidAsync(PermissionToEntertheStoreProductId);

            return Ok(PermissionToEntertheStoreProductIdById);


        }
    
    
    [HttpPost]
    public async Task<IActionResult> CreatePermissionToEntertheStoreProductAsync([FromBody] PermissionToEntertheStoreProductT PermissionToEntertheStoreProduct)
        {

            var AddPermissionToEntertheStoreProduct = await _IPermissionToEntertheStoreProduct.CreatePermissionToEntertheStoreProductAsync(PermissionToEntertheStoreProduct);

            if (AddPermissionToEntertheStoreProduct.IsValid)
            {
              return Ok(new {   AddPermissionToEntertheStoreProduct.Message});
                //return Ok(new { Message = "Success" });

            }
            return BadRequest("Cannot Save");

        }

        [HttpPut("{PermissionToEntertheStoreProductId}")]
        public async Task<IActionResult> UpdatePermissionToEntertheStoreProductAsync([FromBody] int PermissionToEntertheStoreProductId, [FromBody] PermissionToEntertheStoreProductT PermissionToEntertheStoreProduct)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _IPermissionToEntertheStoreProduct.UpdatePermissionToEntertheStoreProductAsync(PermissionToEntertheStoreProductId,PermissionToEntertheStoreProduct);

            if (!result)
            {
                return BadRequest();
            }

            return NoContent();
        }
        [HttpDelete("{PermissionToEntertheStoreProductId}")]
        public async Task<IActionResult> DeletePermissionToEntertheStoreProductAsync(int PermissionToEntertheStoreProductId)
        {
            if (!ModelState.IsValid) return BadRequest();
            var GETPermissionToEntertheStoreProductId = await _IPermissionToEntertheStoreProduct.DeletePermissionToEntertheStoreProductAsync(PermissionToEntertheStoreProductId);
            if (!GETPermissionToEntertheStoreProductId) return BadRequest();

            return NoContent();
        }

        [HttpGet("ReportPermissionToEntertheStoreProduct/{PermissionToEntertheStoreProductId}")]
        public IActionResult ReportPermissionToEntertheStoreProduct(int PermissionToEntertheStoreProductId)
        {
            var sqlParms = new SqlParameter { ParameterName = "@PermissionToEntertheStoreProductId", Value = PermissionToEntertheStoreProductId };

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\ReportPermissionToEntertheStoreProduct.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _reportExecutePermissionToEntertheStoreProduct.GetHTMLString(sqlParms),
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
