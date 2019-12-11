using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Data.Results
{
    public class AuthenticationResult : BaseResult
    {
        public string Token { get; set; }
    }
}
