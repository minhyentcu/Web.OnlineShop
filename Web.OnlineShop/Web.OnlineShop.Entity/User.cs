using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Web.OnlineShop.Entity
{
    [Table("User")]
    public partial class User
    {
        public long Id { get; set; }

        [StringLength(50)]
        [Display(Name = "Tên đăng nhập")]
        public string UserName { get; set; }

        [StringLength(50)]
        [Display(Name = "Mật khẩu")]
        public string Password { get; set; }

        [StringLength(100)]
        [Display(Name = "Tên người dùng")]
        public string Name { get; set; }

        [StringLength(250)]
        [Display(Name = "Địa chỉ")]
        public string Address { get; set; }

        [StringLength(50)]
        [Display(Name = "Số điện thoại")]
        public string Phone { get; set; }

        [StringLength(50)]
        [Display(Name = "E-mail")]
        public string Email { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifileBy { get; set; }

        public bool Status { get; set; }

        [StringLength(20)]
        public string GroupId { get; set; }

        public string ResetCodePassword { get; set; }

        public virtual UserGroup UserGroup { get; set; }
    }
}
