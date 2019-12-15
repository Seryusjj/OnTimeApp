using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using OnTimeApp.API.Data.Results;
using OnTimeApp.API.Entities;
using OnTimeApp.API.Entities.DAL;

namespace OnTimeApp.API.Services
{
    public class CheckInRecordService : ICheckInRecordService
    {
        private readonly ICheckInDAL _checkinManager;
        private readonly UserManager<IdentityUser> _userManager;

        public CheckInRecordService(ICheckInDAL checkinManager, UserManager<IdentityUser> userManager)
        {
            _checkinManager = checkinManager;
            _userManager = userManager;
        }

        public async Task<ResultSet<CheckInResult>> GetAllCheckInsAsync()
        {
            var res = await _checkinManager.GetAllAsync();
            return new ResultSet<CheckInResult>()
            {
                Success = true,
                Results = res.Select(x => new CheckInResult
                {
                    Success = true,
                    EmailOwner = x.User.Email,
                    Info = x.Info,
                    UtcDateTime = x.UtcDateTime
                })
            };
        }

        public async Task<ResultSet<CheckInResult>> GetCheckInByUserEmailAsync(string email)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return new ResultSet<CheckInResult>()
                {
                    Success = false,
                    Errors = new string[] {"User email does not exits"}
                };
            }

            var checkIns = await _checkinManager.FindByUserEmailAsync(email);
            return new ResultSet<CheckInResult>
            {
                Success = true,
                Results = checkIns.Select(x =>
                    new CheckInResult
                    {
                        Success = true,
                        Info = x.Info,
                        UtcDateTime = x.UtcDateTime
                    })
            };
        }

        public async Task<CheckInResult> RegisterCheckInAsync(string email, string info, DateTime utcDateTime)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return new CheckInResult
                {
                    Success = false,
                    Errors = new string[] {"User email does not exits"}
                };
            }

            var insert = new CheckInRecord {User = user, Info = info, UtcDateTime = utcDateTime};

            bool added = await _checkinManager.AddRecord(insert);
            if (added)
            {
                return new CheckInResult
                {
                    Success = true,
                    Id = insert.Id,
                    Info = info,
                    UtcDateTime = utcDateTime,
                    EmailOwner = email
                };
            }

            return new CheckInResult
            {
                Success = false
            };
        }
    }
}