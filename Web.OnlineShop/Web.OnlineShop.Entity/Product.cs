namespace Web.OnlineShop.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.ComponentModel.Design;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public long Id { get; set; }

        [StringLength(50)]
        public string Code { get; set; }

        [StringLength(250)]
        [Display(Name = "Tên sản phẩm")]
        public string Name { get; set; }

        [StringLength(500)]
        [Display(Name = "Miêu tả")]
        public string Description { get; set; }

        [StringLength(250)]
        [Display(Name = "Hình ảnh")]
        public string Image { get; set; }

        [Column(TypeName = "xml")]
        [Display(Name = "Hình ảnh miêu tả")]
        public string MoreImages { get; set; }

        [Display(Name = "Danh mục sản phẩm")]
        public virtual long ProductCategoryId { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Thông tin sản phẩm")]
        public string Detail { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Thông số kỹ thuật")]
        public string Specifications { get; set; }

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

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        [StringLength(250)]
        public string MetaDescription { get; set; }

        public virtual ProductCategory ProductCategory { get; set; }
    }
}
