using System.Collections.Generic;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnTimeApp.API.Contracts.V1.Requests;
using OnTimeApp.API.Contracts.V1.Responses;
using OnTimeApp.API.Services;
using System.Linq;
using System.Security.AccessControl;
using System.Threading.Tasks;
using Microsoft.OpenApi.Any;


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
        public async Task<ActionResult<ResponseSet<UserResponse>>> Get()
        {
            var res = await _userService.GetAllUsersAsync();
            if (!res.Success)
            {
                return new ResponseSet<UserResponse>(res.Errors);
            }

            return new ResponseSet<UserResponse>(
                res.Results.Select(x => new UserResponse
                {
                    Success = true,
                    Email = x.Email,
                    UserName = x.UserName
                }));
        }

        [HttpGet("{email}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(UserResponse))]
        public async Task<ActionResult<UserResponse>> Get(string email)
        {
            var res = await _userService.GetUserAsync(email);
            return new UserResponse
            {
                Success = res.Success,
                Errors = res.Errors ?? new string[0],
                Email = res.Email,
                UserName = res.UserName
            };
        }

        [HttpPost(nameof(AddRole))]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(RoleResponse))]
        public async Task<ActionResult<RoleResponse>> AddRole([FromBody] UserRoleAdditionRequest request)
        {
            if (!ModelState.IsValid)
            {
                return
                    new RoleResponse(ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage)));
            }

            var additionResponse = await _userService.AddRoleToUserAsync(request.UserEmail, request.Role);
            if (!additionResponse.Success)
            {
                return new RoleResponse(additionResponse.Errors);
            }

            return new RoleResponse(additionResponse.RoleName);
        }


        [HttpGet(nameof(GetRoles) + "/{email}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ResponseSet<RoleResponse>))]
        public async Task<ActionResult<ResponseSet<RoleResponse>>> GetRoles(string email)
        {
            var res = await _userService.GetUserRolesAsync(email);
            if (!res.Success)
            {
                return Ok(new ResponseSet<RoleResponse>(res.Errors));
            }

            return Ok(new ResponseSet<RoleResponse>(res.Results.Select(x => new RoleResponse(x.RoleName))));
        }

        [HttpGet(nameof(Subordinates) + "/{email}")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ResponseSet<UserResponse>))]
        public async Task<ActionResult<ResponseSet<UserResponse>>> Subordinates(string email)
        {
            var res = await _userService.GetAllSubordiantesAsync(email);
            if (!res.Success)
            {
                return new ResponseSet<UserResponse>(res.Errors);
            }

            return new ResponseSet<UserResponse>(res.Results.Select(x => new UserResponse
            {
                Email = x.Email,
                UserName = x.UserName,
                Errors = new string[0]
            }));
        }
    }
}