using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    public class UserRoleAdditionRequest
    {
        [Required]
        public string Role { get; set; }
        
        [Required]
        [EmailAddress]
        public string UserEmail { get; set; }
    }
}
