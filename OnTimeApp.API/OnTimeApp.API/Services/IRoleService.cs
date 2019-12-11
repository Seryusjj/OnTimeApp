using System.Threading.Tasks;
using OnTimeApp.API.Data.Results;


namespace OnTimeApp.API.Services
{
    public interface IRoleService
    {
        Task<RoleResult> RegisterRole(string role);
        
        Task<RoleResult> RemoveRole(string role);
        Task<ResultSet<RoleResult>> GetRoles();
    }
}