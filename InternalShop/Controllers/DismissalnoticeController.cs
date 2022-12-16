using DinkToPdf;
using DinkToPdf.Contracts;
using InternalShop.ClassProject.DismissalnoticeSVC;
using DataBaseService;
using InternalShop.Models;
using InternalShop.Reports.ExecuteSP;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.Controllers
{
    [Route("api/[controller]")]
    //[ApiController]
    public class DismissalnoticeController : ControllerBase
    {
        private readonly ApplicationDbContext _db;
        private readonly IDismissalnotice _dismissalnotice;
        private IConverter _converter;

        private readonly IExecuteDismissalnotice  _executeDismissalnotice;

        public DismissalnoticeController(ApplicationDbContext db,
          IDismissalnotice dismissalnotice, IExecuteDismissalnotice executeDismissalnotice, IConverter converter)
        {
            _db = db;
            _dismissalnotice = dismissalnotice;
            _converter = converter;
            _executeDismissalnotice = executeDismissalnotice;
        }
        [HttpGet]
        public async Task<IActionResult> GetAllDismissalnoticeAsync()
        {
         var GetAllDismissalnotice= await  _dismissalnotice.GetAllDismissalnoticeAsync();

            return Ok(GetAllDismissalnotice);
        }
        [HttpGet("{DismissalnoticeId}")]
        
        public async Task<IActionResult> GetDismissalnoticeByidAsync(int DismissalnoticeId)
        {
            var GetDismissalnoticeId = await _dismissalnotice.GetDismissalnoticeByidAsync(DismissalnoticeId);


            return Ok(GetDismissalnoticeId);
        }

        
        
        [HttpPost]
        public async Task<IActionResult> CreateDismissalnoticeAsync([FromBody] DismissalnoticeT dismissalnotice)
        {
            var result = await _dismissalnotice.CreateDismissalnoticeAsync(dismissalnotice);
            if (result.IsValid) return Ok(new { Message = "Success" });
            
            return BadRequest("Cannot Save");


        }
        [HttpPut("{DismissalnoticeId}")]
        public async Task<IActionResult> UpdateDismissalnoticeAsync([FromBody] DismissalnoticeT DismissalnoticeT, int DismissalnoticeId)
        {

            if (!ModelState.IsValid) return BadRequest();

            var result = await _dismissalnotice.UpdateDismissalnoticeAsync(DismissalnoticeId, DismissalnoticeT);
            if (!result) return BadRequest();

            return NoContent();


        }
        [HttpDelete("{DismissalnoticeId}")]
        public async Task<IActionResult> DeleteDismissalnoticeAsync(int DismissalnoticeId)
        {
    if (!ModelState.IsValid) return BadRequest();
            var GETDismissalnoticeId = await _dismissalnotice.DeleteDismissalnoticeAsync(DismissalnoticeId);
            if (!GETDismissalnoticeId) return BadRequest();
            return Ok();
        }
        [HttpGet("ReportDismissalnotice")]
       
        public IActionResult ReportDismissalnotice()
        {

             var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\AllDismissalnotice.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeDismissalnotice.GetHTMLString(),
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

        [HttpGet("ReportDismissalnoticeById/{DismissalnoticeId}")]
        public IActionResult ReportDismissalnoticeById(int DismissalnoticeId)
        {
            var sqlParms = new   SqlParameter { ParameterName = "@DismissalnoticeId", Value = DismissalnoticeId };

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\ReportDismissalnotice.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeDismissalnotice.GetHTMLString(sqlParms),
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
