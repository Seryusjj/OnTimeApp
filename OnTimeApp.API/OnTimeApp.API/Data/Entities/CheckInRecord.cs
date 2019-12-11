using System;

namespace OnTimeApp.API.Entities
{
    public class CheckInRecord
    {
        public string Id { get; set; }
        public DateTime checkTime { get; set; }

        public CheckInRecord() 
        {
            Id = Guid.NewGuid().ToString();
        }
        
    }
}