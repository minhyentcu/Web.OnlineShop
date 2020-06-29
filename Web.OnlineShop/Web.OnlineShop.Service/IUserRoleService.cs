using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Web.OnlineShop.Entity;

namespace Web.OnlineShop.Service
{
    public interface IUserRoleService
    {
        Task<bool> CreateAsync(UserGroup group);

        Task<bool> DeleteAsync(string id);

        Task<bool> UpdateAsync(UserGroup group);

        IEnumerable<UserGroup> GetUserGroups();

        IEnumerable<Role> GetRoles();

        IEnumerable<Role> GetRolesByGroupId(string groupID);

        IEnumerable<Permission> GetPermissionByGroup(string groupID);

        Task<bool> CreatePermission(UserGroup group);

        Task<bool> DeletePermission(string id);

        Task<bool> UpdatePermission(UserGroup group);
    }
}
