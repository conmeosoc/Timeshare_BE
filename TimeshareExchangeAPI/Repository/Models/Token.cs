namespace TimeshareExchangeAPI.Repository.Models
{
    public class Token
    {
        public string Id { get; set; } = null!;

        public string? FullName { get; set; }

        public bool? Sex { get; set; }

        public string? Address { get; set; }

        public string? Phone { get; set; }

        public bool? Status { get; set; }
        public string AccessToken { get; set; } = string.Empty;
        public string TokenType { get; set; } = "jwt";
        public DateTime ExpiresIn { get; set; } = DateTime.MinValue;
    }
}
