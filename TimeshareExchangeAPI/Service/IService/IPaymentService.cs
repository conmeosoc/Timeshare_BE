using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{

    public interface IPaymentService
    {
        public ResponseModel<List<PaymentModel>> GetAll();

        public ResponseModel<Payment> Createpayment(PaymentModel signUpModel);

        public ResponseModel<Payment> GetSingle(string id);

        public ResponseModel<List<PaymentModel>> GetByMemberID(string id);
    }
}

