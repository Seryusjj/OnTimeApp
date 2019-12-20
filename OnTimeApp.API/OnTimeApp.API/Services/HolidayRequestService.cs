using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using OnTimeApp.API.Data.Results;
using OnTimeApp.API.Entities;
using OnTimeApp.API.Entities.DAL;

namespace OnTimeApp.API.Services
{
    public class HolidayRequestService : IHolidayRequestService
    {
        private readonly IHolidayRequestDAL _holidayManager;
        private readonly IAppUserDAL _userDal;


        public HolidayRequestService(IHolidayRequestDAL holidayManager, IAppUserDAL userDal)
        {
            _holidayManager = holidayManager;
            _userDal = userDal;
        }

        public async Task<ResultSet<HolidayRequestResult>> GetAllPendingRequestsFromUserAsync(string email)
        {
            var user = await _userDal.FindByEmailAsync(email);
            if (user == null)
            {
                return new ResultSet<HolidayRequestResult>
                {
                    Errors = new string[] {"The user does not exists"}
                };
            }

            var res = await _holidayManager.GetAllPendingFromUserAsync(user);

            return new ResultSet<HolidayRequestResult>
            {
                Success = true,
                Results = res.Select(Map)
            };
        }

        public async Task<ResultSet<HolidayRequestResult>> GetAllRequestsFromUserAsync(string email, int fromYear,
            int toYear)
        {
            var user = await _userDal.FindByEmailAsync(email);
            if (user == null)
            {
                return new ResultSet<HolidayRequestResult>
                {
                    Errors = new string[] {"The user does not exists"}
                };
            }

            var res = await _holidayManager.GetAllFromUserAsync(user, fromYear, toYear);
            return new ResultSet<HolidayRequestResult>
            {
                Success = true,
                Results = res.Select(Map)
            };
        }

        public async Task<HolidayRequestResult> RegisterHolidayRequestAsync(string email, DateTime from, DateTime to)
        {
            var user = await _userDal.FindByEmailAsync(email);
            if (user == null)
            {
                return new HolidayRequestResult
                {
                    Errors = new string[] {"The user does not exists"}
                };
            }

            var otherRequests = await _holidayManager.GetAllFromUserAsync(user, from.Year, to.Year);
            foreach (var r in otherRequests.Where(x=> !x.Deleted))
            {
                if (from.Date < r.DateFrom.Date && to.Date > r.DateTo.Date)
                {
                    return new HolidayRequestResult
                    {
                        Errors = new string[]
                            {"Cannot perform request because it contains days from other already existing requests"}
                    };
                }
            }

            var toAdd = new HolidayRequest
            {
                Approved = false,
                Approver = null,
                User = user,
                DateFrom = from,
                DateTo = to
            };
            var res = await _holidayManager.AddRequestAsync(toAdd);
            if (!res)
            {
                return new HolidayRequestResult
                {
                    Errors = new string[] {"Could not add request"}
                };
            }

            return Map(toAdd);
        }

        public async Task<HolidayRequestResult> ApproveRequestAsync(string requestId)
        {
            var request = await _holidayManager.FindRequestByIdAsync(requestId);
            if (request == null)
            {
                return new HolidayRequestResult
                {
                    Errors = new string[] {"The request to approve does not exists"}
                };
            }

            request.Approved = true;
            request.Approver = request.User.Manager;
            var updated = await _holidayManager.UpdateRequestAsync(request);
            if (!updated)
                return new HolidayRequestResult
                {
                    Errors = new string[] {"The request could not be approved"}
                };

            return Map(request);
        }
        
        public async Task<HolidayRequestResult> DeleteRequestAsync(string requestId)
        {
            var request = await _holidayManager.FindRequestByIdAsync(requestId);
            if (request == null)
            {
                return new HolidayRequestResult
                {
                    Errors = new string[] {"The request to delete does not exists"}
                };
            }

            request.Approved = false;
            request.Deleted = true;
            request.Approver = request.User.Manager;
            var updated = await _holidayManager.UpdateRequestAsync(request);
            if (!updated)
                return new HolidayRequestResult
                {
                    Errors = new string[] {"The request could not be deleted"}
                };

            return Map(request);
        }

        public async Task<ResultSet<HolidayRequestResult>> GetAllPendingRequestsForManagerAsync(string email)
        {
            var manager = await _userDal.FindByEmailAsync(email);
            if (manager == null)
            {
                return new ResultSet<HolidayRequestResult>
                {
                    Errors = new string[] {"The user does not exists"}
                };
            }

            // find all users under this manager
            List<HolidayRequest> requests = new List<HolidayRequest>();
            var users = await _userDal.GetUsersFromManagerAsync(manager);
            foreach (var user in users)
            {
                var res = await _holidayManager.GetAllPendingFromUserAsync(user);
                if (res != null)
                    requests.AddRange(res);
            }


            return new ResultSet<HolidayRequestResult>
            {
                Success = true,
                Results = requests.Select(Map)
            };
        }

        private HolidayRequestResult Map(HolidayRequest x)
        {
            return new HolidayRequestResult
            {
                Success = true,
                Approved = x.Approved,
                Deleted = x.Deleted,
                Id = x.Id,
                DateFrom = x.DateFrom,
                DateTo = x.DateTo,
                ApproverEmail = x.Approver?.Email,
                UserEmail = x.User.Email
            };
        }
    }
}