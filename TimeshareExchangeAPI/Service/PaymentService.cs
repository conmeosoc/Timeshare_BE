using AutoMapper;
using Newtonsoft.Json.Linq;
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

        public ResponseModel<List<PaymentModel>> GetByMemberID(string id)
        {
            var feedbackEntity = _paymentRepository.Get(x => x.MemberId.Equals(id));

            var responsefeedbackModel = _mapper.Map<List<PaymentModel>>(feedbackEntity);
            return new ResponseModel<List<PaymentModel>>
            {
                Data = responsefeedbackModel,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }


        /*   public ResponseModel<Payment> Createpayment(PaymentModel paymentModel
               )
           {
               var userEntity = _mapper.Map<Payment>(paymentModel);

               userEntity.PayId = Guid.NewGuid().ToString();
               _paymentRepository.Create(userEntity);

               return new ResponseModel<Payment>
               {
                   Data = userEntity,
                   MessageError = "",
                   StatusCode = StatusCodes.Status200OK
               };
           }*/


        public ResponseModel<Payment> CreatePayment(PaymentRequestModel payment)
        {
            var userEntity = _mapper.Map<Payment>(payment);
            userEntity.Date = DateTime.Now;
            userEntity.PayId = Guid.NewGuid().ToString();
            _paymentRepository.Create(userEntity);

            return new ResponseModel<Payment>
            {
                Data = userEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

    }
}




