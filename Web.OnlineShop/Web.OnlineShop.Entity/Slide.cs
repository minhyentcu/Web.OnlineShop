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

        [Required(ErrorMessage = ("Tiêu đề không được bỏ trống"))]
        [StringLength(250)]
        [Display(Name = "Tiêu đề Slide")]
        public string Name { get; set; }

        [StringLength(250)]
        [Display(Name = "Miêu tả")]
        [Required(ErrorMessage = ("Miêu tả không được bỏ trống"))]
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
        //[Required(ErrorMessage = ("Trạng thái không được bỏ trống"))]
        public bool? Status { get; set; }
    }
}
