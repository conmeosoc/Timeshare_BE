namespace TimeshareExchangeAPI.Repository.Models
{
    public class AccountModel
    {
        public string Id { get; set; } = null!;

        public string? FullName { get; set; }

        public bool? Sex { get; set; }
        public bool? IsPremium { get; set; }


        public string? Address { get; set; }

        public string? Phone { get; set; }

        public bool? Status { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }

    }
    public class AccountRequestModel
    {

        public string? FullName { get; set; }

        public bool? Sex { get; set; }

        public string? Address { get; set; }

        public string? Phone { get; set; }

        public bool? Status { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }

    }
    public class Accountsta
    {
        public bool? status { get; set; }
    }
    
}
