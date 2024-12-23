﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InstaFood.DataAccess.Models
{
    public class OrderDetail
    {
        [Required]
        public string? OrderId { get; set; }
        public virtual Order? Order { get; set; }
        [Required]
        public int ProductId { get; set; }
        public virtual Product? Product { get; set; }
        [Required]
        public int Quantity { get; set; }
    }
}
