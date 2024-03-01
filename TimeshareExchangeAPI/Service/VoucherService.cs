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
        //GetVoucherByName
        public ResponseModel<Voucher> Getbyname(string name)
        {
            var feedbackEntity = _voucherrepository.GetSingle(x => x.Name.Equals(name));
            return new ResponseModel<Voucher>
            {
                Data = feedbackEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //Updatestatus
        public ResponseModel<Voucher> Updatesta(string id, Vouchersta voucher)
        {
            var Voucher = _voucherrepository.GetSingle(x => id.Equals(x.Id));
            if (Voucher == null)
            {
                return new ResponseModel<Voucher>
                {
                    MessageError = "Khong tim thay",
                    StatusCode = StatusCodes.Status404NotFound
                };
            }
            _mapper.Map(voucher, Voucher);
            Voucher.Id = id;
            _voucherrepository.Update(Voucher);
            return new ResponseModel<Voucher>
            {
                Data = Voucher,
                StatusCode = StatusCodes.Status200OK
            };
        }

    }
}
