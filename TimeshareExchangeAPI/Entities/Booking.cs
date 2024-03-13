using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Entities;

public partial class Booking
{
    public string Id { get; set; } = null!;
    public DateTimeOffset? CreatedDay { get; set; }
    public string? TimeshareId { get; set; }

    public DateTimeOffset? StartDay { get; set; }

    public DateTimeOffset? EndDay { get; set; }

    public string? MemberId { get; set; }


    public int? Amount { get; set; }

    public int? Adult { get; set; }

    public int? Children { get; set; }

    public int? Room { get; set; }
    public string? Status { get; set; }
    public string? Phone { get; set; }
    public string? FullName { get; set; }
    public string? PaymentID { get; set; }

    public virtual Account? Member { get; set; }

    public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();

    public virtual Timeshare? Timeshare { get; set; }
}
