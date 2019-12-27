using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnTimeApp.API.Contracts.V1.Requests;
using OnTimeApp.API.Contracts.V1.Responses;
using OnTimeApp.API.Data.Results;
using OnTimeApp.API.Services;

namespace OnTimeApp.API.Controllers.V1
{
    [Route("api/v1/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    public class HolidaysController : Controller
    {
        private readonly IHolidayRequestService _holidayRequestService;

        public HolidaysController(IHolidayRequestService holidayRequestService)
        {
            _holidayRequestService = holidayRequestService;
        }


        /// <summary>
        /// Get the Holiday requests that the user has to approve
        /// </summary>
        /// <param name="email">The manager email</param>
        /// <returns></returns>
        [HttpGet(nameof(ToApprove)+"/{email}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ResponseSet<HolidayRequestResponse>))]
        public async Task<ActionResult<ResponseSet<HolidayRequestResponse>>> ToApprove(string email)
        {
            var res = await _holidayRequestService.GetAllPendingRequestsForManagerAsync(email);
            if (!res.Success)
            {
                return new ResponseSet<HolidayRequestResponse>(res.Errors);
            }

            return new ResponseSet<HolidayRequestResponse>(res.Results.Select(x => Map(x)));
        }


        /// <summary>
        /// Get a set of request that belong to the user with the passed email between the years from and to
        /// </summary>
        /// <param name="email">Owner email</param>
        /// <param name="from">From year</param>
        /// <param name="to">To year</param>
        /// <returns></returns>
        [HttpGet("{email}/{from}/{to}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ResponseSet<HolidayRequestResponse>))]
        public async Task<ActionResult<ResponseSet<HolidayRequestResponse>>> Get(string email, int from, int to)
        {
            var res = await _holidayRequestService.GetAllRequestsFromUserAsync(email, from, to);
            if (!res.Success)
            {
                return new ResponseSet<HolidayRequestResponse>(res.Errors);
            }

            return new ResponseSet<HolidayRequestResponse>(res.Results.Select(x => Map(x)));
        }
        
        
        /// <summary>
        /// Approve an existing Holiday request
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost(nameof(Approve))]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(HolidayRequestResponse))]
        public async Task<ActionResult<HolidayRequestResponse>> Approve([FromBody] HolidayApproveRequest request)
        {
            if (!ModelState.IsValid)
            {
                return Ok(new HolidayRequestResponse
                {
                    Errors = ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage))
                });
            }

            var res = await _holidayRequestService.ApproveRequestAsync(request.RequestId);
            if (!res.Success)
            {
                return new HolidayRequestResponse
                {
                    Errors = res.Errors
                };
            }

            return Map(res);
        }
        
        /// <summary>
        /// Delete an existing Holiday request
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost(nameof(Delete))]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(HolidayRequestResponse))]
        public async Task<ActionResult<HolidayRequestResponse>> Delete([FromBody] HolidayDeleteRequest request)
        {
            if (!ModelState.IsValid)
            {
                return Ok(new HolidayRequestResponse
                {
                    Errors = ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage))
                });
            }

            var res = await _holidayRequestService.DeleteRequestAsync(request.RequestId);
            if (!res.Success)
            {
                return new HolidayRequestResponse
                {
                    Errors = res.Errors
                };
            }

            return Map(res);
        }

        
        /// <summary>
        /// Register a new leave request
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost(nameof(Register))]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(HolidayRequestResponse))]
        public async Task<ActionResult<HolidayRequestResponse>> Register([FromBody] HolidayRequestRegistration request)
        {
            if (!ModelState.IsValid)
            {
                return new HolidayRequestResponse
                {
                    Errors = ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage))
                };
            }

            var res = await _holidayRequestService.RegisterHolidayRequestAsync(request.UserEmail, request.From,
                request.To);
            if (!res.Success)
            {
                return new HolidayRequestResponse
                {
                    Errors = res.Errors
                };
            }

            return Map(res);
        }

        
        
        
        private HolidayRequestResponse Map(HolidayRequestResult x)
        {
            return new HolidayRequestResponse
            {
                Approved = x.Approved,
                Errors = new string[0],
                Deleted = x.Deleted,
                Id = x.Id,
                Success = true,
                ApproverEmail = x.ApproverEmail,
                DateFrom = x.DateFrom,
                DateTo = x.DateTo,
                UserEmail = x.UserEmail
            };
        }

    }
}