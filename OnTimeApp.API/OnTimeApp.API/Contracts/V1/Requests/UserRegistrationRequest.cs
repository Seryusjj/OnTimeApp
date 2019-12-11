using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    /// <summary>
    /// Request to create a new user
    /// </summary>
    public class UserRegistrationRequest
    {
        /// <summary>
        /// The email of the user
        /// </summary>
        [Required]
        [EmailAddress]
        public string Email { get; set; }
        
        /// <summary>
        /// The password of the user
        /// </summary>
        [Required]
        public string Password { get; set; }
    }
}
