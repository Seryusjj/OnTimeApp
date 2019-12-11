using OnTimeApp.API.Data.Results;
using System.Threading.Tasks;

namespace OnTimeApp.API.Services
{
    public interface IIdentitySevice
    {
        Task<AuthenticationResult> RegisterAsync(string email, string password);
        
        Task<AuthenticationResult> LoginAsync(string email, string password);
    }
}
