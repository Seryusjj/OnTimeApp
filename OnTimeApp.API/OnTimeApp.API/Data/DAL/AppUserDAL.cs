using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Entities.DAL
{
    public class AppUserDAL : IAppUserDAL
    {
        private readonly DataContext _context;

        public AppUserDAL(DataContext context)
        {
            _context = context;
        }

        public async Task<AppUser> FindByEmailAsync(string email)
        {
            return _context.Users.FirstOrDefault(x => x.Email == email);
        }

        public async Task<bool> UpdateUserAsync(AppUser user)
        {
            var found = _context.Users.FirstOrDefault(x => x.Id == user.Id);
            if (found != null)
            {
                found.Manager = user.Manager;
                found.Email = user.Email;
                found.ConcurrencyStamp = user.ConcurrencyStamp;
                found.EmailConfirmed = user.EmailConfirmed;
                found.LockoutEnabled = user.LockoutEnabled;
                found.NormalizedEmail = user.NormalizedEmail;
                found.PasswordHash = user.PasswordHash;
                found.PhoneNumber = user.PhoneNumber;
                found.SecurityStamp = user.SecurityStamp;
                found.UserName = user.UserName;
                found.AccessFailedCount = user.AccessFailedCount;
                found.NormalizedUserName = user.NormalizedUserName;
                found.PhoneNumberConfirmed = user.PhoneNumberConfirmed;
                found.TwoFactorEnabled = user.TwoFactorEnabled;
                var res = await _context.SaveChangesAsync();
                return true;
            }

            return false;
        }

        public async Task<IEnumerable<AppUser>> GetUsersFromManagerAsync(AppUser manager)
        {
            
            return _context.Users.Where(x => x.Manager != null && x.Manager.Id == manager.Id);
        }
    }
}