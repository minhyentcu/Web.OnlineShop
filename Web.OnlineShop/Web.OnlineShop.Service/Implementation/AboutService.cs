using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class AboutService : IAboutService
    {
        private readonly OnlineShopDbContext _context;
        public AboutService(OnlineShopDbContext context)
        {
            _context = context;
        }
        public async Task<bool>  Delete(long id)
        {
            try
            {
                var about = await _context.Abouts.FindAsync(id);
                if (about != null)
                {
                    _context.Abouts.Remove(about);
                    await _context.SaveChangesAsync();
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                return false;
            }
        }

        public About GetAboutById(long? id)
        {
            if (id == null)
            {
                return _context.Abouts.FirstOrDefault();
            }
            return _context.Abouts.Find(id);
        }

        public IEnumerable<About> GetAbouts()
        {
            try
            {
                return _context.Abouts;
            }
            catch (Exception)
            {
                return null;
            }
        }

        public async Task<bool>  Insert(About about)
        {
            try
            {
                about.CreatedDate = DateTime.Now;
                _context.Abouts.Add(about);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool>  Update(About entity)
        {
            try
            {
                var about = await _context.Abouts.FindAsync(entity.Id);
                if (about != null)
                {
                    about.Name = entity.Name;
                    about.Status = entity.Status;
                    about.Description = entity.Description;
                    about.Detail = entity.Detail;
                    about.ModifiedDate = DateTime.Now;
                    about.Image = entity.Image;
                   await _context.SaveChangesAsync();
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {

                return false;
            }
        }
    }
}
