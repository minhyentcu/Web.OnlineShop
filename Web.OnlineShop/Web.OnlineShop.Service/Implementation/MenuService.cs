using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class MenuService : IMenuService
    {
        private readonly OnlineShopDbContext _context;
        public MenuService(OnlineShopDbContext context)
        {
            _context = context;
        }
        public IEnumerable<Menu> GetAllMenuBygroupId(int groupId)
        {
            return _context.Menus.Where(x => x.TypeId == groupId && x.Status == true).OrderBy(x => x.DisplayOrder);
        }

        public Footer GetFooter()
        {
            return _context.Footers.FirstOrDefault(x => x.Status == true);
        }
    }
}
