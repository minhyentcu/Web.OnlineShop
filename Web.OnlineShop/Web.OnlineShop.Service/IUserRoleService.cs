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

        UserGroup GetUserGroupById(string id);

        IEnumerable<Role> GetRoles();

        IEnumerable<Role> GetRolesByGroupId(string groupID);

        IEnumerable<Permission> GetPermissionByGroup(string groupID);

        Task<bool> CreatePermission(UserGroup group);

        Task<bool> DeletePermission(string groupId, string roleId);

        Task<bool> UpdatePermission(UserGroup group);

        Task<bool> UpdateUserRole(string groupId,string[]roleId);

        IEnumerable<Permission> GetPermissions();
    }
}
