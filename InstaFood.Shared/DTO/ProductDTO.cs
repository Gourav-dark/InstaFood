﻿using System.ComponentModel.DataAnnotations;

namespace InstaFood.Shared.DTO
{
    public class ProductDTO
    {
        [Required]
        public string? ProductName { get; set; }
        public string? ProductDescription { get; set; }
        [Required]
        public float UnitPrice { get; set; }
        [Required]
        public string? ImageUrl { get; set; }
        [Required]
        public bool NonVeg {  get; set; }=false;
    }
}
