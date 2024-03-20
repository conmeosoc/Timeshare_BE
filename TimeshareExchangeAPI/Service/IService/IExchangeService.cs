using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IExchangeService
    {
        public ResponseModel<Exchange> CreateExchange(ExchangeRequestModel signUpModel);


        public ResponseModel<List<ExchangeModel>> GetAll();



        public ResponseModel<ExchangeModel> GetSingle(string id);



        public ResponseModel<List<ExchangeModel>> Getbymemid(string id);
        public ResponseModel<Exchange> Updatesta(string id, Exchangesta voucher);


    }
}
