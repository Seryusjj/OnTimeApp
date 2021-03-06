﻿using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.IdentityModel.Tokens;
using OnTimeApp.API.Data.Results;
using OnTimeApp.API.Entities;
using OnTimeApp.API.Options;

namespace OnTimeApp.API.Services
{
    public class IdentityService : IIdentitySevice
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly JwtSettings _jwtSettings;

        public IdentityService(UserManager<AppUser> userManager, JwtSettings jwtSettings)
        {
            _userManager = userManager;
            _jwtSettings = jwtSettings;            
        }

        public async Task<AuthenticationResult> LoginAsync(string email, string password)
        {
            AppUser existingUser = await _userManager.FindByEmailAsync(email);
            if (existingUser == null)
            {
                return new AuthenticationResult
                {
                    Errors = new[] {"User/Password combination is wrong"}
                };
            }

            var userHasValidPassword = await _userManager.CheckPasswordAsync(existingUser, password);
            if (!userHasValidPassword)
            {
                return new AuthenticationResult
                {
                    Errors = new[] {"User/Password combination is wrong"}
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

            var newUser = new AppUser
            {
                Email = email,
                UserName = email,
                Manager = null
            };

            IdentityResult createdUser = await _userManager.CreateAsync(newUser, password);
            if (!createdUser.Succeeded)
            {
                return new AuthenticationResult
                {
                    Errors = createdUser.Errors.Select(x => x.Description)
                };
            }           
            
            return new AuthenticationResult
            {
                Success = createdUser.Succeeded
            };
        }

        private string JwtSecurityTokenResolve(AppUser user, IEnumerable<string> roles = null)
        {
            var jwtSecurityTokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_jwtSettings.Secret);

            var identity = new ClaimsIdentity(new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.Email),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Email, user.Email),
                new Claim("id", user.Id)
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