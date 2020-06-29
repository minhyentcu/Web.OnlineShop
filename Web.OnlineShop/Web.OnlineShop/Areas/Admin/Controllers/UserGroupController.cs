using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Web.OnlineShop.Entity;
using Web.OnlineShop.Service;

namespace Web.OnlineShop.Areas.Admin.Controllers
{
    public class UserGroupController : Controller
    {
        private OnlineShopDbContext db = new OnlineShopDbContext();

        private readonly IUserRoleService _userRoleService;
        public UserGroupController(IUserRoleService userRoleService)
        {
            _userRoleService = userRoleService;
        }

        // GET: Admin/UserGroup
        public async Task<ActionResult> Index()
        {
            return View(await db.UserGroups.ToListAsync());
        }

        // GET: Admin/UserGroup/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGroup userGroup = await db.UserGroups.FindAsync(id);
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
                db.UserGroups.Add(userGroup);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(userGroup);
        }

        // GET: Admin/UserGroup/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGroup userGroup = await db.UserGroups.FindAsync(id);
            if (userGroup == null)
            {
                return HttpNotFound();
            }
            return View(userGroup);
        }

        // POST: Admin/UserGroup/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name")] UserGroup userGroup)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userGroup).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(userGroup);
        }

        // GET: Admin/UserGroup/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            UserGroup userGroup = await db.UserGroups.FindAsync(id);
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
            UserGroup userGroup = await db.UserGroups.FindAsync(id);
            db.UserGroups.Remove(userGroup);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        public ActionResult UserGroupRole()
        {
            return View( db.Permissions.AsEnumerable());
        }

        public ActionResult EditRole(string groupId)
        {
            ViewBag.GroupId = groupId;
            //ViewBag.RoleIds = _userRoleService.GetRolesByGroupId(groupId);
            ViewBag.RoleId = new SelectList(_userRoleService.GetRolesByGroupId(groupId), "Id", "Name");
            ViewBag.Permissions = _userRoleService.GetPermissionByGroup(groupId);
            var model = new Permission();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddToRole(string userGroupId,string[] RoleId)
        {
            return View("EditRole", userGroupId);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }


    }
}
