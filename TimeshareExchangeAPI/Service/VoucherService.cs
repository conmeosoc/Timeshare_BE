using AutoMapper;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Service
{
    public class VoucherService : IVoucherService
    {
        private readonly IGenericRepository<Voucher> _voucherrepository;

        public VoucherService(IGenericRepository<Voucher> repositoryBase)
        {
            _voucherrepository = repositoryBase;

        }
        public ResponseModel<Voucher> CreateVoucher(Voucher signUpModel)
        {

            signUpModel.Id = Guid.NewGuid().ToString();
            _voucherrepository.Create(signUpModel);

            return new ResponseModel<Voucher>
            {
                Data = signUpModel,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        public ResponseModel<List<Voucher>> GetAll()
        {
            var entities = _voucherrepository.GetAll().ToList();
            return new ResponseModel<List<Voucher>>
            {
                Data = entities,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //GetID
        public ResponseModel<Voucher> GetSingle(string id)
        {
            var feedbackEntity = _voucherrepository.GetSingle(x => x.Id.Equals(id));
            return new ResponseModel<Voucher>
            {
                Data = feedbackEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
      
    }
}
