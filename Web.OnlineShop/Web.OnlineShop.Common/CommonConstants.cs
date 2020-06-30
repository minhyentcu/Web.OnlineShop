using System;
using System.Web;
using System.IO;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Net.Mail;
using System.Net;

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

        public static void SendVerificationLinkEmail(string emailID, string activationCode)
        {
            try
            {
                var verifyUrl = "/reset-password-" + activationCode;
                var link = HttpContext.Current.Request.Url.AbsoluteUri.Replace(HttpContext.Current.Request.Url.PathAndQuery, verifyUrl);

                var fromEmail = new MailAddress("phamminhyen2d@gmail.com", "Fogot Password");
                var toEmail = new MailAddress(emailID);
                var fromEmailPassword = "@@@";
                string subject = "Forgot password";
                string body = "Nhấn vào link để reset password " + "<a href=" + link + ">Reset password link</a>";

                var message = new MailMessage(fromEmail, toEmail)
                {
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                };
                using (SmtpClient client = new SmtpClient())
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("phamminhyen2d@gmail.com", fromEmailPassword);
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;

                    client.Send(message);
                }
            }

            catch (Exception)
            {

                
            }
        }
    }
}
