using AutoMapper;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Service
{
    public class BookingService : IBookingService
    {
        private readonly IGenericRepository<Booking> _feedbackrepository;
        private readonly IMapper _mapper;

        public BookingService(IGenericRepository<Booking> repositoryBase, IMapper mapper)
        {
            _feedbackrepository = repositoryBase;
            _mapper = mapper;

        }
        public ResponseModel<Booking> CreateBooking(BookingRequestModel signUpModel)
        {
            var userEntity = _mapper.Map<Booking>(signUpModel);
            userEntity.CreatedDay = DateTime.Now;
            userEntity.Id = Guid.NewGuid().ToString();
            _feedbackrepository.Create(userEntity);

            return new ResponseModel<Booking>
            {
                Data = userEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        public ResponseModel<List<BookingModel>> GetAll()
        {
            var entities = _feedbackrepository.GetAll().ToList();
            var response = _mapper.Map<List<BookingModel>>(entities.ToList());
            return new ResponseModel<List<BookingModel>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //GetID
        public ResponseModel<BookingModel> GetSingle(string id)
        {
            var feedbackEntity = _feedbackrepository.GetSingle(x => x.Id.Equals(id));
            var responsefeedbackModel = _mapper.Map<BookingModel>(feedbackEntity);
            return new ResponseModel<BookingModel>
            {
                Data = responsefeedbackModel,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //GetbymemberID
        public ResponseModel<BookingModel> GetByMemberID(string id)
        {
            var feedbackEntity = _feedbackrepository.GetSingle(x => x.MemberId.Equals(id));
            var responsefeedbackModel = _mapper.Map<BookingModel>(feedbackEntity);
            return new ResponseModel<BookingModel>
            {
                Data = responsefeedbackModel,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

    }
}
