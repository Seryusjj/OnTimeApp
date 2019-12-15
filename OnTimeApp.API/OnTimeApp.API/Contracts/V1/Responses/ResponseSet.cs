using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    public class ResponseSet<T> : BaseResponse
    {
        public IEnumerable<T> Response { get; set; }

        public ResponseSet(IEnumerable<string> errors)
        {
            Errors = errors ?? new string[0];
            Response = new T[0];
        }

        public ResponseSet(IEnumerable<T> response)
        {
            Errors = new string[0];
            Response = response ?? new T[0];
            Success = true;
        }
    }
}
