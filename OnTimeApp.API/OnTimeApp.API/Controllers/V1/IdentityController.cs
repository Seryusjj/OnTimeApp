﻿using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnTimeApp.API.Contracts.V1.Requests;
using OnTimeApp.API.Contracts.V1.Responses;
using OnTimeApp.API.Services;

namespace OnTimeApp.API.Controllers.V1
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
        private readonly ICheckInRecordService _checkInRecordService;
        private readonly IHolidayRequestService _holidayRequestService;

        private static bool init = false;

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="identityService"></param>
        /// <param name="roleService"></param>
        /// <param name="userService"></param>
        /// <param name="checkInRecordService"></param>
        /// <param name="holidayRequestService"></param>
        public IdentityController(IIdentitySevice identityService,
            IRoleService roleService,
            IUserService userService,
            ICheckInRecordService checkInRecordService,
            IHolidayRequestService holidayRequestService)
        {
            _identityService = identityService;
            _roleService = roleService;
            _userService = userService;
            _checkInRecordService = checkInRecordService;
            _holidayRequestService = holidayRequestService;
        }


        /// <summary>
        /// Creates default admin user, this is added because we do not have a real database where to add this info.
        /// We use an in memory db so each time the service is restarted, this should be called
        /// </summary>
        /// <returns></returns>
        [HttpPost("init")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(void))]
        public async Task<ActionResult> Init()
        {
            if (!init)
            {
                init = true;
                await _identityService.RegisterAsync("admin@admin.com", "Admin123!");
                await _identityService.RegisterAsync("sergio@sergio.com", "Sergio123!");
                await _identityService.RegisterAsync("dev@dev.com", "Dev123!");

                await _roleService.RegisterRoleAsync("Admin");
                await _roleService.RegisterRoleAsync("Manager");
                await _roleService.RegisterRoleAsync("Worker");

                await _userService.AddRoleToUserAsync("admin@admin.com", "Admin");

                await _userService.AddRoleToUserAsync("sergio1@sergio.com", "Worker");

                await _userService.AddRoleToUserAsync("dev@dev.com", "Worker");
                await _userService.AddRoleToUserAsync("dev@dev.com", "Admin");
                await _userService.AddRoleToUserAsync("dev@dev.com", "Manager");

                // Holiday
                await _userService.AddManagerToUser("dev@dev.com", "admin@admin.com");
                await _userService.AddManagerToUser("admin@admin.com", "admin@admin.com");
                await _holidayRequestService.RegisterHolidayRequestAsync("dev@dev.com", DateTime.Now,
                    DateTime.Now.AddDays(3));


                // checkin
                await _checkInRecordService.RegisterCheckInAsync("admin@admin.com", "long -lat bla bla",
                    DateTime.UtcNow, true, false);
                /*await _checkInRecordService.RegisterCheckInAsync("admin@admin.com", "long -lat bla bla",
                    DateTime.UtcNow.AddHours(1), false, false);
                await _checkInRecordService.RegisterCheckInAsync("admin@admin.com", "long -lat bla bla",
                    DateTime.UtcNow.AddHours(2), true, false);*/

                await _checkInRecordService.RegisterCheckInAsync("admin@admin.com", "long -lat bla bla",
                    DateTime.UtcNow.AddHours(2), true, false);

                await _checkInRecordService.RegisterCheckInAsync("admin@admin.com", "long -lat bla bla",
                    DateTime.UtcNow.AddDays(-1), true, false);
                await _checkInRecordService.RegisterCheckInAsync("admin@admin.com", "long -lat bla bla",
                    DateTime.UtcNow.AddDays(-1).AddHours(1), true, false);
                await _checkInRecordService.RegisterCheckInAsync("admin@admin.com", "long -lat bla bla",
                    DateTime.UtcNow.AddDays(-1).AddHours(2), false, false);
                await _checkInRecordService.RegisterCheckInAsync("admin@admin.com", "long -lat bla bla",
                    DateTime.UtcNow.AddDays(-1).AddHours(3), false, true);
            }

            return Ok();
        }


        /// <summary>
        /// Register a new user in the system
        /// </summary>
        /// <param name="request">The new user information</param>
        /// <returns>An Auth response</returns>
        /// <response code ="200">Returns an AuthResponse object with success true and empty token</response>
        [HttpPost("register")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(AuthResponse))]
        public async Task<ActionResult<AuthResponse>> Register([FromBody] UserRegistrationRequest request)
        {
            if (!ModelState.IsValid)
            {
                return new AuthResponse(ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage)));
            }

            var authResponse = await _identityService.RegisterAsync(request.Email, request.Password);
            if (!authResponse.Success)
            {
                return new AuthResponse(authResponse.Errors);
            }

            return new AuthResponse(string.Empty);
        }

        /// <summary>
        /// Login user in the system
        /// </summary>
        /// <param name="request">The user information</param>
        /// <returns>An Auth response</returns>
        /// <response code ="200">Returns an AuthResponse object with success true and empty token</response>
        [HttpPost("login")]
        [ProducesResponseType(StatusCodes.Status200OK, Type = typeof(AuthResponse))]
        public async Task<ActionResult<AuthResponse>> Login([FromBody] UserLoginRequest request)
        {
            if (!ModelState.IsValid)
            {
                return new AuthResponse(ModelState.Values.SelectMany(x => x.Errors.Select(y => y.ErrorMessage)));
            }

            var authResponse = await _identityService.LoginAsync(request.Email, request.Password);
            if (!authResponse.Success)
            {
                return new AuthResponse(authResponse.Errors);
            }

            return new AuthResponse(authResponse.Token);
        }
    }
}