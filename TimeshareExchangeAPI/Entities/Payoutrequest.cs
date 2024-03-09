namespace TimeshareExchangeAPI.Entities
{
    public partial class Payoutrequest
    {
        public string Id { get; set; } = null!;

        public string? MemberId { get; set; }
        public string? PaypalId { get; set; }
        public DateTime? CreateAt { get; set; }
        public double? Amount { get; set; }
        public string? Status { get; set; }
        public virtual Account? Member { get; set; }
        public virtual ICollection<Payment> Payments { get; set; } = new List<Payment>();
    }
}
