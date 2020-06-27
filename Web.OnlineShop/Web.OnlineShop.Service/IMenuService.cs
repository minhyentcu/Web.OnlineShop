using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service
{
    public interface IMenuService
    {
        IEnumerable<Menu> GetAllMenuBygroupId(int groupId);
        Footer GetFooter();
    }
}
