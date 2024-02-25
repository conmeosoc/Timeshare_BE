namespace TimeshareExchangeAPI.Repository.Models
{
    public class RealestateModel
    {
        public string Id { get; set; } = null!;

        public string? Name { get; set; }

        public string? Location { get; set; }

        public string? Facility { get; set; }

        public string? FeedbackId { get; set; }
        public string? Description { get; set; }

        public string? Photo { get; set; }
        public double? Price { get; set; }
        public string? Status { get; set; }
    }
    public class RealestateRequestModel
    {
        public string? Name { get; set; }

        public string? Location { get; set; }
        public string? Description { get; set; }

        public string? Facility { get; set; }

        public double? Price { get; set; }
        public IFormFile? imageFiles { get; set; }

    }

}
