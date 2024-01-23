namespace TimeshareExchangeAPI.Repository.Models
{
    public class TimeshareModel
    {
        public string Id { get; set; } = null!;

        public string? RealestateId { get; set; }

        public string? MemberId { get; set; }

        public DateTime? StartDay { get; set; }

        public DateTime? EndDay { get; set; }

        public string? Status { get; set; }

    }
}
