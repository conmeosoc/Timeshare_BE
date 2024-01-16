using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Repository.Models;

public partial class Feedback
{
    public string? PostId { get; set; }

    public string? MemberId { get; set; }

    public string Id { get; set; } = null!;

    public string? Text { get; set; }

    public int? Rate { get; set; }

    public virtual Account? Member { get; set; }

    public virtual Post? Post { get; set; }
}
