using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Web.OnlineShop
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                 name: "Reset password",
                 url: "reset-password-{id}",
                 defaults: new { controller = "Login", action = "ResetPassword", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
            ).DataTokens = new RouteValueDictionary(new { area = "Admin" });

            routes.MapRoute(
            name: "Forgot password",
            url: "quen-mat-khau",
            defaults: new { controller = "Login", action = "ForgotPassword", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
         ).DataTokens = new RouteValueDictionary(new { area = "Admin" });

            routes.MapRoute(
             name: "Product Search",
             url: "san-pham/tim-kiem",
             defaults: new { controller = "Product", action = "Search", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
         );

            routes.MapRoute(
              name: "About",
              url: "gioi-thieu",
              defaults: new { controller = "Home", action = "About", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
          );
            routes.MapRoute(
              name: "Contact",
              url: "lien-he",
              defaults: new { controller = "Home", action = "Contact", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
          );
            routes.MapRoute(
              name: "Login",
              url: "dang-nhap",
              defaults: new { controller = "Login", action = "Index", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
          ).DataTokens = new RouteValueDictionary(new { area = "Admin" });
            routes.MapRoute(
              name: "SignUp",
              url: "dang-ky",
              defaults: new { controller = "Login", action = "SignUp", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
          ).DataTokens = new RouteValueDictionary(new { area = "Admin" });
            routes.MapRoute(
               name: "Category Content Detail",
               url: "bai-viet/{metaTitleCategory}/{metaTitleContent}-{id}",
               defaults: new { controller = "Category", action = "Detail", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
           );

            routes.MapRoute(
              name: "Category Content",
              url: "bai-viet/{metaTitle}-{id}",
              defaults: new { controller = "Category", action = "Index", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
          );

            routes.MapRoute(
                name: "Product Detail",
                url: "chi-tiet/{metaTitle}-{id}",
                defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
            );

            routes.MapRoute(
                name: "Product Category",
                url: "san-pham/{metaTitle}-{id}",
                defaults: new { controller = "Product", action = "Category", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
            );
            routes.MapRoute(
               name: "Product Categorys",
               url: "san-pham",
               defaults: new { controller = "Product", action = "Index", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
           );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }, namespaces: new[] { "Web.OnlineShop.Controllers" }
            );


        }
    }
}
