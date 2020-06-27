using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace Web.OnlineShop.Entity
{
    [Table("Content")]
    public partial class Content
    {
        public long Id { get; set; }

        [StringLength(250)]
        [Display(Name = "Tên bài viết")]
        public string Name { get; set; }

        [Display(Name = "Miêu tả")]
        [StringLength(500)]
        public string Description { get; set; }

        [StringLength(250)]
        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }

        [Display(Name = "Danh mục bài viết")]
        public virtual long CategoryId { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Thông tin bài viết")]
        public string Detail { get; set; }
        [Display(Name = "Trạng thái")]
        public bool? Status { get; set; }
        [Display(Name = "Ngày tạo")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifileBy { get; set; }

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        [StringLength(250)]
        public string MetaDescription { get; set; }

        [Display(Name = "Lượt xem")]
        public int? ViewCount { get; set; }

        [StringLength(500)]
        public string Tag { get; set; }

        public virtual Category Category { get; set; }


    }
}
