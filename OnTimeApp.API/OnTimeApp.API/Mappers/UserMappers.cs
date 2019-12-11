using Microsoft.AspNetCore.Identity;
using OnTimeApp.API.Contracts.V1.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Mappers
{
    public static class UserMappers
    {
        public static UserModel MapToUserModel(IdentityUser entity) 
        {
            var res = new UserModel();
            res.Email = entity.Email;
            res.UserName = entity.UserName;
            return res;
        }
    }
}
