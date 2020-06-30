using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service
{
    public interface IProductCategoryService
    {
        List<ProductCategory> GetAll(bool status = true);
        ProductCategory GetProductCategory(long? id);
        Task<bool> Create(ProductCategory productCategory);
        Task<bool> Update(ProductCategory productCategory);
        Task<bool> Delete(long id);

    }
}
