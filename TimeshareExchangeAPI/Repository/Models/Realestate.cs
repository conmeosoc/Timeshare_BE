using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Repository.Models;

public partial class Realestate
{
    public string Id { get; set; } = null!;

    public string? Name { get; set; }

    public string? Location { get; set; }

    public string? Facility { get; set; }

    public string? Feedback { get; set; }

    public byte[]? Photo { get; set; }

    public string? Status { get; set; }

    public virtual ICollection<Booking> Bookings { get; set; } = new List<Booking>();

    public virtual ICollection<Timeshare> Timeshares { get; set; } = new List<Timeshare>();
}
