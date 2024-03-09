using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IPayoutService
    {
        public ResponseModel<List<PayoutModel>> GetAll();

        public ResponseModel<Payoutrequest> GetSingle(string id);
        public ResponseModel<Payoutrequest> CreatePayment(PayoutrequestModel payment);


        public ResponseModel<List<PayoutModel>> GetByMemberID(string id);

        public ResponseModel UpdateSta(String id, Payoutsta status);
    }
}
