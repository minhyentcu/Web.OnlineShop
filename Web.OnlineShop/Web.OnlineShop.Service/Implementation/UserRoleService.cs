using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service.Implementation
{
    public class UserRoleService : IUserRoleService
    {

        private readonly OnlineShopDbContext _context;
        public UserRoleService(OnlineShopDbContext context)
        {
            _context = context;
        }
        public Task<bool> CreateAsync(UserGroup group)
        {
            throw new NotImplementedException();
        }

        public Task<bool> CreatePermission(UserGroup group)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteAsync(string id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeletePermission(string id)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Permission> GetPermissionByGroup(string groupID)
        {
            return _context.Permissions.Where(x => x.UserGroupId == groupID);
        }

        public IEnumerable<Role> GetRoles()
        {
            return _context.Roles;
        }

        public IEnumerable<Role> GetRolesByGroupId(string groupID)
        {

            var roles = _context.Permissions.Where(x => x.UserGroupId == groupID).Select(x => x.RoleId).ToList();
            return _context.Roles.Where(x => !roles.Contains(x.Id));
        }

        public IEnumerable<UserGroup> GetUserGroups()
        {
            return _context.UserGroups;
        }

        public Task<bool> UpdateAsync(UserGroup group)
        {
            throw new NotImplementedException();
        }

        public Task<bool> UpdatePermission(UserGroup group)
        {
            throw new NotImplementedException();
        }
    }
}
