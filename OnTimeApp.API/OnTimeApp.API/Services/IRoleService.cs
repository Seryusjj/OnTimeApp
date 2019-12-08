using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using OnTimeApp.API.Entities;

namespace OnTimeApp.API.Services
{
    public interface IRoleService
    {
        Task<bool> AddRole(string role);
        
        Task<bool> RemoveRole(string role);
        
        Task<bool> AddRoleToUser(string userEmail, string role);
        
    }
}