using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IPaymentService
    {

            public ResponseModel CreateUserPaymentMethod(RequestUserPaymentModel entity);
            public ResponseModel GetSingle(string id);
            public ResponseModel UpdatePaymentMenthod(string id, RequestUserPaymentModel requestUserPaymentModel);
            public ResponseModel DeletePaymentMenthod(string id);

            public ResponseModel GetAllPaymentMethod();


      
    }
}
