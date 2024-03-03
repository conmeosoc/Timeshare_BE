using AutoMapper;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Service
{
    public class ExchangeService : IExchangeService
    {
        private readonly IGenericRepository<Exchange> _exchangerepository;
        private readonly IMapper _mapper;

        public ExchangeService(IGenericRepository<Exchange> repositoryBase, IMapper mapper)
        {
            _exchangerepository = repositoryBase;
            _mapper = mapper;

        }

        public ResponseModel<Exchange> CreateExchange(ExchangeRequestModel signUpModel)
        {
            var userEntity = _mapper.Map<Exchange>(signUpModel);

            userEntity.ExchangeId = Guid.NewGuid().ToString();
            userEntity.ExchangeDay = DateTime.Now;
            _exchangerepository.Create(userEntity);

            return new ResponseModel<Exchange>
            {
                Data = userEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        public ResponseModel<List<ExchangeModel>> GetAll()
        {
            var entities = _exchangerepository.GetAll().ToList();
            var response = _mapper.Map<List<ExchangeModel>>(entities.ToList());
            return new ResponseModel<List<ExchangeModel>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //GetID
        public ResponseModel<ExchangeModel> GetSingle(string id)
        {
            var feedbackEntity = _exchangerepository.GetSingle(x => x.ExchangeId.Equals(id));
            var responsefeedbackModel = _mapper.Map<ExchangeModel>(feedbackEntity);
                return new ResponseModel<ExchangeModel>
            {
                Data = responsefeedbackModel,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //GetexchangebymemberID
        public ResponseModel<ExchangeModel> Getbymemid(string id)
        {
            var feedbackEntity = _exchangerepository.GetSingle(x => x.MemberId1.Equals(id)||x.MemberId2.Equals(id));
            var responsefeedbackModel = _mapper.Map<ExchangeModel>(feedbackEntity);
            return new ResponseModel<ExchangeModel>
            {
                Data = responsefeedbackModel,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        public ResponseModel<Exchange> Updatesta(string id, Exchangesta voucher)
        {
            var Voucher = _exchangerepository.GetSingle(x => id.Equals(x.ExchangeId));
            if (Voucher == null)
            {
                return new ResponseModel<Exchange>
                {
                    MessageError = "Khong tim thay",
                    StatusCode = StatusCodes.Status404NotFound
                };
            }
            _mapper.Map(voucher, Voucher);
            Voucher.ExchangeId = id;
            _exchangerepository.Update(Voucher);
            return new ResponseModel<Exchange>
            {
                Data = Voucher,
                StatusCode = StatusCodes.Status200OK
            };
        }
    }
}
