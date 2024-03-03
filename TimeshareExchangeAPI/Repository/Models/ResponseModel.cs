namespace TimeshareExchangeAPI.Repository.Models
{
    public class ResponseModel
    {
        public string? MessageError { get; set; }
        public int StatusCode { get; set; }
    }
    public class ResponseModel<T> : ResponseModel
    {
        public T Data { get; set; }
        
    }
}
