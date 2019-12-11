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

namespace OnTimeApp.API.Controllers.V1
{
    [Route("api/v1/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme, Roles = "Admin")]
    [ProducesResponseType(StatusCodes.Status401Unauthorized)]
    public class RoleAdministrationController : Controller
    {
        private readonly IRoleService _roleService;

        public RoleAdministrationController(IRoleService roleService)
        {
            _roleService = roleService;
        }

        [HttpPost("register")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(RoleResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(RoleResponse))]
        public async Task<ActionResult<RoleResponse>> Register([FromBody] RoleRegistrationRequest request)
        {
            return Ok();
        }
    }
}
