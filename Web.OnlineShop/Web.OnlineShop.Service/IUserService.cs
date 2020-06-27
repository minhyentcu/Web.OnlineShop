using System.Collections.Generic;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service
{
    public interface IUserService
    {
        Task<bool> CreateAsync(User user);

        Task<bool> DeleteAsync(long id);

        Task<bool> UpdateAsync(User user);

        IEnumerable<User> GetAll();

        Task<User> GetUserById(long id);

        Task<User> GetUserByUserName(string username);

        Task<bool> LoginAsync(string username, string password);

        Task<bool> SignUp(User user);

        Task<bool> Logout();

        IEnumerable<string> GetPermissions(string username);

        string GetGroupUser(string username);
    }
}