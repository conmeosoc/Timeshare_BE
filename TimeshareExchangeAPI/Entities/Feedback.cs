using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Entities;

public partial class Feedback
{

    public string? MemberId { get; set; }

    public string Id { get; set; } = null!;
    public string RealestateId { get; set; }    
    public string? Text { get; set; }

    public int? Rate { get; set; }

    public virtual Account? Member { get; set; }

    public virtual ICollection<Realestate> Realestates { get; set; } = new List<Realestate>();
}
