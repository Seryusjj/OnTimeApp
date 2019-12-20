using System.ComponentModel.DataAnnotations;

namespace OnTimeApp.API.Contracts.V1.Requests
{
    public class HolidayApproveRequest
    {
        [Required] public string RequestId { get; set; }
    }
}