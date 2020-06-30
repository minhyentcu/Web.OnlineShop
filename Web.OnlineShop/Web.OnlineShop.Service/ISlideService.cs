using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service
{
   public interface ISlideService
    {
        Task<bool> CreateAsync(Slide slide);

        Task<bool> DeleteAsync(long id);

        Task<bool> UpdateAsync(Slide slide);

        IEnumerable<Slide> GetAll(bool status = true);

        Task<Slide> GetSlideById(long? id);
    }
}
