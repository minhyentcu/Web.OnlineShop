using System;
using System.Web;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using System.Collections.Generic;

namespace Web.OnlineShop.Common
{
    public static class CommonConstants
    {
        public static string USER_SESSION = "USER_SESSION";
        public static string SESSION_PERMISSION = "SESSION_PERMISSION";
        public static string MEMBER_GROUP = "MEMBER";
        public static string MOD_GROUP = "MOD";
        public static string ADMIN_GROUP = "ADMIN";
        public static string ConvertToUnSign(string text)
        {
            for (int i = 33; i < 48; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }

            for (int i = 58; i < 65; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }

            for (int i = 91; i < 97; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }
            for (int i = 123; i < 127; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }
            text = text.Replace(" ", "-");
            Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");
            string strFormD = text.Normalize(System.Text.NormalizationForm.FormD);
            return regex.Replace(strFormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D').ToLower();
        }

        /// <summary>
        /// Save Image
        /// </summary>
        /// <param name="file"></param>
        /// <param name="url"></param>
        /// <returns></returns>
        public static string SaveImage(HttpPostedFileBase file, string url)
        {
            var tmp = file.GetType().Name;
            var filename = Path.GetFileName(DateTime.Now.ToString("ddhhmmss") + file.FileName);
            var path = Path.Combine(HttpContext.Current.Server.MapPath(url), filename);
            file.SaveAs(path);
            return string.Concat(url, "/", filename);
        }

        public static List<string> GetUrlImages(string images)
        {
            XElement xImages = XElement.Parse(images);
            var urlImages = new List<string>();
            foreach (var item in xImages.Elements())
            {
                urlImages.Add(item.Value);
            }
            return urlImages;
        }

        public static string ConverUrlImageToXml(List<string> imageUrls)
        {
            XElement xElement = new XElement("Images");
            foreach (var item in imageUrls)
            {
                xElement.Add(new XElement("Image", item));
            }
            return xElement.ToString();
        }
    }
}
