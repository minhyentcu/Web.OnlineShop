using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service
{
    public interface IContentService
    {
        IEnumerable<Content> Contents();
        Content GetContent(long? id);
        Task<bool> Insert(Content content);
        Task<bool> Update(Content content);
        Task<bool> Delete(long id);

    }
}
