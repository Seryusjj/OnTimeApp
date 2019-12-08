using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace OnTimeApp.API.Entities
{
    public class User
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
        public IEnumerable<Role> Roles { get; set; }
        
        public IEnumerable<CheckInRecord> CheckInRecords { get; set; }
    }
}