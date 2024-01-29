namespace TimeshareExchangeAPI.Repository.Models
{
    public class ResponseTokenModel
    {
        public string Token { get; set; }
        public string RefreshToken { get; set; }
        public AccountModel ResponseUserModel { get; set; }
    }
}
