using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace TyoajanlaskentaSovellus.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [Display(Name = "Sähköposti")]
        public string Email { get; set; }
    }

    public class ExternalLoginListViewModel
    {
        public string ReturnUrl { get; set; }
    }

    public class SendCodeViewModel
    {
        public string SelectedProvider { get; set; }
        public ICollection<System.Web.Mvc.SelectListItem> Providers { get; set; }
        public string ReturnUrl { get; set; }
        public bool RememberMe { get; set; }
    }

    public class VerifyCodeViewModel
    {
        [Required]
        public string Provider { get; set; }

        [Required]
        [Display(Name = "Code")]
        public string Code { get; set; }
        public string ReturnUrl { get; set; }

        [Display(Name = "Muista tämä selain?")]
        public bool RememberBrowser { get; set; }

        public bool RememberMe { get; set; }
    }

    public class ForgotViewModel
    {
        [Required]
        [Display(Name = "Sähköposti")]
        public string Email { get; set; }
    }

    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Sähköposti")]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Salasana")]
        public string Password { get; set; }

        [Display(Name = "Muista minut?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Sähköposti")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "Salasanan {0} pitää olla ainakin {2} tavua pitkä.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Salasana")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Vahvista salasana")]
        [Compare("Password", ErrorMessage = "Antamasi salasanat ei täsmää!")]
        public string ConfirmPassword { get; set; }
    }

    public class ResetPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Sähköposti")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "Salasanan {0} pitää olla ainakin {2} tavua pitkä.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Salasana")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Vahvista salasana")]
        [Compare("Salasana", ErrorMessage = "Antamasi salasanat ei täsmää.")]
        public string ConfirmPassword { get; set; }

        public string Code { get; set; }
    }

    public class ForgotPasswordViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "Sähköposti")]
        public string Email { get; set; }
    }
}
