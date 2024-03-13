using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Entities;

public partial class Voucher
{
    public string? Id { get; set; }

    public string? Name { get; set; }

    public int? Amount { get; set; }

    public string? Type { get; set; }

    public DateTimeOffset? EndDay { get; set; }

    public DateTimeOffset? StartDay { get; set; }

    public Boolean? Status { get; set; }
}
