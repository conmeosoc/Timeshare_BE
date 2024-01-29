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
        //public void SetSuccess(T result = default(T))
        //{
        //    Success = true;
        //    Result = result;
        //    ResponseCode = ErrorCode.SUCCESS;
        //    ResponseMessage = ErrorCode.GetErrorMessage(ErrorCode.SUCCESS);
        //    LastUpdateTime = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
        //}
        //public void SetError(int errCode = ErrorCode.UNKNOW_ERROR, T result = default(T), string ex_mess = "")
        //{
        //    Success = false;
        //    Result = result;
        //    ResponseCode = errCode;
        //    ResponseMessage = ErrorCode.GetErrorMessage(errCode, ex_mess);
        //    LastUpdateTime = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss");
        //}
    }
}
