using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore.Storage;
using OnTimeApp.API.Entities;

namespace OnTimeApp.API.Services
{
    public class RoleService : IRoleService
    {
        private IUserService _userService;
        private Dictionary<string, Role> _roles = new Dictionary<string, Role>();
        private static int _id;
        private static int Id => ++_id;
        
        public RoleService(IUserService userService)
        {
            _userService = userService;
            _roles.Add("admin", new Role(){Id = Id, RoleName = "admin"});
        }


        public Task<bool> AddRole(string role)
        {
            
            return Task.FromResult(false);
        }

        public Task<bool> RemoveRole(string role)
        {
            IEnumerable<IEnumerable<Role>> usedRoles = _userService.GetAllUsers(x => x.Roles.Select(y => y)).Result;
            bool isRoleInUse = usedRoles.Any(x => x.Any(y => y.RoleName == role));
            if (isRoleInUse || !_roles.ContainsKey(role))
            {
                Task.FromResult(false);
            }
            return Task.FromResult(_roles.Remove(role));
        }

        public Task<bool> AddRoleToUser(string userEmail, string role)
        {
            if (!_roles.ContainsKey(role))
            {
                return Task.FromResult(false);
            }

            var user = _userService.GetUser(userEmail, x => x).Result;
            ((List<Role>)user.Roles).Add(_roles[role]);
            return Task.FromResult(true);
        }
    }
}