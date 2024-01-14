﻿using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Models;

public partial class Account
{
    public string Id { get; set; } = null!;

    public string? FullName { get; set; }

    public bool? Sex { get; set; }

    public string? Address { get; set; }

    public int? Phone { get; set; }

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual ICollection<Timeshare> Timeshares { get; set; } = new List<Timeshare>();
}
