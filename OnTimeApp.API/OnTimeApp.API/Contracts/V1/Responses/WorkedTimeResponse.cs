using System;
using System.Collections.Generic;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    public class WorkedTimeResponse : BaseResponse
    {
        public int Hours { get; set; }
        public int Minutes { get; set; }

        public WorkedTimeResponse(int hours, int minutes)
        {
            Hours = hours;
            Minutes = minutes;
            Success = true;
            Errors = new string[] { };
        }
        
        public WorkedTimeResponse(IEnumerable<string> errors)
        {
            Success = false;
            Errors = errors;
        }
    }
}