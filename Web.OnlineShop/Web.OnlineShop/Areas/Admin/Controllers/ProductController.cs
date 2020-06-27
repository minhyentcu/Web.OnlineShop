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

namespace Web.OnlineShop.Areas.Admin.Controllers
{
    [HasPermission(RoleID = "ALL_USER")]
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
        public ActionResult Index()
        {
            var products = _productService.GetProducts(null);
            return View(products);
        }

        // GET: Admin/Products/Details/5
        public  ActionResult Details(long? id)
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
        public async Task<ActionResult> Create(Product product, HttpPostedFileBase file, IEnumerable<HttpPostedFileBase> files)
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
                    return RedirectToAction("Index");
                }
                ViewBag.ProductCategoryId = new SelectList(_productCategoryService.GetAll(), "Id", "Name", product.ProductCategoryId);
                return View(product);
            }

            ViewBag.ProductCategoryId = new SelectList(_productCategoryService.GetAll(), "Id", "Name", product.ProductCategoryId);
            return View(product);
        }

        // GET: Admin/Products/Edit/5
        public  ActionResult Edit(long? id)
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
                    return RedirectToAction("Index");
                }
                ViewBag.ImageUrls = CommonConstants.GetUrlImages(product.MoreImages);
                ViewBag.ProductCategoryId = new SelectList(_productCategoryService.GetAll(), "Id", "Name", product.ProductCategoryId);
                return View(product);
            }
            ViewBag.ImageUrls = CommonConstants.GetUrlImages(product.MoreImages);
            ViewBag.ProductCategoryId = new SelectList(_productCategoryService.GetAll(), "Id", "Name", product.ProductCategoryId);
            return View(product);
        }

        // GET: Admin/Products/Delete/5
        public  ActionResult Delete(long? id)
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
        public async Task<ActionResult> DeleteConfirmed(long id)
        {
            var result = await _productService.Delete(id);
            if (result)
            {
                return RedirectToAction("Index");
            }
            return RedirectToAction("Index");
        }

    }
}
