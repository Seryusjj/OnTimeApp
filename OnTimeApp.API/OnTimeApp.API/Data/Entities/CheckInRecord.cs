using System;
using Microsoft.AspNetCore.Identity;

namespace OnTimeApp.API.Entities
{
    public class CheckInRecord
    {
        public string Id { get; set; }
        public string Info { get; set; }
        public DateTime UtcDateTime { get; set; }
        public IdentityUser User { get; set; }
        public bool Location { get; set; }
        public bool EndDay { get; set; }

        public CheckInRecord() 
        {
            Id = Guid.NewGuid().ToString();
        }
        
    }
}