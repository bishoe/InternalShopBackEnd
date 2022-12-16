using DataBaseService;
using DinkToPdf;
using DinkToPdf.Contracts;
using InternalShop.ClassProject.BranchesSVC;
using InternalShop.Models;
using InternalShop.Reports.ExecuteSP;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
 using System.IO;
using Microsoft.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace InternalShop.Controllers
{
    [Route("api/[controller]")]
    //[ApiController]
    public class BranchesController : ControllerBase
    {
        private readonly IBranches _Branches;
        private IConverter _converter;
        private readonly IExecuteBranches _executeBranches;

        public BranchesController(IBranches branches, IConverter converter, IExecuteBranches executeBranches)
        {
            
            _Branches = branches;
            _converter = converter;
            _executeBranches = executeBranches;
        }
        [HttpGet]
        //[Authorize]

        public async Task<IActionResult> GETALLBRANCHESASYNC()
        {
            var branches = await _Branches.GETALLBRANCHESASYNC();

            return Ok(branches);

        }

        [HttpGet("ReportBranches")]
        public IActionResult ReportBranches()
        {

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\Branches.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeBranches.GetHTMLString(),
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
        [HttpGet("ReportBRANCHEBranchCode/{BranchCode}")]
        public IActionResult ReportBRANCHEBranchCode(int BranchCode)
        {
             var sqlParms = new  SqlParameter { ParameterName = "@BranchCode", Value = BranchCode };

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\Branch.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeBranches.GetHTMLString(sqlParms),
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


        [HttpGet("{BranchCode}")]
        public async Task<IActionResult> GETBRANCHByidASYNC(int BranchCode)
        {
            if (BranchCode == 0) return NotFound();
            var geTBranchCode = await _Branches.GETBRANCHByidASYNC(BranchCode);



            return Ok(geTBranchCode);
        }

        [HttpPost]
        public async Task<IActionResult> CreateBranches([FromBody] BranchesT branches)
        {

            // Will hold all the errors related to registration

            var result = await _Branches.CreateBranches(branches);


            if (result.IsValid)
            {
                // Don't reveal that the user does not exist or is not confirmed
                return Ok(new { Message = "Added successfully" });
            }
            return BadRequest("Cannot Save");


        }
        [HttpPut("{BranchCode}")]
        public async Task<IActionResult> UpdateBranches( int BranchCode, [FromBody]BranchesT branches)
        {

            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _Branches.UpdateBranches( BranchCode, branches );

            if (!result)
            {
                return BadRequest();
            }

            return NoContent();
        }

    }
}

