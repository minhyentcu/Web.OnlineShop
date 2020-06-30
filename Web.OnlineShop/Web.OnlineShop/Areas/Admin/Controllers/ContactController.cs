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
using Web.OnlineShop.Common;

namespace Web.OnlineShop.Areas.Admin.Controllers
{
    public class ContactController : BaseController
    {
        private readonly IContactService _contactService;
        public ContactController(IContactService contactService)
        {
            _contactService = contactService;
        }
        // GET: Admin/Contacts
        [HasPermission(RoleID = "ALL_ROLE,VIEW_ROLE")]
        public ActionResult Index()
        {
            var models = _contactService.Contacts(false);
            return View(models);
        }

        // GET: Admin/Contacts/Details/5
        [HasPermission(RoleID = "ALL_ROLE,VIEW_ROLE")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var contact = _contactService.GetContactById(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }
        [HasPermission(RoleID = "ALL_ROLE,INSERT_ROLE")]
        // GET: Admin/Contacts/Create
        public ActionResult Create()
        {
            var model = new Contact();
            return View(model);
        }
        [HasPermission(RoleID = "ALL_ROLE,INSERT_ROLE")]
        // POST: Admin/Contacts/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create( Contact contact)
        {
            if (ModelState.IsValid)
            {
                var result = await _contactService.Create(contact);
                if (result)
                {
                    SetAlert("Thêm bài viết thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Thêm bài viết không thành công", "error");
                return View(contact);
            }
            SetAlert("Thêm bài viết không thành công", "error");
            return View(contact);
        }

        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        // GET: Admin/Contacts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var contact = _contactService.GetContactById(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // POST: Admin/Contacts/Edit/5
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit( Contact contact)
        {
            if (ModelState.IsValid)
            {
                var result = await _contactService.Update(contact);
                if (result)
                {
                    SetAlert("Cập nhật thông tin liên hệ thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Cập nhật thông tin liên hệ không thành công", "error");
                return View(contact);
            }
            SetAlert("Cập nhật thông tin liên hệ không thành công", "error");
            return View(contact);
        }

        // GET: Admin/Contacts/Delete/5
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var contact = _contactService.GetContactById(id);
            if (contact == null)
            {
                return HttpNotFound();
            }
            return View(contact);
        }

        // POST: Admin/Contacts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            var result = await _contactService.Delete(id);
            if (result)
            {
                SetAlert("Xóa bài viết thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Xóa bài viết không thành công", "error");
            return RedirectToAction("Index");
        }
    }
}
