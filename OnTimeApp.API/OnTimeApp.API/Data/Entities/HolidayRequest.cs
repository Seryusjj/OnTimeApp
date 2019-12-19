using System;

namespace OnTimeApp.API.Entities
{
    public class HolidayRequest
    {
        public string Id { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public bool Approved { get; set; }
        public AppUser User { get; set; }
        public AppUser Approver { get; set; }

        public HolidayRequest() 
        {
            Id = Guid.NewGuid().ToString();
        }
    }
}