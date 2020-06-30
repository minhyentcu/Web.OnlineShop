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
using Web.OnlineShop.Common;
using Web.OnlineShop.Service;

namespace Web.OnlineShop.Areas.Admin.Controllers
{

    public class CategoryController : BaseController
    {
        private readonly ICategoryService _categoryService;
        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        [HasPermission(RoleID = "ALL_ROLE,VIEW_ROLE")]
        // GET: Admin/Category
        public ActionResult Index()
        {
            return View(_categoryService.GetCategories(false));
        }
        [HasPermission(RoleID = "ALL_ROLE,VIEW_ROLE")]
        // GET: Admin/Category/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = _categoryService.GetCategoryById(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }
        [HasPermission(RoleID = "ALL_ROLE,INSERT_ROLE")]
        // GET: Admin/Category/Create
        public ActionResult Create()
        {
            var model = new Category();
            return View(model);
        }

        [HasPermission(RoleID = "ALL_ROLE,INSERT_ROLE")]
        // POST: Admin/Category/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name,MetaTitle,ParentId,DisplayOrder,SeoTitle,CreatedDate,CreatedBy,ModifiedDate,ModifileBy,MetaKeywords,MetaDescription,Status,ShowOnHome")] Category category)
        {
            if (ModelState.IsValid)
            {
                var result = await _categoryService.Insert(category);
                if (result)
                {
                    SetAlert("Thêm danh mục bài viết thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Thêm danh mục bài viết không thành công", "error");
                return View(category);
            }
            SetAlert("Thêm danh mục bài viết không thành công", "error");
            return View(category);
        }

        // GET: Admin/Category/Edit/5
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public async Task<ActionResult> Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = _categoryService.GetCategoryById(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Admin/Category/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name,MetaTitle,ParentId,DisplayOrder,SeoTitle,CreatedDate,CreatedBy,ModifiedDate,ModifileBy,MetaKeywords,MetaDescription,Status,ShowOnHome")] Category category)
        {
            if (ModelState.IsValid)
            {
                var result = await _categoryService.Update(category);
                if (result)
                {
                    SetAlert("Cập nhật danh mục bài viết thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Cập nhật danh mục bài viết không thành công", "error");
                return View(category);
            }
            SetAlert("Cập nhật danh mục bài viết không thành công", "error");
            return View(category);
        }
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        // GET: Admin/Category/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = _categoryService.GetCategoryById(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        // POST: Admin/Category/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(long id)
        {
            var result = await _categoryService.Delete(id);
            if (result)
            {
                SetAlert("Xoá danh mục bài viết thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Xoá danh mục bài viết không thành công", "error");
            return RedirectToAction("Index");
        }
    }
}
