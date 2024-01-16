﻿using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Repository.Models;

public partial class Booking
{
    public string Id { get; set; } = null!;

    public string? TimeshareId { get; set; }

    public DateTime? StartDay { get; set; }

    public DateTime? EndDay { get; set; }

    public string? MemberId { get; set; }

    public decimal? Deposit { get; set; }

    public int? Amount { get; set; }

    public int? Adult { get; set; }

    public int? Children { get; set; }

    public int? Room { get; set; }

    public virtual Account? Member { get; set; }

    public virtual Timeshare? Timeshare { get; set; }
}
