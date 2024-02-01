namespace TimeshareExchangeAPI.Globals
{
    public class ConfigAppSetting
    {
        public AdminAccount AdminAccount { get; set; } = new AdminAccount();
    }
    public class AdminAccount
    {
        public string? Username { get; set; } = string.Empty;
        public string? Password { get; set; } = string.Empty;
    }
}
