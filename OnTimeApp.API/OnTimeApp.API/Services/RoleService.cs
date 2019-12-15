using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore.Storage;
using OnTimeApp.API.Data.Results;
using OnTimeApp.API.Entities;

namespace OnTimeApp.API.Services
{
    public class RoleService : IRoleService
    {
        private readonly RoleManager<IdentityRole> _roleManager;

        public RoleService(RoleManager<IdentityRole> roleManager)
        {
            _roleManager = roleManager;
        }

        public async Task<RoleResult> RegisterRoleAsync(string role)
        {
            var res = await _roleManager.CreateAsync(new IdentityRole(role));
            if (!res.Succeeded)
            {
                return new RoleResult
                {
                    Errors = res.Errors.Select(x => x.Description)
                };
            }
            return new RoleResult
            {
                RoleName = role,
                Success = res.Succeeded
            };
        }

        public Task<ResultSet<RoleResult>> GetRolesAsync() 
        {
            return Task.FromResult(new ResultSet<RoleResult>
            {
                Success = true,
                Results = _roleManager.Roles.Select(x => new RoleResult
                {
                    Success = true,
                    RoleName = x.Name,                    
                }).ToList()
            });
        }

        public async Task<RoleResult> RemoveRoleAsync(string role)
        {
            var found = await _roleManager.FindByNameAsync(role);
            if (found == null)
                return new RoleResult
                {
                    Errors = new string[] { "Role does not exists" }
                };
            var del = await _roleManager.DeleteAsync(found);
            if (!del.Succeeded)
                return new RoleResult
                {
                    Errors = del.Errors.Select(x => x.Description)
                };

            return new RoleResult
            {
                Success = del.Succeeded,
                RoleName = role
            };
        }


    }
}