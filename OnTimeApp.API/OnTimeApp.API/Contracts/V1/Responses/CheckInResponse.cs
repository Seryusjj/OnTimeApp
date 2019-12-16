using System;
using System.Collections.Generic;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    public class CheckInResponse : BaseResponse
    {
        public string Info { get; set; }
        public DateTime? UtcDateTime { get; set; }

        public CheckInResponse(string info, DateTime utcDateTime)
        {
            Info = info;
            UtcDateTime = utcDateTime;
            Success = true;
            Errors = new string[0];
        }
        
        public CheckInResponse(IEnumerable<string> errors)
        {
            Info = string.Empty;
            UtcDateTime = null;
            Success = false;
            Errors = new string[0];
        }
    }
}