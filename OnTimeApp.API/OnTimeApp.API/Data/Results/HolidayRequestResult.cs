using System;

namespace OnTimeApp.API.Data.Results
{
    public class HolidayRequestResult
    {
        public string Id { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public bool Approved { get; set; }
        public string UserId { get; set; }
        public string ApproverId { get; set; }
    }
}