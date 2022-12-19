
using DinkToPdf;
using DinkToPdf.Contracts;
using InternalShop.ClassProject;
using InternalShop.ClassProject.EmployeeSVC;
using InternalShop.ClassProject.MasterOFSToresSVC;
using InternalShop.Models;
using InternalShop.Reports.ExecuteSP;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.IO;
using System.Threading.Tasks;

namespace InternalShop.Controllers
{
    [Route("api/[controller]")]

    public class ManageStoreController : ControllerBase
    {
        private readonly ApplicationDbContext _db;
        private readonly IManageStore _manageStore;
        private readonly IExecuteManageStore _executeManageStore;
        private IConverter _converter;

        public ManageStoreController(ApplicationDbContext db,IManageStore manageStore, IExecuteManageStore executeManageStore,IConverter converter)
        {
            _db = db;   
             _manageStore = manageStore;
            _executeManageStore = executeManageStore;
            _converter = converter;

        }
        [HttpGet]
        public async Task <IActionResult> GETALLStore()
        {
            var GetAllStore = await _manageStore.GetAllManageStoreAsync();

            return Ok(GetAllStore);
        }
        [HttpGet("{ManageStoreID}")]
        public async Task<IActionResult> GETStoreById(int ManageStoreID)
        {
            if (ManageStoreID == 0) return NotFound();
            var GetStoreByid = await _manageStore.GetManageStoreByidAsync(ManageStoreID);
            return Ok(GetStoreByid);

        }

        [HttpPost]
        public async Task<IActionResult> CreateManageStoreAsync([FromBody] ManageStoreT manageStore)
        {
            var result = await _manageStore.CreateManageStoreAsync(manageStore);
            if (result.IsValid)
            {

                return Ok(new { Message = "Added successfully" });
            }
            return BadRequest("Cannot Save");


        }

        [HttpPut("{ManageStoreID}")]
        public async Task<IActionResult> UpdateManageStore([FromBody] ManageStoreT manageStore, int ManageStoreID)
        {
            if (!ModelState.IsValid) return BadRequest();

            var result = await _manageStore.UpdateManageStoreAsync(ManageStoreID, manageStore);
            if (!result)
                return BadRequest();
            return NoContent();

        }
        [HttpGet("ReportManageStore/{ManageStoreId}")]
        public IActionResult ReportManageStore(int ManageStoreId)
        {
            var sqlParms = new SqlParameter { ParameterName = "@ManageStoreId", Value = ManageStoreId };

            //return Ok(branches);
            var globalSettings = new GlobalSettings
            {
                ColorMode = ColorMode.Color,
                Orientation = Orientation.Portrait,
                PaperSize = PaperKind.A4,
                Margins = new MarginSettings { Top = 10 },
                DocumentTitle = "PDF Report",

                Out = @"D:\PDFCreator\ReportManageStore.pdf"
            };
            var objectSettings = new ObjectSettings
            {

                PagesCount = true,
                ProduceForms = true,
                HtmlContent = _executeManageStore.GetHTMLString(sqlParms),
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
