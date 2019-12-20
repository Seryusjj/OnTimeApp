using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace OnTimeApp.API.Entities.DAL
{
    public class HolidayRequestDAL : IHolidayRequestDAL
    {
        private readonly DataContext _context;

        public HolidayRequestDAL(DataContext context)
        {
            _context = context;
        }

        public async Task<HolidayRequest> FindRequestByIdAsync(string id)
        {
            return _context.HolidayRequests.Include(x => x.User).FirstOrDefault(x => x.Id == id);
        }

        public async Task<bool> UpdateRequestAsync(HolidayRequest request)
        {
            var reference = _context.HolidayRequests.FirstOrDefault(x => x.Id == request.Id);
            if (reference != null)
            {
                reference.Approved = request.Approved;
                reference.Approver = request.Approver;
                reference.User = request.User;
                reference.DateFrom = request.DateFrom;
                reference.DateTo = request.DateTo;
                await _context.SaveChangesAsync();
                return true;
            }

            return false;
        }

        public async Task<bool> AddRequestAsync(HolidayRequest request)
        {
            _context.HolidayRequests.Add(request);
            int additions = await _context.SaveChangesAsync();
            return additions > 0;
        }

        public async Task<IEnumerable<HolidayRequest>> GetAllPendingFromUserAsync(AppUser user)
        {
            return _context.HolidayRequests.Where(x => x.User.Id == user.Id && !x.Approved && !x.Deleted).ToList();
        }

        public async Task<IEnumerable<HolidayRequest>> GetAllFromUserAsync(AppUser user, int yearFrom, int yearTo)
        {
            return _context.HolidayRequests
                .Where(x => x.User.Id == user.Id && (x.DateFrom.Year >= yearFrom && x.DateTo.Year <= yearTo)).ToList();
        }
    }
}