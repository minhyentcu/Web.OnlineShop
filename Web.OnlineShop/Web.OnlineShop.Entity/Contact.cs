namespace Web.OnlineShop.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact")]
    public partial class Contact
    {
        public int Id { get; set; }

        [StringLength(15)]
        [Display(Name = "Số điện thoại")]
        public string Phone { get; set; }

        [StringLength(15)]
        [Display(Name = "Số điện thoại phụ")]
        public string PhoneSecond { get; set; }

        [StringLength(50)]
        [Display(Name = "E-mail")]
        public string Email { get; set; }
        [Display(Name = "Địa chỉ")]
        [StringLength(500)]
        public string Address { get; set; }
        [Display(Name = "Trạng thái")]
        public bool? Status { get; set; }
    }
}
