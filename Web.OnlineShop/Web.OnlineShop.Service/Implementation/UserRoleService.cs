using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
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
        public async Task<bool> CreateAsync(UserGroup group)
        {
            try
            {
                _context.UserGroups.Add(group);
                await _context.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public Task<bool> CreatePermission(UserGroup group)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> DeleteAsync(string id)
        {
            try
            {
                var group = await _context.UserGroups.FirstOrDefaultAsync(x => x.Id == id);
                if (group != null)
                {
                    _context.UserGroups.Remove(group);
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

        public async Task<bool> DeletePermission(string groupId, string roleId)
        {
            try
            {
                var permission = await _context.Permissions.FirstOrDefaultAsync(x => x.UserGroupId == groupId & x.RoleId == roleId);
                if (permission != null)
                {
                    _context.Permissions.Remove(permission);
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

        public IEnumerable<Permission> GetPermissionByGroup(string groupID)
        {
            return _context.Permissions.Where(x => x.UserGroupId == groupID);
        }

        public IEnumerable<Permission> GetPermissions()
        {
            return _context.Permissions;
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

        public UserGroup GetUserGroupById(string id)
        {
            return _context.UserGroups.FirstOrDefault(x => x.Id == id);
        }

        public IEnumerable<UserGroup> GetUserGroups()
        {
            return _context.UserGroups;
        }

        public async Task<bool> UpdateAsync(UserGroup group)
        {
            try
            {
                var entity = await _context.UserGroups.FirstOrDefaultAsync(x => x.Id == group.Id);
                if (group != null)
                {
                    entity.Name = entity.Name;
                    entity.Id = entity.Id;
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

        public Task<bool> UpdatePermission(UserGroup group)
        {
            throw new NotImplementedException();
        }

        public async Task<bool> UpdateUserRole(string groupId, string[] roleId)
        {
            try
            {
                if (roleId.Count() > 0)
                {
                    foreach (var item in roleId)
                    {
                        _context.Permissions.Add(new Permission
                        {
                            UserGroupId = groupId,
                            RoleId = item
                        });
                    }
                    await _context.SaveChangesAsync();
                }
                return true;

            }
            catch (Exception)
            {

                return false;
            }

        }
    }
}
