﻿using TimeshareExchangeAPI.Entities;

namespace TimeshareExchangeAPI.Repository.Models
{
    public class ExchangeModel
    {
        public string? MemberId { get; set; }

        public string? TimeshareId { get; set; }

        public DateTime? StartDay { get; set; }

        public DateTime? EndDay { get; set; }

        public DateTime? ExchangeDay { get; set; }

        public virtual Account? Member { get; set; }

        public virtual Timeshare? Timeshare { get; set; }
    }
}