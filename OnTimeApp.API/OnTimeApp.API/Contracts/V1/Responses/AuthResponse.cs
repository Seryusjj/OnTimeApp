using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    /// <summary>
    /// Response of authentication
    /// </summary>
    public class AuthResponse : BaseResponse
    {
        /// <summary>
        /// The token assigned to the user
        /// </summary>
        public string Token { get; set; }

        /// <summary>
        /// Unscucessful response
        /// </summary>
        /// <param name="errors">The set of errors</param>
        public AuthResponse(IEnumerable<string> errors)
        {
            Errors = errors;
            Token = null;
            Success = false;
        }

        /// <summary>
        /// Succesfull response
        /// </summary>
        /// <param name="token">The assigned token</param>
        public AuthResponse(string token)
        {
            Errors = null;
            Token = token;
            Success = true;
        }

    }
}
