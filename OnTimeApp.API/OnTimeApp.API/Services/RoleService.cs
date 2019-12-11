using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore.Storage;
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

        public async Task<bool> RegisterRole(string role)
        {
            var res = await _roleManager.CreateAsync(new IdentityRole(role));
            return res.Succeeded;
        }

        public async Task<bool> RemoveRole(string role)
        {
            var found = await _roleManager.FindByNameAsync(role);
            if (found == null)
                return false;
            return (await _roleManager.DeleteAsync(found)).Succeeded;            
        }


    }
}