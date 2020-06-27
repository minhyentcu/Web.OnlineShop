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
                        GroupID=user.GroupId
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
    }
}