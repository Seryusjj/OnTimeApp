using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using OnTimeApp.API.Entities;
using OnTimeApp.API.Options;

namespace OnTimeApp.API.Services
{
    public class IdentityService : IIdentitySevice
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly JwtSettings _jwtSettings;

        public IdentityService(UserManager<IdentityUser> userManager, JwtSettings jwtSettings,
            RoleManager<IdentityRole> roleManager)
        {
            _userManager = userManager;
            _jwtSettings = jwtSettings;
            _roleManager = roleManager;
        }

        public async Task<AuthenticationResult> LoginAsync(string email, string password)
        {
            IdentityUser existingUser = await _userManager.FindByEmailAsync(email);
            if (existingUser == null)
            {
                return new AuthenticationResult
                {
                    Errors = new[] {"User does not exists"}
                };
            }

            var userHasValidPassword = await _userManager.CheckPasswordAsync(existingUser, password);
            if (!userHasValidPassword)
            {
                return new AuthenticationResult
                {
                    Errors = new[] {"User/password combination is wrong"}
                };
            }


            var userRoles = await _userManager.GetRolesAsync(existingUser);
            string token = JwtSecurityTokenResolve(existingUser, userRoles);
            return new AuthenticationResult
            {
                Success = true,
                Token = token
            };
        }

        public async Task<AuthenticationResult> RegisterAsync(string email, string password)
        {
            var existingUser = await _userManager.FindByEmailAsync(email);
            if (existingUser != null)
            {
                return new AuthenticationResult
                {
                    Errors = new[] {"User with this email address already exists"}
                };
            }

            var newUser = new IdentityUser
            {
                Email = email,
                UserName = email
            };

            IdentityResult createdUser = await _userManager.CreateAsync(newUser, password);
            if (!createdUser.Succeeded)
            {
                return new AuthenticationResult
                {
                    Errors = createdUser.Errors.Select(x => x.Description)
                };
            }

            // all will be admin after creating
            await _roleManager.CreateAsync(new IdentityRole("Admin"));
            await _roleManager.CreateAsync(new IdentityRole("Worker"));
            await _roleManager.CreateAsync(new IdentityRole("Manager"));
            
            IdentityUser usr = await _userManager.FindByEmailAsync(email);
            var res = await _userManager.AddToRolesAsync(usr, new[] {"Admin", "Worker", "Manager"});

            string token = JwtSecurityTokenResolve(newUser);
            return new AuthenticationResult
            {
                Success = true,
                Token = token
            };
        }

        private string JwtSecurityTokenResolve(IdentityUser identityUser, IEnumerable<string> roles = null)
        {
            var jwtSecurityTokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_jwtSettings.Secret);

            var identity = new ClaimsIdentity(new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, identityUser.Email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Email, identityUser.Email),
                new Claim("id", identityUser.Id)
            });
            if (roles != null)
            {
                foreach (var role in roles)
                {
                    identity.AddClaim(new Claim("role", role));
                }
            }

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = identity,
                Expires = DateTime.UtcNow.AddHours(2),
                SigningCredentials =
                    new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var securityToken = jwtSecurityTokenHandler.CreateToken(tokenDescriptor);
            return jwtSecurityTokenHandler.WriteToken(securityToken);
        }
    }
}