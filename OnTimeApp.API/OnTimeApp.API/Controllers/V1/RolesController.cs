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
    public class RolesController : Controller
    {
        private readonly IRoleService _roleService;

        public RolesController(IRoleService roleService)
        {
            _roleService = roleService;
        }

        [HttpPost("register")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(RoleResponse))]
        public async Task<ActionResult<RoleResponse>> Register([FromBody] RoleRegistrationRequest request)
        {
            if (!ModelState.IsValid)
            {
                return Ok(new RoleResponse(ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage))));
            }
            var res = await _roleService.RegisterRoleAsync(request.RoleName);
            if (!res.Success) 
            {
                return Ok(new RoleResponse(res.Errors));
            }
            return Ok(new RoleResponse(res.RoleName));
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ResponseSet<string>))]
        public async Task<ActionResult<ResponseSet<string>>> Get()
        {
            var res = await _roleService.GetRolesAsync();
            if (!res.Success)
            {
                return Ok(new ResponseSet<string>(errors: res.Errors));
            }
            return Ok(new ResponseSet<string>(response: res.Results.Select(x=> x.RoleName)));
        }
    }
}
