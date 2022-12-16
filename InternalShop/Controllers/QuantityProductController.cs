using InternalShop.ClassProject;
using InternalShop.ClassProject.QuantityProductSVC;
using DataBaseService;
using InternalShop.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.CodeAnalysis;
using System.Security.Cryptography.Xml;

namespace InternalShop.Controllers
{
    [Route("api/[controller]")]
    //[ApiController]
    public class QuantityProductController : ControllerBase
    {
        private readonly IQuantityProduct  _quantityProduct;
        private readonly ApplicationDbContext _db;
        private int GetQTFromQuantityProduct;
        public QuantityProductController(IQuantityProduct  quantityProduct, ApplicationDbContext db)
        {
            _db = db;
            _quantityProduct = quantityProduct;
 
        }
        
       // GET All QuantityProduct
       [HttpGet("GetQuantityProductBYIDandmanageStoreIDAsync/{manageStoreID}/{ProdouctsID}")]
        //[HttpGet]
        public IActionResult GetQuantityProductBYIDandmanageStoreIDAsync(int manageStoreID, int ProdouctsID)
        {
            if (ProdouctsID  is 0 || manageStoreID is 0 ) return NotFound();
            var checkexistsId = true;
            checkexistsId = _db.QuantityProducts.Any(x => x.ProdouctsID == ProdouctsID || x.manageStoreID ==manageStoreID);
            if (checkexistsId == false) return BadRequest("Cannot Find Prodouct Or Store");
            GetQTFromQuantityProduct= _db.QuantityProducts.Where(o => o.ProdouctsID == ProdouctsID)
             .Where(o => o.manageStoreID == manageStoreID)
             .FirstOrDefault().quantityProduct;

            GC.Collect();

            return Ok(GetQTFromQuantityProduct);
        }


        [HttpGet("GetQTProdouct/{ProductId}")]
        public IActionResult GetQTProdouct(int ProductId)
        {
            var checkexistsId = true;
            checkexistsId = _db.QuantityProducts.Any(x => x.ProdouctsID == ProductId );
            if (checkexistsId == false) return BadRequest("Cannot Find ProdouctID");
            GetQTFromQuantityProduct = _db.QuantityProducts.Where(x => x.ProdouctsID == ProductId).FirstOrDefault().quantityProduct;
            GC.Collect();
            return Ok(GetQTFromQuantityProduct);
        }
        [HttpGet("GetProdouctQT/{ProductId}/{MasterOFSToresID}")]
        public IActionResult GetProdouctQT(int ProductId,int MasterOFSToresID)
        {
            var checkexistsId = true;
            checkexistsId = _db.QuantityProducts.Any(x => x.ProdouctsID == ProductId && x.manageStoreID == MasterOFSToresID);
            if (checkexistsId == false) return BadRequest("Cannot Find ProdouctID Or cannot find this warehouse  to the branch");
          
           var GetQT = _db.QuantityProducts.Where(x => x.ProdouctsID == ProductId).FirstOrDefault().quantityProduct;
            
            GC.Collect();

            return Ok(GetQT);
        }
        [HttpPost]
        public async Task<IActionResult> AddQTProduct(  int ProdouctsID)
        {
            var result = await _quantityProduct.AddQtProduct(ProdouctsID);
            if (result.IsValid)
            {
                return Ok(new { Message = "Added successfully" });
            }
            return BadRequest("Cannot Save");

        }
            
        [HttpPut ("UpdateQTafterSelling/{ProductId}")]
        public async Task<IActionResult> UpdateQTafterSelling(int ProductId, [FromBody] ObjectQuantityProductT quantityProduct)
        {
           
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }

            var result = await _quantityProduct.UpdateQTafterSelling(ProductId, quantityProduct);

            if (result.IsValid)
            {

                return Ok(new { Message = "Update successfully" });
            }

            return NoContent();

        }
    }
}
