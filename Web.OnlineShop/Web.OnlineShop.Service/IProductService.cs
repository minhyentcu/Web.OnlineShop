using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public interface IProductService
    {
        IEnumerable<Product> GetProducts(long? id);

        Product GetProductById(long? id);

        IEnumerable<Product> GetReletedProducts(long productId, long productCategoryId);
        Task<bool> Update(Product entity);
        Task<bool> Create(Product entity);
        Task<bool> Delete(long id);

        IEnumerable<Product> Search(string product);
    }
}
