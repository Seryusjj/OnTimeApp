using System.ComponentModel.DataAnnotations;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    public class UserAddSubordinateRequest
    {
        [Required] [EmailAddress] public string UserEmail { get; set; }
        [Required] [EmailAddress] public string SubordinateEmail { get; set; }
    }
}