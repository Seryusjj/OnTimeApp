using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OnTimeApp.API.Data.Results
{
    public class ResultSet<T> : BaseResult where T : BaseResult
    {
        public IEnumerable<T> Results { get; set; }
    }
}
