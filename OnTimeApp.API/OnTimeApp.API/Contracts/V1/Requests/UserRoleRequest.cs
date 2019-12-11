using System.ComponentModel.DataAnnotations;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    public class UserRoleRequest
    {
        [Required]
        [EmailAddress]
        public string UserEmail { get; set; }
    }
}