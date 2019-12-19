using System.Threading.Tasks;

namespace OnTimeApp.API.Entities.DAL
{
    public class HolidayRequestDAL : IHolidayRequestDAL
    {
        private readonly DataContext _context;

        public HolidayRequestDAL(DataContext context)
        {
            _context = context;
        }

        public async Task<bool> AddRequestAsync(HolidayRequest request)
        {
            _context.HolidayRequests.Add(request);
            int additions = await _context.SaveChangesAsync();
            return additions > 0;  
        }
    }
}