using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using OnTimeApp.API.Entities;

namespace OnTimeApp.API.Services
{
    public class UserService : IUserService
    {
        private readonly IDictionary<string, User> _users =
            new Dictionary<string, User>();

        private static int _id;
        private static int Id => ++_id;

        public UserService()
        {
            var users = new Dictionary<string, string>
            {
                {"sergiojj932@gmail.com", "password"},
                {"admin", "admin"}
            };
            foreach (var user in users)
            {
                var passHash = BCrypt.Net.BCrypt.HashPassword(user.Value);
                _users.Add(user.Key.ToLower(),
                    new User {Id = Id, Email = user.Key.ToLower(), PasswordHash = passHash, Roles = new List<Role>()});
            }
        }

        public Task<bool> ValidateCredentials(string email, string pass)
        {
            var key = email.ToLower();
            if (_users.ContainsKey(key))
            {
                var hash = _users[key].PasswordHash;
                if (BCrypt.Net.BCrypt.Verify(pass, hash))
                {
                    return Task.FromResult(true);
                }
            }

            return Task.FromResult(false);
        }

        public Task<bool> AddUser(string email, string password)
        {
            if (_users.ContainsKey(email.ToLower()))
            {
                return Task.FromResult(false);
            }

            var passHash = BCrypt.Net.BCrypt.HashPassword(password);
            _users.Add(email.ToLower(),
                new User {Id = Id, Email = email.ToLower(), PasswordHash = passHash, Roles = new List<Role>()});
            return Task.FromResult(true);
        }

        public Task<T> GetUser<T>(string email, Func<User, T> converter)
        {
            if (_users.ContainsKey(email))
            {
                return Task.FromResult(converter(_users[email]));
            }

            return Task.FromResult(default(T));
        }

        public Task<IEnumerable<T>> GetAllUsers<T>(Func<User, T> converter)
        {
            return Task.FromResult(_users.Values.Select(converter));
        }

        public Task<IEnumerable<string>> GetUserRoles(string email)
        {
            return Task.FromResult(_users[email].Roles.Select(x => x.RoleName));
        }
    }
}