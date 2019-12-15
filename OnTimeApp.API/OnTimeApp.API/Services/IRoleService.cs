using System.Threading.Tasks;
using OnTimeApp.API.Data.Results;


namespace OnTimeApp.API.Services
{
    public interface IRoleService
    {
        Task<RoleResult> RegisterRoleAsync(string role);
        
        Task<RoleResult> RemoveRoleAsync(string role);
        Task<ResultSet<RoleResult>> GetRolesAsync();
    }
}