using System;
using System.Collections.Generic;

namespace TimeshareExchangeAPI.Repository.Models;

public partial class Post
{
    public string? RealestateId { get; set; }

    public decimal? Price { get; set; }

    public virtual Realestate? Realestate { get; set; }
}
