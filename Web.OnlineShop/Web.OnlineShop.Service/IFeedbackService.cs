using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service
{
   public interface IFeedbackService
    {
        Task<bool> CreateAsync(Feedback feedback);

        Task<bool> DeleteAsync(long id);

        Task<bool> UpdateAsync(Feedback feedback);

        IEnumerable<Feedback> GetAll(bool status=true);

        Task<Feedback> GetFeedback(long? id);
    }
}
