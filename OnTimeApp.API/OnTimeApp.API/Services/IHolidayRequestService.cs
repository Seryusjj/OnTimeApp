using System;
using System.Threading.Tasks;
using OnTimeApp.API.Data.Results;

namespace OnTimeApp.API.Services
{
    public interface IHolidayRequestService
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="email">The owner email</param>
        /// <returns></returns>
        Task<ResultSet<HolidayRequestResult>> GetAllPendingRequestsFromUserAsync(string email);
        
        Task<ResultSet<HolidayRequestResult>> GetAllRequestsFromUserAsync(string email, int fromYear, int toYear);
        
        Task<HolidayRequestResult> RegisterHolidayRequestAsync(string email, DateTime from, DateTime to);
        
        Task<HolidayRequestResult> ApproveRequestAsync(string requestId);
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="email">The approver email</param>
        /// <returns></returns>
        Task<ResultSet<HolidayRequestResult>> GetAllPendingRequestsForManagerAsync(string email);

        Task<HolidayRequestResult> DeleteRequestAsync(string requestId);
    }
}