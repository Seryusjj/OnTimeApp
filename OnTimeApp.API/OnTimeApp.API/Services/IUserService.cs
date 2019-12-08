using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using OnTimeApp.API.Entities;
using OnTimeApp.API.Model;

namespace OnTimeApp.API.Services
{
    public interface IUserService
    {
        Task<bool> ValidateCredentials(string email, string pass);

        Task<bool> AddUser(string email, string password);

        Task<T> GetUser<T>(string email, Func<User, T> converter);
        
        Task<IEnumerable<T>> GetAllUsers<T>(Func<User, T> converter);

        Task<IEnumerable<string>> GetUserRoles(string email);

    }
}