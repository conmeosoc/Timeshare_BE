namespace TimeshareExchangeAPI.Repository.Models
{
    public class Token
    {
        public string Id { get; set; } = null!;
        public bool? Status { get; set; }
        public bool isAdmin { get; set; } = false;
        public string AccessToken { get; set; } = string.Empty;
        public string TokenType { get; set; } = "jwt";
        public DateTime ExpiresIn { get; set; } = DateTime.MinValue;
    }
}
