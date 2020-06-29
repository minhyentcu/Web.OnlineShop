using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.OnlineShop.Service;

namespace Web.OnlineShop.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryService _categoryService;
        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        public ActionResult Index(long id)
        {
            var model = _categoryService.GetContentsById(id);
            ViewBag.category = _categoryService.GetCategoryById(id);

            return View(model);
        }

        [ChildActionOnly]
        public PartialViewResult PostsCategory()
        {
            var model = _categoryService.GetCategories();
            return PartialView(model);
        }

        public ActionResult Detail(long id)
        {
            var model = _categoryService.GetContentById(id);
            ViewBag.category = _categoryService.GetCategoryById(model.CategoryId);
            return View(model);
        }
    }
}