using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Areas.Admin.Data
{
    public class ProductViewModel
    {
        public long Id { get; set; }

        public string Code { get; set; }
        public string Name { get; set; }

        public string Description { get; set; }

        public HttpPostedFileBase Image { get; set; }

        public string MoreImages { get; set; }

        public virtual long ProductCategoryId { get; set; }

        public string Detail { get; set; }

        public bool? Status { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }
    }
}