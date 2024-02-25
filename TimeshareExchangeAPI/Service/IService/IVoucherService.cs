using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IVoucherService
    {
        public ResponseModel<List<Voucher>> GetAll();
        public ResponseModel<Voucher> CreateVoucher(Voucher signUpModel);
        public ResponseModel<Voucher> Updatesta(string id, Vouchersta sta);

        public ResponseModel<Voucher> GetSingle(string id);
    }
}
