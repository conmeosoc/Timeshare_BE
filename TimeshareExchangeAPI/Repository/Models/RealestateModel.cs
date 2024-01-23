namespace TimeshareExchangeAPI.Repository.Models
{
    public class RealestateModel
    {
        public string Id { get; set; } = null!;

        public string? Name { get; set; }

        public string? Location { get; set; }

        public string? Facility { get; set; }

        public string? Feedback { get; set; }

        public byte[]? Photo { get; set; }

        public string? Status { get; set; }
    }
}
