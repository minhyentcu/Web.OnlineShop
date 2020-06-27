using System.Web.Mvc;
using Unity;
using Unity.Mvc5;
using Web.OnlineShop.Service;
using Web.OnlineShop.Service.Implementation;

namespace Web.OnlineShop
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
            var container = new UnityContainer();

            //  register  DI
            container.RegisterType<IUserService, UserService>();
            container.RegisterType<ICategoryService, CategoryService>();
            container.RegisterType<IMenuService, MenuService>();
            container.RegisterType<IProductCategoryService, ProductCategoryService>();
            container.RegisterType<IProductService, ProductService>();
            container.RegisterType<IAboutService, AboutService>();
            container.RegisterType<IContactService, ContactService>();
            container.RegisterType<IContentService, ContentService>();

            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}