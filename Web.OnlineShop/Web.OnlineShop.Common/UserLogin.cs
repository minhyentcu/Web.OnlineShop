﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.OnlineShop.Common
{
    [Serializable]
   public class UserLogin
    {
        public long UserId { get; set; }

        public string UserName { get; set; }

        public string GroupID { set; get; }
    }
}
