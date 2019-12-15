using System.Collections.Generic;
using System.Threading.Tasks;

namespace OnTimeApp.API.Entities.DAL
{
    public interface ICheckInDAL
    {
        Task<CheckInRecord> FindByIdAsync(string id);
        Task<IEnumerable<CheckInRecord>> FindByUserEmailAsync(string email);
        Task<IEnumerable<CheckInRecord>> GetAllAsync();

        Task<bool> AddRecord(CheckInRecord record);
    }
}