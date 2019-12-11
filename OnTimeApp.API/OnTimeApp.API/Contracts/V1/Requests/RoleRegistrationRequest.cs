using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    /// <summary>
    /// Request to create a new Role
    /// </summary>
    public class RoleRegistrationRequest
    {
        /// <summary>
        /// The name of the new role
        /// </summary>
        [Required]
        public string RoleName { get; set; }
    }
}
