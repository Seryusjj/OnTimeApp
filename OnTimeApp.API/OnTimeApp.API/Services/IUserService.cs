using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using OnTimeApp.API.Model;

namespace OnTimeApp.API.Services
{
    public interface IUserService
    {        
        Task<IEnumerable<T>> GetAllUsers<T>(Func<IdentityUser, T> converter);

        Task<IEnumerable<string>> GetUserRoles(string email);

        Task<bool> AddRoleToUser(string email, string role);

    }
}