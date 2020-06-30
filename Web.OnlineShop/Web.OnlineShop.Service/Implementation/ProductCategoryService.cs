using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Common;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class ProductCategoryService : IProductCategoryService
    {
        private readonly OnlineShopDbContext _context;
        public ProductCategoryService(OnlineShopDbContext context)
        {
            _context = context;
        }

        public async Task<bool> Create(ProductCategory productCategory)
        {
            try
            {
                productCategory.MetaTitle = CommonConstants.ConvertToUnSign(productCategory.Name);
                productCategory.CreatedDate = DateTime.Now;
                _context.ProductCategories.Add(productCategory);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<bool> Delete(long id)
        {
            try
            {
                var entity = await _context.ProductCategories.FindAsync(id);
                if (entity != null)
                {
                    _context.ProductCategories.Remove(entity);
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

        public List<ProductCategory> GetAll(bool status = true)
        {
            if (status)
            {
                return _context.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
            }
            return _context.ProductCategories.OrderBy(x => x.DisplayOrder).ToList();
        }

        public ProductCategory GetProductCategory(long? id)
        {
            return _context.ProductCategories.Find(id);
        }

        public async Task<bool> Update(ProductCategory model)
        {
            try
            {
                var entity = await _context.ProductCategories.FindAsync(model.Id);
                if (entity != null)
                {
                    entity.Name = model.Name;
                    entity.ModifiedDate = DateTime.Now;
                    entity.MetaTitle = CommonConstants.ConvertToUnSign(model.Name);
                    entity.Status = model.Status;
                    entity.ShowOnHome = model.ShowOnHome;
                    entity.DisplayOrder = model.DisplayOrder;
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
