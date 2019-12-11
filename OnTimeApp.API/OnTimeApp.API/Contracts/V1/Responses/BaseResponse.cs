using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    /// <summary>
    /// Common object for all responses
    /// </summary>
    public class BaseResponse
    {
        /// <summary>
        /// Set of errors that can potentially occur
        /// </summary>
        public IEnumerable<string> Errors { get; set; }
        
        /// <summary>
        /// If the request was succesfull or not
        /// </summary>
        public bool Success { get; set; }
    }
}
