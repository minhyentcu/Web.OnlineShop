namespace Web.OnlineShop.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("About")]
    public partial class About
    {
        public long Id { get; set; }

        [StringLength(250)]
        [Display(Name = "Tên bài viết")]
        public string Name { get; set; }

        [StringLength(500)]
        [Display(Name = "Miêu tả")]
        public string Description { get; set; }

        [StringLength(250)]
        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }

        [Display(Name = "Thông tin giới thiệu")]
        [Column(TypeName = "ntext")]
        public string Detail { get; set; }
        [Display(Name = "Trạng thái")]
        public bool? Status { get; set; }
        [Display(Name = "Ngày tạo")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }
        [Display(Name = "Ngày sửa")]
        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifileBy { get; set; }
    }
}
