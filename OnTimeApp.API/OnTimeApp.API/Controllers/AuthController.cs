using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using OnTimeApp.API.Model;
using OnTimeApp.API.Services;

namespace OnTimeApp.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : Controller
    {
        private IUserService _userService;

        public AuthController(IUserService userService)
        {
            _userService = userService;
        }

        [Route("signin")]
        [HttpPost]
        public async Task<ActionResult<bool>> SingIn(UserModel model)
        {
            if (ModelState.IsValid)
            {
                if (await _userService.ValidateCredentials(model.Email, model.Password))
                {
                    var roles = await _userService.GetUserRoles(model.Email);
                    await SingInUser(model.Email, roles);
                    return true;
                }
            }

            return false;
        }

        [Route("singout")]
        [HttpPost]
        public async Task<IActionResult> SingOut()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return NoContent();
        }

        [Route("registeruser")]
        [Authorize(Roles = "admin")]
        [HttpPost]
        public async Task<ActionResult<bool>> RegisterUser(SingUpModel user)
        {
            if (ModelState.IsValid)
            {
                if (await _userService.AddUser(user.Email, user.Password))
                {
                    return true;
                }
            }
            return false;
        }

        private async Task SingInUser(string userEmail, IEnumerable<string> roles)
        {
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Email, userEmail)
            };
            foreach (var r in roles)
            {
                claims.Add(new Claim(ClaimTypes.Role, r));
            }

            var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme,
                ClaimTypes.Email, ClaimTypes.Role);
            var principal = new ClaimsPrincipal(identity);
            await HttpContext.SignInAsync(principal);
        }
    }
}