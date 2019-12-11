using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnTimeApp.API.Contracts.V1.Requests;
using OnTimeApp.API.Contracts.V1.Responses;
using OnTimeApp.API.Services;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Controllers.V1
{
    [Route("api/v1/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    public class UsersController : Controller
    {
        private readonly IUserService _userService;

        public UsersController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ResponseSet<UserResponse>))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(ResponseSet<UserResponse>))]
        public async Task<ActionResult<ResponseSet<UserResponse>>> Get()
        {
            var res = await _userService.GetAllUsers();
            if (!res.Success)
            {
                return BadRequest(new ResponseSet<UserResponse>
                {
                    Errors = res.Errors
                });
            }
            return Ok(new ResponseSet<UserResponse>
            {
                Success = true,
                Response = res.Results.Select(x => new UserResponse
                {
                    Success = true,
                    Email = x.Email,
                    UserName = x.UserName
                })
            });
        }


        [HttpPost("addrole")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(RoleResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(RoleResponse))]
        public async Task<ActionResult<RoleResponse>> AddRole([FromBody] UserRoleAdditionRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new RoleResponse(ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage))));
            }
            var additionResponse = await _userService.AddRoleToUser(request.UserEmail, request.Role);
            if (!additionResponse.Success)
            {
                return BadRequest(new RoleResponse(additionResponse.Errors));
            }
            return Ok(new RoleResponse(additionResponse.RoleName));
        }
    }
}
