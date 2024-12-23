﻿using System.ComponentModel.DataAnnotations;

namespace InstaFood.Shared.DTO
{
    public class LoginDTO
    {
        [Required]
        [EmailAddress(ErrorMessage = "Email in not valid")]
        public string Email { get; set; }=string.Empty;
        [Required]
        public string Password { get; set; }=string.Empty;
    }
}
