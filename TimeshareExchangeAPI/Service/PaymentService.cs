using AutoMapper;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Service
{
    public class PaymentService : IPaymentService
    {
        private readonly IGenericRepository<Payment> _paymentRepository;
        private readonly IMapper _mapper;

        public PaymentService(IGenericRepository<Payment> repositoryBase, IMapper mapper)
        {
            _paymentRepository = repositoryBase;
            _mapper = mapper;

        }



        //Get ALL
        public ResponseModel<List<PaymentModel>> GetAll()
        {
            var entities = _paymentRepository.GetAll().ToList();
            var response = _mapper.Map<List<PaymentModel>>(entities.ToList());
            return new ResponseModel<List<PaymentModel>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        public ResponseModel<List<PaymentModel>> GetByMemberID(string id)
        {
            throw new NotImplementedException();
        }



        //GetID
        public ResponseModel<Payment> GetSingle(string id)
        {
            var AccountEntity = _paymentRepository.GetSingle(x => x.PayId.Equals(id));
            var responseAccountModel = _mapper.Map<PaymentModel>(AccountEntity);
            return new ResponseModel<Payment>
            {
                Data = AccountEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        ResponseModel<PaymentModel> IPaymentService.GetSingle(string id)
        {
            throw new NotImplementedException();
        }
    }




}