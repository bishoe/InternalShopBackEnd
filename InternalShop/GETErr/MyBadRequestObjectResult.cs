using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

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