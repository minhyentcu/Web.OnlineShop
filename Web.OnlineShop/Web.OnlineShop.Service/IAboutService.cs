using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service
{
    public interface IAboutService
    {
        About GetAboutById(long? id);
        IEnumerable<About> GetAbouts(bool status = true);
        Task<bool> Update(About about);
        Task<bool> Delete(long id);
        Task<bool> Insert(About about);
    }
}
