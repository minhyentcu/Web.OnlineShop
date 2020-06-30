using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class FeedbackService : IFeedbackService
    {
        private readonly OnlineShopDbContext _context;
        public FeedbackService(OnlineShopDbContext context)
        {
            _context = context;
        }
        public async Task<bool> CreateAsync(Feedback feedback)
        {
            try
            {
                feedback.CreatedDate = DateTime.Now;
                feedback.Status = true;
                _context.Feedbacks.Add(feedback);
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
                var feedback = await _context.Feedbacks.FirstOrDefaultAsync(x => x.Id == id);
                if (feedback != null)
                {
                    _context.Feedbacks.Remove(feedback);
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

        public IEnumerable<Feedback> GetAll(bool status = true)
        {
            if (status)
            {
                return _context.Feedbacks.Where(x => x.Status == true);
            }
            return _context.Feedbacks;
        }

        public async Task<Feedback> GetFeedback(long? id)
        {
            return await _context.Feedbacks.FirstOrDefaultAsync(x => x.Id == id);
        }

        public async Task<bool> UpdateAsync(Feedback feedback)
        {
            try
            {
                var entity = await _context.Feedbacks.FirstOrDefaultAsync(x => x.Id == feedback.Id);
                if (entity != null)
                {
                    entity.Name = feedback.Name;
                    entity.Email = feedback.Email;
                    entity.Content = feedback.Content;
                    entity.Phone = feedback.Phone;
                    entity.Address = feedback.Address;
                    entity.Status = feedback.Status;
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
