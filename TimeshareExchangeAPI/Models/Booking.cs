using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Models;

public partial class Booking
{
    public string Id { get; set; } = null!;

    public string? RealestateId { get; set; }

    public DateTime? StartDay { get; set; }

    public DateTime? EndDay { get; set; }

    public string? MemberId { get; set; }

    public decimal? Deposit { get; set; }

    public virtual Realestate? Realestate { get; set; }
}
