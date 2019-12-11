using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Contracts.V1.Responses
{
    public class UserResponse : BaseResponse
    {
        public string Email;
        public string UserName;
    }
}
