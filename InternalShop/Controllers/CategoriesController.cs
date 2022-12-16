using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using InternalShop.ClassProject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using InternalShop.Models;
using Serilog;
 using System.Data.SqlClient;
using DinkToPdf;
using System.IO;
using DinkToPdf.Contracts;
using InternalShop.Reports.ExecuteSP;
using DataBaseService;

namespace OnlineShop.Controllers
{
    [Route("api/[controller]")]
    //[ApiController]
    public class CategoriesController : ControllerBase
    {
        private readonly ICategories _categories;
        private readonly ApplicationDbContext _db;
        IConverter _converter; IExecuteCategories _executeCategories;
        public CategoriesController(ICategories categories, ApplicationDbContext db, IConverter converter, IExecuteCategories executeCategories
)
        {
            _db = db;
            _categories = categories;
            _converter = converter;
            _executeCategories = executeCategories;

        }
        // GET All Categories
        [HttpGet]
        public async Task<IActionResult> GetCategories()
        {
            var categories = await _categories.GeTCategoriesAsync();

            return Ok(categories);
        }
        //[Route("[action]")]
        // GETById api/Categories/1
        [HttpGet("{CategoryProductId}")]
        public async Task<IActionResult> GeTCategoriesById(int CategoryProductId)
        {

            if (CategoryProductId == 0) return NotFound();
            var geTcategoriesbyid = await _categories.GeTCategoriesByIdAsync(CategoryProductId);



            return Ok(geTcategoriesbyid);

        }
        [HttpPost]
        public async Task<IActionResult> CreateCategories([FromBody] CategoriesT categoriesViewModel)
        {

            // Will hold all the errors related to registration

            var result = await _categories.CreateCategoriesAsync(categoriesViewModel);


            if (result.IsValid)
            {
                // Don't reveal that the user does not exist or is not confirmed
                return Ok(new { Message = "Added successfully" });
            }
            return BadRequest("Cannot Save");


        }
        [HttpPut("{CategoryProductId}")]
        public async Task<IActionResult> UpdateCategories(int CategoryProductId, [FromBody] CategoriesT categories)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _categories.UpdateCategoriesAsync(CategoryProductId, categories);

            if (result.IsValid)
            {

                return Ok(new { Message = "Added successfully" });
            }

            return NoContent();
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCategories(int categoryProductId)
        {



            if (!ModelState.IsValid) return BadRequest();

            var GETCategoryProductId = await _categories.DeleteCategoriesAsync(categoryProductId);
            if (!GETCategoryProductId)
            {
                return BadRequest();

            }

            return NoContent();
        }
        [HttpGet("ReportCategories")]
        public IActionResult ReportCategories()
        {

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\Categories.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeCategories.GetHTMLString(),
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
        [HttpGet("ReportReportCategorie-{CategoryProductId}")]
        public IActionResult ReportProduct(int CategoryProductId)
        {
            var sqlParms = new SqlParameter { ParameterName = "@CategoryProductId", Value = CategoryProductId };

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\Category.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeCategories.GetHTMLString(sqlParms),
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
