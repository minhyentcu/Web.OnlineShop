using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace Web.OnlineShop
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

           
            //register DI
            UnityConfig.RegisterComponents();

            //View count
            Application["SessionCount"] = 0;
            Application["AccessCount"] = 0;
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            Application.Lock();
            Application["SessionCount"] = Convert.ToInt32(Application["SessionCount"]) + 1;
            Application["AccessCount"] = Convert.ToInt32(Application["AccessCount"]) + 1;
            Application.UnLock();
        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["SessionCount"] = Convert.ToInt32(Application["SessionCount"]) - 1;
            Application.UnLock();
        }
    }
}
