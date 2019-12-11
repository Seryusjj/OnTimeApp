using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using OnTimeApp.API.Entities;

namespace OnTimeApp.API.Services
{
    public class UserService : IUserService
    {
        private readonly UserManager<IdentityUser> _userManager;

        public UserService(UserManager<IdentityUser> userManager) 
        {
            _userManager = userManager;
        }
        public async Task<bool> AddRoleToUser(string email, string role)
        {
            var user = await _userManager.FindByEmailAsync(email);
            var res = await _userManager.AddToRoleAsync(user, role);
            return res.Succeeded;
        }

        public Task<IEnumerable<T>> GetAllUsers<T>(Func<IdentityUser, T> converter)
        {
            IEnumerable<IdentityUser> users = _userManager.Users;
            return Task.FromResult(users.Select(converter));
        }

        public Task<IEnumerable<string>> GetUserRoles(string email)
        {
            throw new NotImplementedException();
        }
    }
}