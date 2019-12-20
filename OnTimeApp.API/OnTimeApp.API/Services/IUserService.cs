using System.Threading.Tasks;
using OnTimeApp.API.Data.Results;


namespace OnTimeApp.API.Services
{
    public interface IUserService
    {        
        Task<ResultSet<UserResult>> GetAllUsersAsync();

        Task<ResultSet<RoleResult>> GetUserRolesAsync(string email);

        Task<RoleResult> AddRoleToUserAsync(string email, string role);

        Task<UserResult> GetUserAsync(string email);


        Task<UserResult> AddManagerToUser(string userEmail, string managerEmail);
    }
}