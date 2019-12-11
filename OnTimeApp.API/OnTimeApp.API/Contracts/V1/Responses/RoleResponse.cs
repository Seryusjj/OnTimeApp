using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    public class RoleResponse : BaseResponse
    {
        public string RoleName { get; set; }

        /// <summary>
        /// Unsuccucessful response
        /// </summary>
        /// <param name="errors">The set of errors</param>
        public RoleResponse(IEnumerable<string> errors)
        {
            Errors = errors;
            RoleName = null;
            Success = false;
        }

        /// <summary>
        /// Succesfull response
        /// </summary>
        /// <param name="roleName">The role name</param>
        public RoleResponse(string roleName)
        {
            Errors = null;
            RoleName = roleName;
            Success = true;
        }
    }
}
