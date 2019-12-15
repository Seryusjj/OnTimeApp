using System;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    public class CheckInResponse : BaseResponse
    {
        public string Info { get; set; }
        public DateTime UtcDateTime { get; set; }
    }
}