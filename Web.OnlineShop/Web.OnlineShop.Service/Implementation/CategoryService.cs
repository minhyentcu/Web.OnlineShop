using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Web.OnlineShop.Common;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class CategoryService : ICategoryService
    {
        private readonly OnlineShopDbContext _context;
        public CategoryService(OnlineShopDbContext context)
        {
            _context = context;
        }

        public About GetAboutById(long id)
        {
            return _context.Abouts.FirstOrDefault(x => x.Status == true);
        }

        public IEnumerable<Category> GetCategories()
        {
            return _context.Categories.Where(x => x.Status == true);
        }

        public Category GetCategoryById(long? id)
        {
            return _context.Categories.Find(id);
        }

        public Content GetContentById(long id)
        {
            return _context.Contents.Find(id);
        }

        public IEnumerable<Content> GetContentsById(long id)
        {
            return _context.Contents.Where(x => x.Status == true && x.CategoryId == id).OrderByDescending(x => x.CreatedDate);
        }

        public async Task<bool> Insert(Category category)
        {
            try
            {
                category.MetaTitle = CommonConstants.ConvertToUnSign(category.Name);
                category.CreatedDate = DateTime.Now;
                _context.Categories.Add(category);
               await  _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public async Task<bool>  Update(Category model)
        {
            try
            {
                var category = await _context.Categories.FindAsync(model.Id);
                if (category != null)
                {
                    category.MetaTitle = CommonConstants.ConvertToUnSign(model.Name);
                    category.Name = model.Name;
                    category.ModifiedDate = DateTime.Now;
                    category.ShowOnHome = model.ShowOnHome;
                    category.Status = model.Status;
                    category.Contents = model.Contents;
                    category.DisplayOrder = model.DisplayOrder;
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

        public async Task<bool>  Delete(long id)
        {
            try
            {
                var category = await _context.Categories.FindAsync(id);
                if (category != null)
                {
                    _context.Categories.Remove(category);
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
