using System;
using System.ComponentModel.DataAnnotations;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    public class CheckInResgistrationRequest
    {
        [Required] public string UserEmail { get; set; }
        
        [Required] public string Info { get; set; }

        [Required] public bool Location { get; set; }

        public DateTime? UtcDateTime { get; set; }

        [Required]
        public bool EndDay { get; set; }
    }
}