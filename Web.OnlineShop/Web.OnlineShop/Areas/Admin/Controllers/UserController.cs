using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Web.OnlineShop.Common;
using Web.OnlineShop.Entity;
using Web.OnlineShop.Service;

namespace Web.OnlineShop.Areas.Admin.Controllers
{
    [HasPermission(RoleID = "ALL_USER")]
    public class UserController : BaseController
    {
        private readonly IUserService _userService;
        private readonly IUserRoleService _userRoleService;

        public UserController(IUserService userService, IUserRoleService userRoleService)
        {
            _userService = userService;
            _userRoleService = userRoleService;
        }

        // GET: Admin/User
        [HttpGet]
        public ActionResult Index()
        {
            var users = _userService.GetAll();

            return View(users);
        }

        // GET: Admin/User/Details/5
        public async Task<ActionResult> Details(long id)
        {
            var user = await _userService.GetUserById(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Admin/User/Create
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.GroupId = new SelectList(_userRoleService.GetUserGroups(), "Id", "Name");
            var user = new User();
            return View(user);
        }

        // POST: Admin/User/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(Entity.User user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    user.Password = Encryptor.MD5Hash(user.Password);
                    await _userService.CreateAsync(user);
                    return RedirectToAction("Index");
                }
                ModelState.AddModelError("", "Thêm người dùng thất bại.");
                return View(nameof(Index));
            }
            catch
            {
                return View(nameof(Index));
            }
        }

        // GET: Admin/User/Edit/5
        [HttpGet]
        public async Task<ActionResult> Edit(long id)
        {
            ViewBag.GroupId = new SelectList(_userRoleService.GetUserGroups(), "Id", "Name");
            var user = await _userService.GetUserById(id);
            if (user == null)
            {
                return HttpNotFound();
            }

            return View(user);
        }

        // POST: Admin/User/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(User model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var user = _userService.GetUserById(model.Id);
                    if (user == null)
                    {
                        return HttpNotFound();
                    }
                    model.Password = Encryptor.MD5Hash(model.Password);
                    _userService.UpdateAsync(model);
                    return RedirectToAction("Index");
                }
                ModelState.AddModelError("", "Cập nhật thông tin người dùng thất bại.");
                ViewBag.GroupId = new SelectList(_userRoleService.GetUserGroups(), "Id", "Name");
                return View(nameof(Index));
            }
            catch
            {
                ViewBag.GroupId = new SelectList(_userRoleService.GetUserGroups(), "Id", "Name");
                return View(nameof(Index));
            }
        }

        // GET: Admin/User/Delete/5
        [HttpGet]
        public async Task<ActionResult> Delete(long id)
        {
            var user = await _userService.GetUserById(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Admin/User/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(int id)
        {
            try
            {
                var result = await _userService.DeleteAsync(id);
                if (result)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Xóa thông tin người dùng thất bại.");
                    return View(nameof(Index));
                }
            }
            catch
            {
                return View(nameof(Index));
            }
        }

        [HttpGet]
        public async Task<ActionResult> UserGroup()
        {
            var model = new UserGroup();
            return View(model);
        }

        [HttpGet]
        public async Task<ActionResult> UserGroup(UserGroup group)
        {

            var model = new UserGroup();
            return View(model);
        }
    }
}
