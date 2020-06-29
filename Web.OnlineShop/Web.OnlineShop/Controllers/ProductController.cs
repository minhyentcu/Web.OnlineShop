using System.Web.Mvc;
using Web.OnlineShop.Common;
using Web.OnlineShop.Service;
using Web.OnlineShop.Service.Implementation;

namespace Web.OnlineShop.Controllers
{
    public class ProductController : Controller
    {

        private readonly IProductCategoryService _productCategoryService;
        private readonly IProductService _productService;

        private readonly IContactService _contactService;

        public ProductController(IProductCategoryService productCategoryService, IProductService productService
            , IContactService contactService)
        {
            _productCategoryService = productCategoryService;
            _productService = productService;
            _contactService = contactService;
        }
        // GET: Product
        public ActionResult Index(long? id)
        {
            var products = _productService.GetProducts(id);
            return View(products);
        }

        [ChildActionOnly]
        public PartialViewResult ProductCategory()
        {
            var model = _productCategoryService.GetAll();
            return PartialView(model);
        }

        public ActionResult Category(long? id)
        {
            var products = _productService.GetProducts(id);
            return View(products);
        }

        public ActionResult Detail(long id)
        {
            var product = _productService.GetProductById(id);
            ViewBag.ProductCategory = _productCategoryService.GetProductCategory(product.ProductCategoryId);
            if (product.MoreImages != null)
            {
                ViewBag.ImageUrls = CommonConstants.GetUrlImages(product.MoreImages);
            }
            ViewBag.ReletedProducts = _productService.GetReletedProducts(id, product.ProductCategoryId);
            ViewBag.Contact = _contactService.GetContactById(null);
            return View(product);
        }

        [HttpGet]
        public ActionResult Search(string searchProduct)
        {
            var products = _productService.Search(searchProduct);
            return View("Index", products);
        }
    }
}