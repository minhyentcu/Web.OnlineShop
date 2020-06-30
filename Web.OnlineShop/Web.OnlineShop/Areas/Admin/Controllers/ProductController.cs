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
using System.IO;
using Web.OnlineShop.Common;
using System.Web.Script.Serialization;
using System.Xml.Linq;
using Web.OnlineShop.Service.Implementation;
using Web.OnlineShop.Service;
using System.ComponentModel.DataAnnotations;

namespace Web.OnlineShop.Areas.Admin.Controllers
{

    public class ProductController : BaseController
    {
        private readonly IProductService _productService;
        private readonly IProductCategoryService _productCategoryService;
        public ProductController(IProductService productService, IProductCategoryService productCategoryService)
        {
            _productService = productService;
            _productCategoryService = productCategoryService;
        }
        // GET: Admin/Products
        [HasPermission(RoleID = "ALL_ROLE,VIEW_ROLE")]
        public ActionResult Index()
        {
            var products = _productService.GetProducts(null, false);
            return View(products);
        }

        // GET: Admin/Products/Details/5
        [HasPermission(RoleID = "ALL_ROLE,VIEW_ROLE")]
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = _productService.GetProductById(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Products/Create
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public ActionResult Create()
        {
            ViewBag.ProductCategoryId = new SelectList(_productCategoryService.GetAll(), "Id", "Name");
            var model = new Product();
            return View(model);
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public async Task<ActionResult> Create(Product product, [Required] HttpPostedFileBase file, [Required] IEnumerable<HttpPostedFileBase> files)
        {
            if (ModelState.IsValid)
            {
                var imageUrls = new List<string>();
                var uploadDir = @"~/Upload/Product";
                if (files != null)
                {
                    foreach (var item in files)
                    {
                        imageUrls.Add(CommonConstants.SaveImage(item, uploadDir));
                    }
                }
                product.MoreImages = CommonConstants.ConverUrlImageToXml(imageUrls);

                if (file != null)
                {
                    product.Image = CommonConstants.SaveImage(file, uploadDir);
                }
                var result = await _productService.Create(product);
                if (result)
                {
                    SetAlert("Thêm sản phẩm thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Thêm sản phẩm không thành công", "error");
                ViewBag.ProductCategoryId = new SelectList(_productCategoryService.GetAll(), "Id", "Name", product.ProductCategoryId);
                return View(product);
            }
            SetAlert("Thêm sản phẩm không thành công", "error");
            ViewBag.ProductCategoryId = new SelectList(_productCategoryService.GetAll(), "Id", "Name", product.ProductCategoryId);
            return View(product);
        }

        // GET: Admin/Products/Edit/5
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = _productService.GetProductById(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductCategoryId = new SelectList(_productCategoryService.GetAll(), "Id", "Name", product.ProductCategoryId);
            ViewBag.ImageUrls = CommonConstants.GetUrlImages(product.MoreImages);
            return View(product);
        }

        // POST: Admin/Products/Edit/5.
        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,EDIT_ROLE")]
        public async Task<ActionResult> Edit(Product product, IEnumerable<HttpPostedFileBase> files, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                var uploadDir = @"~/Upload/Product";
                //upload file Image Product
                if (files != null && files.Count() > 1)
                {
                    var imageUrls = new List<string>();
                    foreach (var item in files)
                    {
                        imageUrls.Add(CommonConstants.SaveImage(item, uploadDir));
                    }
                    var xmlImages = CommonConstants.ConverUrlImageToXml(imageUrls);
                    product.MoreImages = xmlImages;
                }

                if (file != null)
                {
                    product.Image = CommonConstants.SaveImage(file, uploadDir);
                }
                var result = await _productService.Update(product);
                if (result)
                {
                    SetAlert("Cập nhật sản phẩm thành công", "success");
                    return RedirectToAction("Index");
                }
                SetAlert("Cập nhật sản phẩm không thành công", "error");
                ViewBag.ImageUrls = CommonConstants.GetUrlImages(product.MoreImages);
                ViewBag.ProductCategoryId = new SelectList(_productCategoryService.GetAll(), "Id", "Name", product.ProductCategoryId);
                return View(product);
            }
            SetAlert("Cập nhật sản phẩm không thành công", "error");
            ViewBag.ImageUrls = CommonConstants.GetUrlImages(product.MoreImages);
            ViewBag.ProductCategoryId = new SelectList(_productCategoryService.GetAll(), "Id", "Name", product.ProductCategoryId);
            return View(product);
        }

        // GET: Admin/Products/Delete/5
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = _productService.GetProductById(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [HasPermission(RoleID = "ALL_ROLE,DELETE_ROLE")]
        public async Task<ActionResult> DeleteConfirmed(long id)
        {
            var result = await _productService.Delete(id);
            if (result)
            {
                SetAlert("Xóa sản phẩm thành công", "success");
                return RedirectToAction("Index");
            }
            SetAlert("Xóa sản phẩm không thành công", "error");
            return RedirectToAction("Index");
        }
    }
}
