using AutoMapper;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Service
{
    public class PayoutService : IPayoutService
    {
        private readonly IGenericRepository<Payoutrequest>_paymentRepository;
        private readonly IMapper _mapper;

        public PayoutService(IGenericRepository<Payoutrequest> repositoryBase, IMapper mapper)
        {
            _paymentRepository = repositoryBase;
            _mapper = mapper;

        }



        //Get ALL
        public ResponseModel<List<PayoutModel>> GetAll()
        {
            var entities = _paymentRepository.GetAll().ToList();
            var response = _mapper.Map<List<PayoutModel>>(entities.ToList());
            return new ResponseModel<List<PayoutModel>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }





        //GetID
        public ResponseModel<Payoutrequest> GetSingle(string id)
        {
            var AccountEntity = _paymentRepository.GetSingle(x => x.Id.Equals(id));
            var responseAccountModel = _mapper.Map<PayoutModel>(AccountEntity);
            return new ResponseModel<Payoutrequest>
            {
                Data = AccountEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        public ResponseModel<List<PayoutModel>> GetByMemberID(string id)
        {
            var paymentEntity = _paymentRepository.Get(x => x.MemberId.Equals(id));

            var responsepaymentModel = _mapper.Map<List<PayoutModel>>(paymentEntity);
            return new ResponseModel<List<PayoutModel>>
            {
                Data = responsepaymentModel,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }


        




        public ResponseModel<Payoutrequest> CreatePayment(PayoutrequestModel payment)
        {
            var userEntity = _mapper.Map<Payoutrequest>(payment);
            DateTimeOffset currentTime = DateTimeOffset.Now;

            userEntity.CreateAt = currentTime;
            userEntity.Id = Guid.NewGuid().ToString();
            _paymentRepository.Create(userEntity);

            return new ResponseModel<Payoutrequest>
            {
                Data = userEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        public ResponseModel UpdateSta(String id, Payoutsta status)
        {
            var Voucher = _paymentRepository.GetSingle(x => id.Equals(x.Id));
            if (Voucher == null)
            {
                return new ResponseModel<PaymentSta>
                {
                    MessageError = "Khong tim thay",
                    StatusCode = StatusCodes.Status404NotFound
                };
            }
            _mapper.Map(status, Voucher);
            Voucher.Id= id;
            _paymentRepository.Update(Voucher);
            return new ResponseModel<Payoutrequest>
            {
                Data = Voucher,
                StatusCode = StatusCodes.Status200OK
            };
        }

    }
}
