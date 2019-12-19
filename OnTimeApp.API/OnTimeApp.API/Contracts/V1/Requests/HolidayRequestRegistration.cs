using System;
using System.ComponentModel.DataAnnotations;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    public class HolidayRequestRegistration
    {
        [Required] private DateTime From { get; set; }
        [Required] private DateTime To { get; set; }
        [Required] private string UserEmail { get; set; }
    }
}