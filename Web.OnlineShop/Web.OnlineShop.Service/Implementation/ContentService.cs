using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Common;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class ContentService : IContentService
    {
        private readonly OnlineShopDbContext _context;
        public ContentService(OnlineShopDbContext context)
        {
            _context = context;
        }
        public IEnumerable<Content> Contents(int count = 0, bool status = true)
        {
            if (count > 0)
            {
                return _context.Contents.Where(x => x.Status == true).OrderByDescending(x => x.CreatedDate).Take(count);
            }
            if (status)
            {
                return _context.Contents.Where(x => x.Status == true).OrderByDescending(x => x.CreatedDate);
            }
            return _context.Contents;
        }

        public Content GetContent(long? id)
        {
            return _context.Contents.Find(id);
        }

        public async Task<bool> Insert(Content content)
        {
            try
            {
                content.CreatedDate = DateTime.Now;
                content.MetaTitle = CommonConstants.ConvertToUnSign(content.Name);
                _context.Contents.Add(content);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> Update(Content content)
        {
            try
            {
                var entity = await _context.Contents.FindAsync(content.Id);
                if (content != null)
                {
                    entity.ModifiedDate = DateTime.Now;
                    entity.Name = content.Name;
                    entity.Status = content.Status;
                    entity.CategoryId = content.CategoryId;
                    entity.Description = content.Description;
                    entity.Detail = content.Detail;
                    entity.Image = content.Image;
                    entity.MetaTitle = CommonConstants.ConvertToUnSign(content.Name);
                    await _context.SaveChangesAsync();
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> Delete(long id)
        {
            try
            {
                var content = await _context.Contents.FindAsync(id);
                if (content != null)
                {
                    _context.Contents.Remove(content);
                    await _context.SaveChangesAsync();
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}
