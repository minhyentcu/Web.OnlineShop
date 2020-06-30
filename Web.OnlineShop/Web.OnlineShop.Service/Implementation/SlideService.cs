using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class SlideService : ISlideService
    {

        private readonly OnlineShopDbContext _context;
        public SlideService(OnlineShopDbContext context)
        {
            _context = context;
        }
        public async Task<bool> CreateAsync(Slide slide)
        {
            try
            {
                slide.CreatedDate = DateTime.Now;
                _context.Slides.Add(slide);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var slide = await _context.Slides.FindAsync(id);
                if (slide != null)
                {
                    _context.Slides.Remove(slide);
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

        public IEnumerable<Slide> GetAll(bool status = true)
        {
            if (status == true)
            {
                return _context.Slides.Where(x => x.Status == true);
            }
            return _context.Slides;
        }

        public async Task<Slide> GetSlideById(long? id)
        {
            return await _context.Slides.FindAsync(id);
        }

        public async Task<bool> UpdateAsync(Slide slide)
        {
            try
            {
                var entity = await _context.Slides.FindAsync(slide.Id);
                if (slide != null)
                {
                    entity.Name = slide.Name;
                    entity.Descripstion = slide.Descripstion;
                    entity.ModifiedDate = DateTime.Now;
                    entity.Status = entity.Status;
                    if (!string.IsNullOrEmpty(slide.Image))
                    {
                        entity.Image = slide.Image;
                    }
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
