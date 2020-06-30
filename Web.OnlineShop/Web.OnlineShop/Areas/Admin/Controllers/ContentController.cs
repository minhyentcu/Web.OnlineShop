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
using System.IO;
using Web.OnlineShop.Service;

namespace Web.OnlineShop.Areas.Admin.Controllers
{


    public class ContentController : BaseController
    {
        private readonly ICategoryService _categoryService;
        private readonly IContentService _contentService;
        public ContentController(ICategoryService categoryService, IContentService contentService)
        {
            _categoryService = categoryService;
            _contentService = contentService;
        }
        // GET: Admin/Content
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public ActionResult Index()
        {
            var contents = _contentService.Contents(0,false);
            return View(contents);
        }

        // GET: Admin/Content/Details/5
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Content content = _contentService.GetContent(id);
            if (content == null)
            {
                return HttpNotFound();
            }
            return View(content);
        }

        // GET: Admin/Content/Create
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(_categoryService.GetCategories(), "Id", "Name");
            var model = new Content();
            return View(model);
        }

        // POST: Admin/Content/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name,Description,Image,CategoryId,Detail,Warranty,Status,CreatedDate,CreatedBy,ModifiedDate,ModifileBy,MetaKeywords,MetaDescription,TopHot,ViewCount,Tag")] Content content, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    //upload file Image Content
                    var uploadDir = @"~/Upload/Content";
                    var imageUrl = CommonConstants.SaveImage(file, uploadDir);
                    content.Image = imageUrl;
                }
                var result = await _contentService.Insert(content);
                if (result)
                {
                    SetAlert("Thêm bài viết thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Thêm bài viết không thành công", "error");
                ViewBag.CategoryId = new SelectList(_categoryService.GetCategories(), "Id", "Name", content.CategoryId);
                return View(content);
            }
            SetAlert("Thêm bài viết không thành công", "error");
            ViewBag.CategoryId = new SelectList(_categoryService.GetCategories(), "Id", "Name", content.CategoryId);
            return View(content);
        }

        // GET: Admin/Content/Edit/5
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Content content = _contentService.GetContent(id);
            if (content == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(_categoryService.GetCategories(), "Id", "Name", content.CategoryId);
            return View(content);
        }

        // POST: Admin/Content/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name,Description,Image,CategoryId,Detail,Warranty,Status,CreatedDate,CreatedBy,ModifiedDate,ModifileBy,MetaKeywords,MetaDescription,TopHot,ViewCount,Tag")] Content content, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                { //upload file Image Content
                    var uploadDir = @"~/Upload/Content";
                    var imageUrl = CommonConstants.SaveImage(file, uploadDir);
                    content.Image = imageUrl;
                }
                var result = await _contentService.Update(content);
                if (result)
                {
                    SetAlert("Cập nhật bài viết thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Cập nhật bài viết không thành công", "error");
                ViewBag.CategoryId = new SelectList(_categoryService.GetCategories(), "Id", "Name", content.CategoryId);
                return View(content);
            }
            SetAlert("Cập nhật bài viết không thành công", "error");
            ViewBag.CategoryId = new SelectList(_categoryService.GetCategories(), "Id", "Name", content.CategoryId);
            return View(content);
        }

        // GET: Admin/Content/Delete/5
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Content content = _contentService.GetContent(id);
            if (content == null)
            {
                return HttpNotFound();
            }
            return View(content);
        }

        // POST: Admin/Content/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        public async Task<ActionResult> DeleteConfirmed(long id)
        {
            var result = await _contentService.Delete(id);
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
