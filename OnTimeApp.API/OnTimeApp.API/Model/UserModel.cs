using System.ComponentModel.DataAnnotations;

namespace OnTimeApp.API.Model
{
    public class UserModel
    {
        [Required(ErrorMessage = "Have to supply an email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Have to supply a password")]
        public string Password { get; set; }
        

    }
}