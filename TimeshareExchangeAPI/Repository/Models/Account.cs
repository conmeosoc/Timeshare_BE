﻿namespace TimeshareExchangeAPI.Repository.Models
{
    public class AccountModel
    {
        public string Id { get; set; } = null!;

        public string? FullName { get; set; }

        public bool? Sex { get; set; }

        public string? Address { get; set; }

        public int? Phone { get; set; }

        public bool? Status { get; set; }

    }
}
