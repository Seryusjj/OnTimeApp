using System.Collections.Generic;
using System.Threading.Tasks;

namespace OnTimeApp.API.Entities.DAL
{
    public interface IHolidayRequestDAL
    {
        Task<bool> AddRequestAsync(HolidayRequest request);
        
        Task<HolidayRequest> FindRequestByIdAsync(string id);
        Task<bool> UpdateRequestAsync(HolidayRequest request);
        
        Task<IEnumerable<HolidayRequest>> GetAllPendingFromUserAsync(AppUser user);
        Task<IEnumerable<HolidayRequest>> GetAllFromUserAsync(AppUser user, int yearFrom, int yearTo);


    }
}