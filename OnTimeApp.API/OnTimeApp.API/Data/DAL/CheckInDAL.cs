using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Entities.DAL
{
    public class CheckInDAL : ICheckInDAL
    {
        private readonly DataContext _context;

        public CheckInDAL(DataContext context)
        {
            _context = context;
        }

        public Task<CheckInRecord> FindByIdAsync(string id)
        {
            return _context.CheckInRecords.FindAsync(id);
        }

        public async Task<IEnumerable<CheckInRecord>> FindByUserEmailAsync(string email)
        {
            var res = _context.CheckInRecords.Where(x => x.User.Email == email);
            return res.ToList();
        }

        public async Task<IEnumerable<CheckInRecord>> FindByUserEmailAndDateAsync(string email, DateTime date)
        {
            var res = _context.CheckInRecords.Where(x => x.User.Email == email && x.UtcDateTime.Date == date.Date);
            return res.ToList();
        }

        public async Task<IEnumerable<CheckInRecord>> FindByUserEmailAndDateRangeAsync(string email, DateTime from,
            DateTime to)
        {
            var res = _context.CheckInRecords.Where(x =>
                x.User.Email == email && (x.UtcDateTime.Date >= from.Date && x.UtcDateTime <= to.Date));
            return res.ToList();
        }

        public async Task<IEnumerable<CheckInRecord>> GetAllAsync()
        {
            return _context.CheckInRecords.ToList();
        }

        public async Task<bool> AddRecord(CheckInRecord record)
        {
            _context.Add(record);
            var additions = await _context.SaveChangesAsync();
            return additions > 0;
        }
    }
}