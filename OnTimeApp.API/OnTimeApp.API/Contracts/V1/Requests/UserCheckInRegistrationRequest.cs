using System;
using System.ComponentModel.DataAnnotations;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    public class UserCheckinRegistrationRequest
    {
        [Required]
        public string Info { get; set; }
        [Required]
        public DateTime UtcDateTime { get; set; }
        [Required]
        public bool Wifi { get; set; }
        [Required]
        public bool Location { get; set; }
    }
}