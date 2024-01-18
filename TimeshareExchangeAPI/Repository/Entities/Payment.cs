using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Repository.Models;

public partial class Payment
{
    public string PayId { get; set; } = null!;

    public string? MemberId { get; set; }

    public DateTime? Date { get; set; }

    public int? Money { get; set; }

    public string? BookingId { get; set; }

    public virtual Account? Member { get; set; }
}
