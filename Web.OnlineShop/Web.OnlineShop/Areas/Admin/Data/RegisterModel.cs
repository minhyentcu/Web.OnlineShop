using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web.OnlineShop.Areas.Admin.Data
{
    public class RegisterModel
    {
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage ="Yêu cầu nhập tên đăng nhập")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Yêu cầu nhập mật khẩu")]
        [Display(Name = "Mật khẩu")]
        [StringLength(30, MinimumLength = 6, ErrorMessage = "Mật khẩu phải có ít nhất 6 ký tự")]
        public string Password { get; set; }
        [Required(ErrorMessage = "Yêu cầu xác nhận mật khẩu")]
        [Display(Name = "Xác nhận mật khẩu")]
        [Compare("Password", ErrorMessage = "Xác nhận mật khẩu không đúng")]
        public string ConfirmPassword { get; set; }
        [Required(ErrorMessage = "Yêu cầu nhập tên người dùng")]
        [Display(Name = "Họ tên")]
        public string Name { get; set; }
        [Display(Name = "Điện thoại")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "Yêu cầu nhập email")]
        [Display(Name = "E-mail")]
        public string Email { get; set; }
    }
}