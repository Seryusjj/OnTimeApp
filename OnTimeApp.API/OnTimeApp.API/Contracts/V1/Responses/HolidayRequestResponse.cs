using System;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    public class HolidayRequestResponse : BaseResponse
    {
        public string Id { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public bool Approved { get; set; }
        public string ApproverEmail { get; set; }
        public string UserEmail { get; set; }
        public bool Deleted { get; set; }
    }
}