using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using Web.OnlineShop.Common;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class UserService : IUserService
    {
        private readonly OnlineShopDbContext _context;

        public UserService(OnlineShopDbContext context)
        {
            _context = context;
        }

        public async Task<bool> DeleteAsync(long id)
        {
            try
            {
                var user = await GetUserById(id);
                if (user != null)
                {
                    _context.Users.Remove(user);
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

        public IEnumerable<User> GetAll()
        {
            return _context.Users;
        }

        public async Task<User> GetUserById(long id)
        {
            return await _context.Users.FirstOrDefaultAsync(x => x.Id == id);
        }

        public async Task<bool> CreateAsync(User user)
        {
            try
            {
                user.GroupId = CommonConstants.MEMBER_GROUP;
                user.CreatedDate = DateTime.Now;
                _context.Users.Add(user);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }

        public async Task<bool> LoginAsync(string userName, string password)
        {
            var result = await _context.Users.CountAsync(x => x.UserName == userName && x.Password == password);
            return result > 0;
        }

        public async Task<bool> UpdateAsync(User entity)
        {
            try
            {
                var user = await _context.Users.FindAsync(entity.Id);
                if (user != null)
                {
                    user.Name = entity.Name;
                    user.Address = entity.Address;
                    user.Email = entity.Email;
                    user.ModifileBy = entity.ModifileBy;
                    user.Phone = entity.Phone;
                    user.ModifiedDate = DateTime.Now;
                    if (!string.IsNullOrEmpty(user.Password))
                    {
                        user.Password = Encryptor.MD5Hash(entity.Password);
                    }
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

        public async Task<User> GetUserByUserName(string username)
        {
            return await _context.Users.FirstOrDefaultAsync(x => x.UserName == username);
        }

        public async Task<bool> SignUp(User user)
        {
            try
            {
                user.Password = Encryptor.MD5Hash(user.Password);
                _context.Users.Add(user);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public Task<bool> Logout()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<string> GetPermissions(string username)
        {
            var user = _context.Users.FirstOrDefault(x => x.UserName == username);
            var permissions = _context.Permissions.Where(x => x.UserGroupId == user.GroupId);

            return permissions.Select(x => x.RoleId).ToList();
        }

        public string GetGroupUser(string username)
        {
            return _context.Users.FirstOrDefault(x => x.UserName == username).GroupId;
        }
    }
}