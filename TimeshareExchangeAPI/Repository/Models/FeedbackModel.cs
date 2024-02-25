using TimeshareExchangeAPI.Entities;

namespace TimeshareExchangeAPI.Repository.Models
{
    public class FeedbackModel

    {
        public string Id { get; set; } = null!;
        public string? RealestateID { get; set; }
        public string? MemberId { get; set; }

        public string? Text { get; set; }

        public int? Rate { get; set; }

       
    }
}
