using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Web.OnlineShop.Entity
{
    [Table("Slide")]
    public partial class Slide
    {
        public int Id { get; set; }

        [StringLength(250)]
        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }
        [Display(Name = "Thứ tự hiển thị")]
        public int? DisplayOrder { get; set; }

        [StringLength(250)]
        [Display(Name = "Liên kết")]
        public string Link { get; set; }

        [StringLength(250)]
        [Display(Name = "Miêu tả")]
        public string Descripstion { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }
        [Display(Name = "Ngày sửa")]
        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifileBy { get; set; }
        [Display(Name = "Ngày tạo")]
        public DateTime? CreatedDate { get; set; }
        [Display(Name = "Trạng thái")]
        public bool? Status { get; set; }
    }
}
