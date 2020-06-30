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
    public class FeedbackController : BaseController
    {

        private readonly IFeedbackService _feedbackService;
        public FeedbackController(IFeedbackService feedbackService)
        {
            _feedbackService = feedbackService;
        }
        // GET: Admin/Feedback
        public ActionResult Index()
        {
            return View(_feedbackService.GetAll(false));
        }

        // GET: Admin/Feedback/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Feedback feedback = await _feedbackService.GetFeedback(id);
            if (feedback == null)
            {
                return HttpNotFound();
            }
            return View(feedback);
        }

      
        // POST: Admin/Feedback/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name,Phone,Email,Address,CreatedDate,Status,Content")] Feedback feedback)
        {
            if (ModelState.IsValid)
            {
                var result = await _feedbackService.CreateAsync(feedback);
                if (result)
                {
                    SetAlert("Thêm thông tin thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Thêm thông tin không thành công", "error");
                return View(feedback);
            }
            SetAlert("Thêm thông tin không thành công", "error");
            return View(feedback);
        }

        // GET: Admin/Feedback/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Feedback feedback = await _feedbackService.GetFeedback(id);
            if (feedback == null)
            {
                return HttpNotFound();
            }
            return View(feedback);
        }

        // POST: Admin/Feedback/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name,Phone,Email,Address,CreatedDate,Status,Content")] Feedback feedback)
        {
            if (ModelState.IsValid)
            {
                var result = await _feedbackService.UpdateAsync(feedback);
                if (result)
                {
                    SetAlert("Cập nhật thông tin thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Cập nhật thông tin không thành công", "error");
            }
            SetAlert("Cập nhật thông tin không thành công", "error");
            return View(feedback);
        }

        // GET: Admin/Feedback/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Feedback feedback = await _feedbackService.GetFeedback(id);
            if (feedback == null)
            {
                return HttpNotFound();
            }
            return View(feedback);
        }

        // POST: Admin/Feedback/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            var result =await _feedbackService.DeleteAsync(id);
            if (result)
            {
                SetAlert("Xóa thông tin thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Xóa thông tin không thành công", "error");
            return RedirectToAction("Index");
        }
    }
}
