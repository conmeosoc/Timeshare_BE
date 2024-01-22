using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Entities;

public partial class Voucher
{
    public string? Id { get; set; }

    public string? Name { get; set; }

    public int? Amount { get; set; }

    public string? Type { get; set; }

    public DateTime? EndDay { get; set; }

    public DateTime? StartDay { get; set; }

    public DateTime? Status { get; set; }
}
