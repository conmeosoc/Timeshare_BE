﻿using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Entities;

public partial class Timeshare
{
    public string Id { get; set; } = null!;

    public string? RealestateId { get; set; }

    public string? MemberId { get; set; }
    public DateTimeOffset? CreatedDay { get; set; }
    public DateTimeOffset? StartDay { get; set; }

    public DateTimeOffset? EndDay { get; set; }
    public double Price { get; set; }
    public string? Status { get; set; }

    public virtual ICollection<Booking> Bookings { get; set; } = new List<Booking>();

    public virtual Account? Member { get; set; }

    public virtual Realestate? Realestate { get; set; }
}
