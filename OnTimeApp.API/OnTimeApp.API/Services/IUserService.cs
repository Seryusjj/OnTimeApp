using System.Threading.Tasks;
using OnTimeApp.API.Data.Results;


namespace OnTimeApp.API.Services
{
    public interface IUserService
    {        
        Task<ResultSet<UserResult>> GetAllUsers();

        Task<ResultSet<RoleResult>> GetUserRoles(string email);

        Task<RoleResult> AddRoleToUser(string email, string role);


    }
}