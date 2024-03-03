using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{

    public interface IPaymentService
    {
        public ResponseModel<List<PaymentModel>> GetAll();

        public ResponseModel<PaymentModel> GetSingle(string id);

        public ResponseModel<List<PaymentModel>> GetByMemberID(string id);
    }
}

