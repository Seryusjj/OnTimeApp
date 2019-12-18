using System;
using System.Collections.Generic;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    public class CheckInResponse : BaseResponse
    {
        public string Info { get; set; }
        public DateTime? UtcDateTime { get; set; }

        /// <summary>
        /// If true location is assume else, wifi
        /// </summary>
        public bool Location { get; set; }
        
        public bool EndDay { get; set; }

        public CheckInResponse(string info, DateTime utcDateTime, bool location, bool endDay)
        {
            Info = info;
            UtcDateTime = utcDateTime;
            Success = true;
            Errors = new string[0];
            Location = location;
            EndDay = endDay;
        }
        
        public CheckInResponse(IEnumerable<string> errors)
        {
            Info = string.Empty;
            UtcDateTime = null;
            Success = false;
            Errors = new string[0];
            EndDay = false;
        }
    }
}