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
using System.ComponentModel.DataAnnotations;

namespace Web.OnlineShop.Areas.Admin.Controllers
{
    public class SlideController : BaseController
    {

        private readonly ISlideService _slideService;
        public SlideController(ISlideService slideService)
        {
            _slideService = slideService;
        }
        // GET: Admin/Slide
        [HasPermission(RoleID = "ALL_ROLE,VIEW_ROLE")]
        public ActionResult Index()
        {
            return View(_slideService.GetAll());
        }

        // GET: Admin/Slide/Details/5
        [HasPermission(RoleID = "ALL_ROLE,VIEW_ROLE")]
        public async Task<ActionResult> Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slide slide = await _slideService.GetSlideById(id);
            if (slide == null)
            {
                return HttpNotFound();
            }
            return View(slide);
        }

        // GET: Admin/Slide/Create
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public ActionResult Create()
        {
            var model = new Slide();
            return View(model);
        }

        // POST: Admin/Slide/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public async Task<ActionResult> Create( Slide slide, [Required] HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    var uploadDir = @"~/Upload/Slide";
                    var imageUrl = CommonConstants.SaveImage(file, uploadDir);
                    slide.Image = imageUrl;
                }
                var result = await _slideService.CreateAsync(slide);
                if (result)
                {
                    return RedirectToAction("Index");
                }
                return View(slide);
            }

            return View(slide);
        }

        // GET: Admin/Slide/Edit/5
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slide slide = await _slideService.GetSlideById(id);
            if (slide == null)
            {
                return HttpNotFound();
            }
            return View(slide);
        }

        // POST: Admin/Slide/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public async Task<ActionResult> Edit( Slide slide, [Required] HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    var uploadDir = @"~/Upload/Slide";
                    var imageUrl = CommonConstants.SaveImage(file, uploadDir);
                    slide.Image = imageUrl;
                }
                var result = await _slideService.UpdateAsync(slide);
                if (result)
                {
                    return RedirectToAction("Index");
                }
                return View(slide);
            }
            return View(slide);
        }

        // GET: Admin/Slide/Delete/5
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Slide slide = await _slideService.GetSlideById(id);
            if (slide == null)
            {
                return HttpNotFound();
            }
            return View(slide);
        }

        // POST: Admin/Slide/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            var result = await _slideService.DeleteAsync(id);
            if (result)
            {
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }
    }
}
