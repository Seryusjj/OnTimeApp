using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnTimeApp.API.Contracts.V1.Responses;
using OnTimeApp.API.Services;

namespace OnTimeApp.API.Controllers
{
    [Route("api/v1/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    public class CheckInRecordsController : Controller
    {
        private readonly ICheckInRecordService _recordService;

        public CheckInRecordsController(ICheckInRecordService recordService)
        {
            _recordService = recordService;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ResponseSet<CheckInResponse>))]
        public async Task<ActionResult<ResponseSet<CheckInResponse>>> Get()
        {
            var records = await _recordService.GetAllCheckInsAsync();
            if (records.Success)
            {
                return Ok(new ResponseSet<CheckInResponse>(records.Errors));
            }

            return Ok(new ResponseSet<CheckInResponse>(
                records.Results.Select(x => new CheckInResponse
                {
                    Success = true,
                    Info = x.Info,
                    UtcDateTime = x.UtcDateTime
                })));
        }

        [HttpGet("{email}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ResponseSet<CheckInResponse>))]
        public async Task<ActionResult<ResponseSet<CheckInResponse>>> Get(string email)
        {
            var records = await _recordService.GetCheckInByUserEmailAsync(email);
            if (records.Success)
            {
                return Ok(new ResponseSet<CheckInResponse>(records.Errors));
            }

            return Ok(new ResponseSet<CheckInResponse>(
                records.Results.Select(x => new CheckInResponse
                {
                    Success = true,
                    Info = x.Info,
                    UtcDateTime = x.UtcDateTime
                })));
        }
    }
}