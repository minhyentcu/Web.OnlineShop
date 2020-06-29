using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web.Mvc;
using Web.OnlineShop.Areas.Admin.Data;
using Web.OnlineShop.Common;
using Web.OnlineShop.Entity;
using Web.OnlineShop.Service;

namespace Web.OnlineShop.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        private readonly IUserService _userService;
        public LoginController(IUserService userService)
        {
            _userService = userService;
        }
        // GET: Admin/Login
        public ActionResult Index()
        {
            var model = new LoginModel();
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var result = await _userService.LoginAsync(model.UserName, Encryptor.MD5Hash(model.Password));
                if (result)
                {
                    var user = await _userService.GetUserByUserName(model.UserName);
                    var userSession = new UserLogin
                    {
                        UserId = user.Id,
                        UserName = user.UserName,
                        GroupID = user.GroupId
                    };
                    var permissions = _userService.GetPermissions(model.UserName);
                    Session.Add(CommonConstants.SESSION_PERMISSION, permissions);
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return Redirect("/");
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu sai.");
                }
            }
            return View("Index", model);
        }

        [HttpGet]
        public ActionResult SignUp()
        {
            var model = new RegisterModel();
            return View(model);
        }

        [HttpPost]
        public ActionResult SignUp(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                var user = new User
                {
                    UserName = model.UserName,
                    Password = model.Password,
                    Email = model.Email,
                    Name = model.Name,
                    Phone = model.Phone
                };
                _userService.SignUp(user);
                return RedirectToAction("Index", "Home");
            }
            return View(model);
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return Redirect("/");
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        public async Task<ActionResult> ForgotPassword(string email)
        {
            string message = string.Empty;
            var status = false;
            var code = await _userService.ForgotPassword(email);
            if (!string.IsNullOrEmpty(code))
            {
                return Redirect("/reset-password-" + code);
            }
            return View();
        }


        public ActionResult ResetPassword(string id)
        {
            //verify the reset password link

            var user = _userService.GetUserByCode(id);
            if (user != null)
            {
                var model = new ResetPasswordViewModel()
                {
                    ResetCodePassword = id
                };
                return View(model);
            }
            return HttpNotFound();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var result = await _userService.ResetPassword(model.ResetCodePassword, model.NewPassword);
                if (result)
                {
                    return Redirect("/dang-nhap");
                }
                return View(model);
            }

            return View(model);
        }


        [NonAction]
        public void SendVerificationLinkEmail(string emailID, string activationCode)
        {
            var verifyUrl = "/User/VerifyAccount/" + activationCode;
            var link = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, verifyUrl);

            var fromEmail = new MailAddress("phamminhyen2d@gmail.com", "Fogot Password");
            var toEmail = new MailAddress(emailID);
            var fromEmailPassword = "Ngoalong123";
            string subject = "Forgot password";
            string body = "Nhấn vào link để reset password " + "<a href=" + link + ">Reset password link</a>";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromEmail.Address, fromEmailPassword)

            };

            using (var message = new MailMessage(fromEmail, toEmail)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
                smtp.Send(message);
        }
    }
}