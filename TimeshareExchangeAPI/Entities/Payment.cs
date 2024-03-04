using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Entities;

public partial class Payment
{
    public string PayId { get; set; } = null!;

    public DateTime? CreatedDay { get; set; }

    public string? MemberId { get; set; }

    public DateTime? Date { get; set; }

    public int? Money { get; set; }

    public string? BookingId { get; set; }

    public string? Status { get; set; } 

    public virtual Booking? Booking { get; set; }

    public virtual Account? Member { get; set; }
}
