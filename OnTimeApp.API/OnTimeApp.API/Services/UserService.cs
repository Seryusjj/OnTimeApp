using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using OnTimeApp.API.Data.Results;
using OnTimeApp.API.Entities;

namespace OnTimeApp.API.Services
{
    public class UserService : IUserService
    {
        private readonly UserManager<AppUser> _userManager;

        public UserService(UserManager<AppUser> userManager)
        {
            _userManager = userManager;
        }
        public async Task<RoleResult> AddRoleToUserAsync(string email, string role)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return new RoleResult
                {
                    Errors = new string[] { "The user does not exists" }
                };
            }
            var res = await _userManager.AddToRoleAsync(user, role);
            if (!res.Succeeded)
                return new RoleResult
                {
                    Errors = res.Errors.Select(x => x.Description)
                };

            return new RoleResult
            {
                RoleName = role,
                Success = res.Succeeded
            };
        }

        public Task<ResultSet<UserResult>> GetAllUsersAsync()
        {
            return Task.FromResult(new ResultSet<UserResult>
            {
                Success = true,
                Results = _userManager.Users.Select(x => new UserResult
                {
                    Email = x.Email,
                    UserName = x.UserName,
                    Success = true
                })
            });
        }
        
        public async Task<UserResult> GetUserAsync(string email)
        {
            var res = await _userManager.FindByEmailAsync(email);
            if (res == null)
            {
                return new UserResult
                {
                    Errors = new string[] {"User does not exists"}
                };
            }

            return new UserResult
            {
                Success = true,
                Email = res.Email,
                UserName = res.UserName
            };
        }

        public async Task<ResultSet<RoleResult>> GetUserRolesAsync(string email)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                new ResultSet<RoleResult>
                {
                    Errors = new string[] { "The user does not exists" }
                };
            }
            var roles = await _userManager.GetRolesAsync(user);
            return new ResultSet<RoleResult>
            {
                Success = true,
                Results = roles.Select(x => new RoleResult
                {
                    Success = true,
                    RoleName = x
                }).ToList()
            };
        }
    }
}