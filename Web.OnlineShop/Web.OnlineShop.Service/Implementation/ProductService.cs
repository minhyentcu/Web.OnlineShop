﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Common;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class ProductService : IProductService
    {
        private readonly OnlineShopDbContext _context;

        public ProductService(OnlineShopDbContext context)
        {
            _context = context;
        }

        public IEnumerable<Product> GetProducts(long? id)
        {
            if (id != null)
            {
                return _context.Products.Include("ProductCategory").Where(x => x.ProductCategoryId == id).OrderByDescending(x => x.CreatedDate);
            }
            return _context.Products.OrderByDescending(x => x.CreatedDate);
        }

        public Product GetProductById(long? id)
        {
            return _context.Products.Find(id);
        }

        public IEnumerable<Product> GetReletedProducts(long productId, long productCategoryId)
        {
            return _context.Products.Where(x => x.Id != productId && x.ProductCategoryId == productCategoryId);
        }

        public async Task<bool> Update(Product entity)
        {
            try
            {
                var product = _context.Products.Find(entity.Id);
                if (product != null)
                {
                    if (!string.IsNullOrEmpty(entity.MoreImages))
                    {
                        product.MoreImages = entity.MoreImages;
                    }
                    if (!string.IsNullOrEmpty(entity.Image))
                    {
                        product.Image = entity.Image;
                    }
                    product.Name = entity.Name;
                    product.ModifiedDate = DateTime.Now;
                    product.Description = entity.Description;
                    product.Detail = entity.Detail;
                    product.ProductCategoryId = entity.ProductCategoryId;
                    product.Status = entity.Status;
                    product.MetaTitle = CommonConstants.ConvertToUnSign(product.Name);
                    product.Specifications = entity.Specifications;
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
        public async Task<bool> Create(Product entity)
        {
            try
            {
                entity.MetaTitle = CommonConstants.ConvertToUnSign(entity.Name);
                entity.CreatedDate = DateTime.Now;
                _context.Products.Add(entity);
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
                var product = await _context.Products.FindAsync(id);
                if (product != null)
                {
                    _context.Products.Remove(product);
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