using System.Threading.Tasks;
using System.Net;
using System.Web.Mvc;
using Web.OnlineShop.Entity;
using Web.OnlineShop.Service;
using Web.OnlineShop.Common;
using System.Linq;

namespace Web.OnlineShop.Areas.Admin.Controllers
{

    [HasPermission(RoleID = "ALL_USER")]
    public class UserGroupController : BaseController
    {
        private readonly IUserRoleService _userRoleService;
        public UserGroupController(IUserRoleService userRoleService)
        {
            _userRoleService = userRoleService;
        }

        // GET: Admin/UserGroup
        public ActionResult Index()
        {
            return View(_userRoleService.GetUserGroups());
        }

        // GET: Admin/UserGroup/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGroup userGroup = _userRoleService.GetUserGroupById(id);
            if (userGroup == null)
            {
                return HttpNotFound();
            }
            return View(userGroup);
        }

        // GET: Admin/UserGroup/Create
        public ActionResult Create()
        {
            var model = new UserGroup();
            return View(model);
        }

        // POST: Admin/UserGroup/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name")] UserGroup userGroup)
        {
            if (ModelState.IsValid)
            {
                var result = await _userRoleService.CreateAsync(userGroup);
                if (result)
                {
                    SetAlert("Cập nhật quyền thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Cập nhật quyền không thành công", "error");
                return View(userGroup);
            }
            SetAlert("Cập nhật quyền không thành công", "error");
            return View(userGroup);
        }

        // GET: Admin/UserGroup/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGroup userGroup = _userRoleService.GetUserGroupById(id);
            if (userGroup == null)
            {
                return HttpNotFound();
            }
            return View(userGroup);
        }

        // POST: Admin/UserGroup/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name")] UserGroup userGroup)
        {
            if (ModelState.IsValid)
            {
                var result= await  _userRoleService.UpdateAsync(userGroup);
                if (result)
                {
                    SetAlert("Cập nhật quyền thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Cập nhật quyền không thành công", "error");
                return View(userGroup);
            }
            SetAlert("Cập nhật quyền không thành công", "error");
            return View(userGroup);
        }

        // GET: Admin/UserGroup/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGroup userGroup = _userRoleService.GetUserGroupById(id);
            if (userGroup == null)
            {
                return HttpNotFound();
            }
            return View(userGroup);
        }

        // POST: Admin/UserGroup/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            var result = await _userRoleService.DeleteAsync(id);
            if (result)
            {
                SetAlert("Cập nhật quyền thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Cập nhật quyền không thành công", "error");
            return RedirectToAction("Index");
        }

        public ActionResult UserGroupRole()
        {
            return View(_userRoleService.GetPermissions());
        }

        public ActionResult EditRole(string groupId)
        {
            ViewBag.GroupId = groupId;
            //ViewBag.RoleIds = _userRoleService.GetRolesByGroupId(groupId);
            ViewBag.RoleId = new SelectList(_userRoleService.GetRolesByGroupId(groupId), "Id", "Name");
            ViewBag.Permissions = _userRoleService.GetPermissionByGroup(groupId);
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> AddToRole(string userGroupId, string[] RoleId)
        {

            var result = await _userRoleService.UpdateUserRole(userGroupId, RoleId);
            if (result)
            {
                SetAlert("Cập nhật quyền thành công", "success");
                return RedirectToRoute(new { controller = "UserGroup", action = "EditRole", groupId = userGroupId });

            }
            SetAlert("Cập nhật quyền không thành công", "error");
            return RedirectToRoute(new { controller = "UserGroup", action = "EditRole", groupId = userGroupId });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteRoleFromUser(string userGroupId, string RoleId)
        {

            var result = await _userRoleService.DeletePermission(userGroupId, RoleId);
            if (result)
            {
                SetAlert("Cập nhật quyền thành công", "success");
                return RedirectToRoute(new { controller = "UserGroup", action = "EditRole", groupId = userGroupId });

            }
            SetAlert("Cập nhật quyền không thành công", "error");
            return RedirectToRoute(new { controller = "UserGroup", action = "EditRole", groupId = userGroupId });
        }
    }
}
