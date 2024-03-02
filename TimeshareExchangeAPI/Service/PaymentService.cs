using AutoMapper;
using static TimeshareExchangeAPI.Service.PaymentService;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Service
{

        public class PaymentService : IPaymentService
        {
            private readonly IRepositoryBase<UserPaymentMenthodEntity> _userPaymentMenthodRepository;
            private readonly IMapper _mapper;

            public PaymentService(IRepositoryBase<UserPaymentMenthodEntity> repositoryBase, IMapper mapper)
            {
                _userPaymentMenthodRepository = repositoryBase;
                _mapper = mapper;
            }

            //Create
            public ResponseModel CreateUserPaymentMethod(RequestUserPaymentModel entity)
            {
                var userPaymentMethodEntity = _mapper.Map<UserPaymentMenthodEntity>(entity);
                _userPaymentMenthodRepository.Create(userPaymentMethodEntity);
                return new ResponseModel
                {
                    Data = userPaymentMethodEntity,
                    MessageError = "",
                    StatusCode = StatusCodes.Status200OK
                };
            }
            //GetID
            public ResponseModel GetSingle(string id)
            {
                var userPaymentMethodEntity = _userPaymentMenthodRepository.GetSingle(x => x.Id.Equals(id));
                var responseBirdCategoryModel = _mapper.Map<ResponseUserPaymentModel>(userPaymentMethodEntity);
                return new ResponseModel
                {
                    Data = userPaymentMethodEntity,
                    MessageError = "",
                    StatusCode = StatusCodes.Status200OK
                };
            }
            //Update
            public ResponseModel UpdatePaymentMenthod(string id, RequestUserPaymentModel requestUserPaymentModel)
            {
                var userPaymentMethodEntity = _userPaymentMenthodRepository.GetSingle(x => id.Equals(x.Id));
                if (userPaymentMethodEntity == null)
                {
                    return new ResponseModel
                    {
                        MessageError = "Khong tim thay",
                        StatusCode = StatusCodes.Status404NotFound
                    };
                }
                _mapper.Map(requestUserPaymentModel, userPaymentMethodEntity);
                _userPaymentMenthodRepository.Update(userPaymentMethodEntity);
                return new ResponseModel
                {
                    StatusCode = StatusCodes.Status200OK
                };
            }
            //Delete bY ID
            public ResponseModel DeletePaymentMenthod(string id)
            {
                var userPaymentMethodEntity = _userPaymentMenthodRepository.GetSingle(x => x.Id.Equals(id));
                if (userPaymentMethodEntity == null)
                {
                    return new ResponseModel
                    {
                        MessageError = "Khong tim thay",
                        StatusCode = StatusCodes.Status404NotFound
                    };
                }
                _userPaymentMenthodRepository.Delete(userPaymentMethodEntity);
                return new ResponseModel
                {
                    StatusCode = StatusCodes.Status200OK
                };
            }

            public ResponseModel GetAllPaymentMethod()
            {
                var entities = _userPaymentMenthodRepository.GetAll();
                var responseBirdCategoryModel = _mapper.Map<List<ResponseUserPaymentModel>>(entities);
                return new ResponseModel() { Data = responseBirdCategoryModel, StatusCode = 200 };
            }
        }
    }
}
}
