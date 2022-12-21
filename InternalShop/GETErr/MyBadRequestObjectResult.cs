using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;

namespace InternalShop.GETErr
{
    public class MyBadRequestObjectResult : BadRequestObjectResult, IClientErrorActionResult
    {
        public MyBadRequestObjectResult() : base((object)null)
        {
        }

        public MyBadRequestObjectResult(object error) : base(error)
        {
        }
    }
}