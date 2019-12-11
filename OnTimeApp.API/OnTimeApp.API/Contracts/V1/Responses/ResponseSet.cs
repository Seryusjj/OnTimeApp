using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    public class ResponseSet<T> : BaseResponse
    {
        public IEnumerable<T> Response { get; set; }
    }
}
