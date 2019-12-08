using System.ComponentModel.DataAnnotations;

namespace OnTimeApp.API.Model
{
    public class SingUpModel
    {
        [Required]
        public string Email { get; set; }
        
        [Required]
        public string Password { get; set; }
        
        [Required]
        [Compare("Password")]
        public string RepeatPassword { get; set; }
    }
}