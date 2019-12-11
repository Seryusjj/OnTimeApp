using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnTimeApp.API.Contracts.V1.Requests;
using OnTimeApp.API.Contracts.V1.Responses;
using OnTimeApp.API.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;

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
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(RoleResponse))]
        public async Task<ActionResult<RoleResponse>> Register([FromBody] RoleRegistrationRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new RoleResponse(ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage))));
            }
            var res = await _roleService.RegisterRole(request.RoleName);
            if (!res.Success) 
            {
                return BadRequest(new RoleResponse(res.Errors));
            }
            return Ok(new RoleResponse(res.RoleName));
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(ResponseSet<string>))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(ResponseSet<string>))]
        public async Task<ActionResult<ResponseSet<string>>> Get()
        {
            var res = await _roleService.GetRoles();
            if (!res.Success)
            {
                return BadRequest(new ResponseSet<string> 
                {
                    Errors = res.Errors
                });
            }
            return Ok(new ResponseSet<string> 
            {
                Success = true,
                Response = res.Results.Select(x=> x.RoleName)
            });
        }
    }
}
