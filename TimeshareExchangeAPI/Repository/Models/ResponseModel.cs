namespace TimeshareExchangeAPI.Repository.Models
{
    public class ResponseModel
    {
        public string? MessageError { get; set; }
        public int StatusCode { get; set; }
        public object? Data { get; set; }
    }
}
