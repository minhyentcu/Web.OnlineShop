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
using System.IO;
using Web.OnlineShop.Common;

namespace Web.OnlineShop.Areas.Admin.Controllers
{
    [HasPermission(RoleID = "ALL_USER")]
    public class AboutController : Controller
    {
        private readonly IAboutService _aboutService;
        public AboutController(IAboutService aboutService)
        {
            _aboutService = aboutService;
        }
        // GET: Admin/About
        public  ActionResult Index()
        {
            return View(_aboutService.GetAbouts());
        }

        // GET: Admin/About/Details/5
        public  ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            About about = _aboutService.GetAboutById(id);
            if (about == null)
            {
                return HttpNotFound();
            }
            return View(about);
        }

        // GET: Admin/About/Create
        public ActionResult Create()
        {
            var model = new About();
            return View(model);
        }

        // POST: Admin/About/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult>  Create([Bind(Include = "Id,Name,Description,Image,CategoryId,Detail,Status,CreatedDate,CreatedBy,ModifiedDate,ModifileBy,MetaKeywords,MetaDescription,ViewCount")] About about, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    var uploadDir = @"~/Upload/Content";
                    var imageUrl = CommonConstants.SaveImage(file, uploadDir);
                    about.Image = imageUrl;
                }
                var result =await _aboutService.Insert(about);
                if (result)
                {
                    return RedirectToAction("Index");
                }
                return View(about);
            }

            return View(about);
        }

        // GET: Admin/About/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            About about = _aboutService.GetAboutById(id);
            if (about == null)
            {
                return HttpNotFound();
            }
            return View(about);
        }

        // POST: Admin/About/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult>  Edit([Bind(Include = "Id,Name,Description,Image,CategoryId,Detail,Status,CreatedDate,CreatedBy,ModifiedDate,ModifileBy,MetaKeywords,MetaDescription,ViewCount")] About about, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    //upload file Image About
                    var uploadDir = @"~/Upload/Content";
                    var imageUrl = CommonConstants.SaveImage(file, uploadDir);
                    about.Image = imageUrl;
                }
                var result =await _aboutService.Update(about);
                if (result)
                {
                    return RedirectToAction("Index");
                }
                return View(about);
            }
            return View(about);
        }

        // GET: Admin/About/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var about = _aboutService.GetAboutById(id);
            if (about == null)
            {
                return HttpNotFound();
            }
            return View(about);
        }

        // POST: Admin/About/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult>  DeleteConfirmed(long id)
        {
            var result = await _aboutService.Delete(id);
            if (result)
            {
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }
    }
}
