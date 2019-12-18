using System;

namespace OnTimeApp.API.Data.Results
{
    public class CheckInResult : BaseResult
    {
        public string EmailOwner { get; set; }
        public string Info { get; set; }
        public DateTime UtcDateTime { get; set; }
        public bool Location { get; set; }
        public string Id { get; set; }

        public bool EndDay { get; set; }
    }
}