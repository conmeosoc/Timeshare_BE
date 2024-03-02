using TimeshareExchangeAPI.Entities;

namespace TimeshareExchangeAPI.Repository.Models
{
    public class ExchangeModel
    {
        public string ExchangeId { get; set; }
        public string? MemberId1 { get; set; }
        public string? MemberId2 { get; set; }

        public string? TimeshareId1 { get; set; }
        public string? TimeshareId2 { get; set; }

        public DateTime? StartDay { get; set; }

        public DateTime? EndDay { get; set; }

        public DateTime? ExchangeDay { get; set; }
        public string? Status { get; set; }

        
    }
    public class ExchangeRequestModel
    {
        public string? MemberId1 { get; set; }
        public string? MemberId2 { get; set; }

        public string? TimeshareId1 { get; set; }
        public string? TimeshareId2 { get; set; }

        public DateTime? StartDay { get; set; }

        public DateTime? EndDay { get; set; }

        public string? Status { get; set; }

      
    }

    public class Exchangesta
    {
        public string? Status { get; set; }

    }
}
