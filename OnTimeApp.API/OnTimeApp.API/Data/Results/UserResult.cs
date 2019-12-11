using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Data.Results
{
    public class UserResult : BaseResult
    {
        public string Email { get; set; }
        public string UserName { get; set; }
    }
}
