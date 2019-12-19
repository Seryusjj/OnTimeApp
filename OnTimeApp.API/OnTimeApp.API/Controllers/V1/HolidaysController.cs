using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnTimeApp.API.Contracts.V1.Requests;
using OnTimeApp.API.Contracts.V1.Responses;
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
        /// <param name="email"></param>
        /// <returns></returns>
        [HttpGet("{email}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ResponseSet<HolidayRequestResponse>))]
        public async Task<ActionResult<ResponseSet<HolidayRequestResponse>>> ToApprove(string email)
        {
            return new ResponseSet<HolidayRequestResponse>(new string[]{});
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
            return new HolidayRequestResponse();
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
            return new ResponseSet<HolidayRequestResponse>(new string[]{});
        }
        
    }
}