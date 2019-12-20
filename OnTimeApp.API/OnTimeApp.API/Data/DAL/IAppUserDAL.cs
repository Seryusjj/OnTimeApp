using System.Collections.Generic;
using System.Threading.Tasks;

namespace OnTimeApp.API.Entities.DAL
{
    public interface IAppUserDAL
    {
        Task<AppUser> FindByEmailAsync(string email);
        
        Task<bool> UpdateUserAsync(AppUser user);
        Task<IEnumerable<AppUser>> GetUsersFromManagerAsync(AppUser manager);
    }
}