namespace TimeshareExchangeAPI.Repository.Models
{
    public class TimeshareModel
    {
        public string Id { get; set; } = null!;

        public string? RealestateId { get; set; }

        public string? MemberId { get; set; }
        public double Price { get; set; }

        public DateTimeOffset? StartDay { get; set; } 
        public DateTimeOffset? CreatedDay { get; set; }

        public DateTimeOffset? EndDay { get; set; }

        public string? Status { get; set; }

    }

    public class TimeshareRequestModel
    {
        public string? RealestateId { get; set; }

        public string? MemberId { get; set; }
        public double Price { get; set; }

        public DateTimeOffset? StartDay { get; set; }

        public DateTimeOffset? EndDay { get; set; }

        public string? Status { get; set; }
    }
    public class Timesharesta
    {
        public string? Status { get; set; }
    }
}
