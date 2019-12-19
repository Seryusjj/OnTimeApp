using Microsoft.AspNetCore.Identity;

namespace OnTimeApp.API.Entities
{
    public class AppUser : IdentityUser
    {
        public AppUser Manager { get; set; }
    }
}