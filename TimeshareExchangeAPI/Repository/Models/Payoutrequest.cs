using TimeshareExchangeAPI.Entities;

namespace TimeshareExchangeAPI.Repository.Models
{
    public class PayoutModel
    {

        public string Id { get; set; } = null!;
        public string? MemberId { get; set; }
        public string? PaypalId { get; set; }
        public DateTime? CreateAt { get; set; }
        public double? Amount { get; set; }
        public string? Status { get; set; }
    }
    public class PayoutrequestModel
    {

        public string? MemberId { get; set; }
        public string? PaypalId { get; set; }
        public double? Amount { get; set; }
        public string? Status { get; set; }
    }
    public class Payoutsta
    {
        public string? Status { get; set; }
    }
}
