using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service
{
    public interface ICategoryService
    {
        IEnumerable<Category> GetCategories();
        IEnumerable<Content> GetContentsById(long id);
        Content GetContentById(long id);
        Category GetCategoryById(long? id);
        Task<bool>  Insert(Category category);
        Task<bool> Delete(long id);
        Task<bool> Update(Category category);
    }
}
