using System.Threading.Tasks;
using System.Net;
using System.Web.Mvc;
using Web.OnlineShop.Entity;
using Web.OnlineShop.Service;
using Web.OnlineShop.Common;

namespace Web.OnlineShop.Areas.Admin.Controllers
{
    public class ProductCategoryController : BaseController
    {

        private readonly IProductCategoryService _productCategoryService;

        public ProductCategoryController(IProductCategoryService productCategoryService)
        {
            _productCategoryService = productCategoryService;
        }
        // GET: Admin/ProductCategories
        [HasPermission(RoleID = "ALL_ROLE,VIEW_ROLE")]
        public ActionResult Index()
        {
            return View(_productCategoryService.GetAll(false));
        }

        // GET: Admin/ProductCategories/Details/5
        [HasPermission(RoleID = "ALL_ROLE,VIEW_ROLE")]
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var productCategory = _productCategoryService.GetProductCategory(id);
            if (productCategory == null)
            {
                return HttpNotFound();
            }
            return View(productCategory);
        }

        // GET: Admin/ProductCategories/Create
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public ActionResult Create()
        {
            var model = new ProductCategory();
            return View(model);
        }

        // POST: Admin/ProductCategories/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public async Task<ActionResult> Create(ProductCategory productCategory)
        {
            if (ModelState.IsValid)
            {
                var result = await _productCategoryService.Create(productCategory);
                if (result)
                {
                    SetAlert("Thêm danh mục sản phẩm thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Thêm danh mục sản phẩm không thành công", "error");
                return View(productCategory);
            }
            SetAlert("Thêm danh mục sản phẩm không thành công", "error");
            return View(productCategory);
        }

        // GET: Admin/ProductCategories/Edit/5
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductCategory productCategory = _productCategoryService.GetProductCategory(id);
            if (productCategory == null)
            {
                return HttpNotFound();
            }
            return View(productCategory);
        }

        // POST: Admin/ProductCategories/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public async Task<ActionResult> Edit(ProductCategory productCategory)
        {
            if (ModelState.IsValid)
            {
                var result = await _productCategoryService.Update(productCategory);
                if (result)
                {
                    SetAlert("Cập nhật danh mục sản phẩm thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Cập nhật danh mục sản phẩm không thành công", "error");
                return View(productCategory);
            }
            SetAlert("Cập nhật danh mục sản phẩm không thành công", "error");
            return View(productCategory);
        }

        // GET: Admin/ProductCategories/Delete/5
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var productCategory = _productCategoryService.GetProductCategory(id);
            if (productCategory == null)
            {
                return HttpNotFound();
            }
            return View(productCategory);
        }

        // POST: Admin/ProductCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        public async Task<ActionResult> DeleteConfirmed(long id)
        {
            var result = await _productCategoryService.Delete(id);
            if (result)
            {
                SetAlert("Xóa danh mục sản phẩm thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Xóa danh mục sản phẩm không thành công", "error");
            return RedirectToAction("Index");
        }
    }
}
