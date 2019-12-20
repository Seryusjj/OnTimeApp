using System;
using System.ComponentModel.DataAnnotations;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    public class HolidayRequestRegistration
    {
        [Required] public DateTime From { get; set; }
        [Required] public DateTime To { get; set; }
        [Required] public string UserEmail { get; set; }
    }
}