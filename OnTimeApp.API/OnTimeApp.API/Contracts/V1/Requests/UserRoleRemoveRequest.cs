using System.ComponentModel.DataAnnotations;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    public class UserRoleRemoveRequest
    {
        [Required]
        public string Role { get; set; }
        
        [Required]
        [EmailAddress]
        public string UserEmail { get; set; }
    }
}