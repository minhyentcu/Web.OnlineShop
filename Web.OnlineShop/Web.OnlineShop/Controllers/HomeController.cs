using System.Linq;
using System.Web.Mvc;
using Web.OnlineShop.Service;
using Web.OnlineShop.Service.Implementation;

namespace Web.OnlineShop.Controllers
{
    public class HomeController : Controller
    {
        private readonly IMenuService _menuService;
        private readonly IProductService _productService;
        private readonly IProductCategoryService _productCategoryService;
        private readonly ICategoryService _categoryService;
        private readonly IAboutService _aboutService;
        private readonly IContactService _contactService;
        public HomeController(IMenuService menuService, IProductService productService, ICategoryService categoryService
            , IAboutService aboutService, IContactService contactService, IProductCategoryService productCategoryService)
        {
            _menuService = menuService;
            _productService = productService;
            _categoryService = categoryService;
            _aboutService = aboutService;
            _contactService = contactService;
            _productCategoryService = productCategoryService;
        }
        public ActionResult Index()
        {
            ViewBag.Products = _productService.GetProducts(null).ToList();
            return View();
        }

        public ActionResult About()
        {
            var model = _aboutService.GetAboutById(null);
            return View(model);
        }

        public ActionResult Contact()
        {
            //ViewBag.Message = "Your contact page.";
            var model = _contactService.GetContactById(null);
            return View(model);
        }

        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            var model = _menuService.GetAllMenuBygroupId(1);
            ViewBag.Contents = _categoryService.GetCategories();
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult MenuTop()
        {
            var model = _menuService.GetAllMenuBygroupId(2);

            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult Footer()
        {
            ViewBag.productCategorys = _productCategoryService.GetAll();
            ViewBag.contact = _contactService.GetContactById(null);
            var model = _menuService.GetFooter();
            return PartialView(model);
        }
    }
}