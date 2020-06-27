namespace Web.OnlineShop.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MenuType")]
    public partial class MenuType
    {
        public int Id { get; set; }

        [StringLength(50)]
        [Display(Name = "Kiểu Menu")]
        public string Name { get; set; }
    }
}
