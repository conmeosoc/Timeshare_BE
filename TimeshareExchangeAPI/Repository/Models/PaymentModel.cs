using TimeshareExchangeAPI.Entities;

namespace TimeshareExchangeAPI.Repository.Models
{
    public class PaymentModel
    {
        public string PayId { get; set; } = null!;
        public string? PayoutID { get; set; }
        public string? Type { get; set; }

        public string? MemberId { get; set; }
        public string? Title { get; set; }

        public DateTime? Date { get; set; }

        public int? Money { get; set; }

        public string? BookingId { get; set; }

        public string? Status { get; set; }



    }

    public class PaymentRequestModel
    {


        public string? MemberId { get; set; }

        public string? Title { get; set; }

        public string? Type { get; set; }

        public int? Money { get; set; }

        public string? BookingId { get; set; }

        public string? Status { get; set; }
    }

    public class PaymentSta
    {
        public string? Status { get; set; }
    }
}