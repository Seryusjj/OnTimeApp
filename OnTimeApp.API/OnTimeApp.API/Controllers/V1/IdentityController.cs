using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnTimeApp.API.Contracts.V1.Requests;
using OnTimeApp.API.Contracts.V1.Responses;
using OnTimeApp.API.Services;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Controllers.NewFolder
{
    /// <summary>
    /// Identification controller, used for registering or login users
    /// </summary>
    [Route("api/v1/[controller]")]
    [ApiController]
    public class IdentityController : Controller
    {
        private readonly IIdentitySevice _identityService;
        private readonly IRoleService _roleService;
        private readonly IUserService _userService;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="identityService"></param>
        /// <param name="roleService"></param>
        /// <param name="userService"></param>
        public IdentityController(IIdentitySevice identityService,
                                  IRoleService roleService,
                                  IUserService userService)
        {
            _identityService = identityService;
            _roleService = roleService;
            _userService = userService;
        }


        /// <summary>
        /// Creates default admin user, this is added because we do not have a real database where to add this info.
        /// We use an in memeory db so each time the service is restarted, this should be called
        /// </summary>
        /// <returns></returns>
        [HttpPost("init")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(void))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(void))]
        public async Task<ActionResult> Init()
        {
            var authResponse = await _identityService.RegisterAsync("admin@admin.com", "Admin123!");
            var roleResponse = await _roleService.RegisterRole("Admin");
            var userResponse = await _userService.AddRoleToUser("admin@admin.com", "Admin");
            if (authResponse.Success && roleResponse.Success && userResponse.Success)
            {
                return Ok();
            }
            else
            {
                return BadRequest();
            }
        }


        /// <summary>
        /// Register a new user in the system
        /// </summary>
        /// <param name="request">The new user information</param>
        /// <returns>An Auth response</returns>
        /// <response code ="200">Returns an AuthResponse object with succes true and empty token</response>
        /// <response code ="400">Returns an AuthResponse object with errors in it</response>
        [HttpPost("register")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(AuthResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(AuthResponse))]
        public async Task<ActionResult<AuthResponse>> Register([FromBody] UserRegistrationRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new AuthResponse(ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage))));
            }
            var authResponse = await _identityService.RegisterAsync(request.Email, request.Password);
            if (!authResponse.Success)
            {
                return BadRequest(new AuthResponse(authResponse.Errors));
            }
            return Ok(new AuthResponse(string.Empty));
        }

        /// <summary>
        /// Login user in the system
        /// </summary>
        /// <param name="request">The user information</param>
        /// <returns>An Auth response</returns>
        /// <response code ="200">Returns an AuthResponse object with succes true and empty token</response>
        /// <response code ="400">Returns an AuthResponse object with errors in it</response>
        [HttpPost("login")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(AuthResponse))]
        [ProducesResponseType(StatusCodes.Status400BadRequest, Type = typeof(AuthResponse))]
        public async Task<ActionResult<AuthResponse>> Register([FromBody] UserLoginRequest request)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(new AuthResponse(ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage))));
            }
            var authResponse = await _identityService.LoginAsync(request.Email, request.Password);
            if (!authResponse.Success)
            {
                return BadRequest(new AuthResponse(authResponse.Errors));
            }
            return Ok(new AuthResponse(authResponse.Token));
        }
    }
}
