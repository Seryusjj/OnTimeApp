﻿using System;
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
        /// Unsuccucessful response
        /// </summary>
        /// <param name="errors">The set of errors</param>
        public AuthResponse(IEnumerable<string> errors)
        {
            Errors = errors ?? new string[0];
            Token = null;
            Success = false;
        }

        /// <summary>
        /// Succesfull response
        /// </summary>
        /// <param name="token">The assigned token</param>
        public AuthResponse(string token)
        {
            Errors = new string[0];
            Token = token;
            Success = true;
        }

    }
}
