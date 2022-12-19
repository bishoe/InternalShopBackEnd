﻿using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InternalShop
{
    public class Appuser :IdentityUser
    {
        public string FullName { get; set; }
        public DateTime DateCreated { get; set; }

        public DateTime DateModified { get; set; }
    }
}
