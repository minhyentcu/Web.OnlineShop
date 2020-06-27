using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace Web.OnlineShop.Entity
{
    [Table("Feedback")]
    public partial class Feedback
    {
        public int Id { get; set; }

        [StringLength(50)]
        [Display(Name = "Tên người dùng")]
        public string Name { get; set; }

        [StringLength(50)]
        [Display(Name = "Số điện thoại")]
        public string Phone { get; set; }

        [StringLength(50)]
        [Display(Name = "E-mail")]
        public string Email { get; set; }

        [StringLength(50)]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }
        [Display(Name = "Ngày tạo")]
        public DateTime? CreatedDate { get; set; }

        [Display(Name = "Trạng thái")]
        public bool? Status { get; set; }

        [StringLength(500)]
        [Display(Name = "Ý kiến khách hàng")]
        public string Content { get; set; }
    }
}
