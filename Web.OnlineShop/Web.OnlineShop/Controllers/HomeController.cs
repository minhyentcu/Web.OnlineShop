using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Web.OnlineShop.Entity;
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
        private readonly IContentService _contentService;
        private readonly ISlideService _slideService;
        private readonly IFeedbackService _feedbackService;
        public HomeController(IMenuService menuService, IProductService productService, ICategoryService categoryService
            , IAboutService aboutService, IContactService contactService, IProductCategoryService productCategoryService
            , IContentService contentService, ISlideService slideService, IFeedbackService feedbackService)
        {
            _menuService = menuService;
            _productService = productService;
            _categoryService = categoryService;
            _aboutService = aboutService;
            _contactService = contactService;
            _productCategoryService = productCategoryService;
            _contentService = contentService;
            _slideService = slideService;
            _feedbackService = feedbackService;
        }
        public ActionResult Index()
        {
            ViewBag.Products = _productService.GetProducts(null).ToList();
            ViewBag.Contact = _contactService.GetContactById(null);
            ViewBag.Contents = _contentService.Contents(4).ToList();
            ViewBag.Feedbacks = _feedbackService.GetAll().ToList();
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

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Contact(Feedback feedback)
        {
            if (ModelState.IsValid)
            {
                var result = await _feedbackService.CreateAsync(feedback);
                if (result)
                {
                    return Redirect("/");
                }
            }
            return Redirect("/");
        }

        [ChildActionOnly]
        //[OutputCache(Duration = 86400)]
        public ActionResult MainMenu()
        {
            var model = _menuService.GetAllMenuBygroupId(1);
            ViewBag.Contents = _categoryService.GetCategories();
            return PartialView(model);
        }

        [ChildActionOnly]
        //[OutputCache(Duration = 86400)]
        public ActionResult MenuTop()
        {
            var model = _menuService.GetAllMenuBygroupId(2);

            return PartialView(model);
        }

        [ChildActionOnly]
        //[OutputCache(Duration = 86400)]
        public ActionResult Footer()
        {
            ViewBag.productCategorys = _productCategoryService.GetAll();
            ViewBag.contact = _contactService.GetContactById(null);
            var model = _menuService.GetFooter();
            return PartialView(model);
        }


        [ChildActionOnly]
        //[OutputCache(Duration = 86400)]
        public ActionResult Slide()
        {
            var model = _slideService.GetAll();
            return PartialView(model);
        }

        [ChildActionOnly]
        //[OutputCache(Duration = 86400)]
        public ActionResult Carousel()
        {

            var feedback = _feedbackService.GetAll();
            return View(feedback);
        }
    }
}