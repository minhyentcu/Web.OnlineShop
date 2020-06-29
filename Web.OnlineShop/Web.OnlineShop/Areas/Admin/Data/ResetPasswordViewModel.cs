using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Web.OnlineShop.Areas.Admin.Data
{
    public class ResetPasswordViewModel
    {
        [Required]
        public string NewPassword { get; set; }

        [Required]
        [Compare("NewPassword",ErrorMessage ="Mật khẩu xác nhận không chính xác.")]
        public string ConfirmPassword { get; set; }

        public string ResetCodePassword { get; set; }
    }
}