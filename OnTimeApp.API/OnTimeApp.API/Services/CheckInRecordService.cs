using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using OnTimeApp.API.Contracts.V1.Responses;
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
                Results = res.OrderBy(x=> x.UtcDateTime).Select(x => new CheckInResult
                {
                    Success = true,
                    EmailOwner = x.User.Email,
                    Info = x.Info,
                    UtcDateTime = x.UtcDateTime,
                    Location = x.Location,
                    EndDay = x.EndDay
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
                Results = checkIns.OrderBy(x=> x.UtcDateTime).Select(x =>
                    new CheckInResult
                    {
                        Success = true,
                        Info = x.Info,
                        UtcDateTime = x.UtcDateTime,
                        Location = x.Location,
                        EndDay = x.EndDay
                    })
            };
        }

        public async Task<ResultSet<CheckInResult>> GetCheckInByUserEmailAndDateAsync(string email, DateTime date)
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

            var checkIns = await _checkinManager.FindByUserEmailAndDateAsync(email, date);
            return new ResultSet<CheckInResult>
            {
                Success = true,
                Results = checkIns.OrderBy(x=> x.UtcDateTime).Select(x =>
                    new CheckInResult
                    {
                        Success = true,
                        Info = x.Info,
                        UtcDateTime = x.UtcDateTime,
                        Location = x.Location,
                        EndDay = x.EndDay
                    })
            };
        }

        public async Task<CheckInResult> RegisterCheckInAsync(string email, string info, DateTime utcDateTime,
            bool location, bool endDay)
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

            var checkIns = await _checkinManager.FindByUserEmailAndDateAsync(email, utcDateTime);
            var alreadyEnded = checkIns.Any(x => x.EndDay);
            if (alreadyEnded)
            {
                return new CheckInResult
                {
                    Errors = new[] {"Already finished current working day"}
                };
            }

            if ((checkIns.Count() + 1) % 2 != 0 && endDay)
            {
                return new CheckInResult
                {
                    Errors = new[] {"Cannot end your day, previous check ins are missing"}
                };
            }

            var insert = new CheckInRecord {User = user, Info = info, UtcDateTime = utcDateTime, Location = location, EndDay = endDay};

            bool added = await _checkinManager.AddRecord(insert);
            if (added)
            {
                return new CheckInResult
                {
                    Success = true,
                    Id = insert.Id,
                    Info = info,
                    UtcDateTime = utcDateTime,
                    EmailOwner = email,
                    Location = location,
                    EndDay = endDay
                };
            }

            return new CheckInResult
            {
                Success = false
            };
        }
        

        public async Task<WorkedTimeResult> WorkedTimeOnDayAsync(string email, DateTime date)
        {
            var user = await _userManager.FindByEmailAsync(email);
            if (user == null)
            {
                return new WorkedTimeResult
                {
                    Success = false,
                    Errors = new string[] {"User email does not exits"}
                };
            }
            var checkin = await _checkinManager.FindByUserEmailAndDateAsync(email, date);
            var checkInList = checkin.ToList();
            bool endDay = checkInList.Any(x => x.EndDay);
            if (!endDay)
            {
                return new WorkedTimeResult
                {
                    Success = false,
                    Errors = new string[] {"Too soon to calculate, the day did not ended yet"}
                };
            }

            
            long ticks = 0;
            try
            {
                int i = 0;
                while (i < checkInList.Count - 1)
                {
                    ticks += checkInList[i + 1].UtcDateTime.Ticks - checkInList[i].UtcDateTime.Ticks;
                    i += 2;
                }
            }
            catch (Exception e)
            {
                return new WorkedTimeResult
                {
                    Success = false,
                    Errors = new string[] {$"Some check ins are missing, processed ${checkInList.Count}"}
                };
            }


            return new WorkedTimeResult
            {
                Success = true,
                WorkedTime = new TimeSpan(ticks)
            };
        }
    }
}