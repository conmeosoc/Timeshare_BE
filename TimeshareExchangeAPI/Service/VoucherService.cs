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
        private readonly IMapper _mapper;

        public VoucherService(IGenericRepository<Voucher> repositoryBase, IMapper mapper)
        {
            _voucherrepository = repositoryBase;
            _mapper = mapper;

        }
        public ResponseModel<Voucher> CreateVoucher(Voucher signUpModel)
        {
            var userEntity = _mapper.Map<Voucher>(signUpModel);

            userEntity.Id = Guid.NewGuid().ToString();
            _voucherrepository.Create(userEntity);

            return new ResponseModel<Voucher>
            {
                Data = userEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        public ResponseModel<List<Voucher>> GetAll()
        {
            var entities = _voucherrepository.GetAll().ToList();
            var response = _mapper.Map<List<Voucher>>(entities.ToList());
            return new ResponseModel<List<Voucher>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //GetID
        public ResponseModel<Voucher> GetSingle(string id)
        {
            var feedbackEntity = _voucherrepository.GetSingle(x => x.Id.Equals(id));
            var responsefeedbackModel = _mapper.Map<Voucher>(feedbackEntity);
            return new ResponseModel<Voucher>
            {
                Data = responsefeedbackModel,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
      
    }
}
