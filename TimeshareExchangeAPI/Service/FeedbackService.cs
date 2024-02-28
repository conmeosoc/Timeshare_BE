using AutoMapper;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Service
{
    public class FeedbackService : IFeedbackService
    {
        private readonly IGenericRepository<Feedback> _feedbackrepository;
        private readonly IMapper _mapper;

        public FeedbackService(IGenericRepository<Feedback> repositoryBase, IMapper mapper)
        {
            _feedbackrepository = repositoryBase;
            _mapper = mapper;

        }
        public ResponseModel<Feedback> CreateFeedback(FeedbackModel signUpModel)
        {
            var userEntity = _mapper.Map<Feedback>(signUpModel);
            
            userEntity.Id = Guid.NewGuid().ToString();
            _feedbackrepository.Create(userEntity);

            return new ResponseModel<Feedback>
            {
                Data = userEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        public ResponseModel<List<FeedbackModel>> GetAll()
        {
            var entities = _feedbackrepository.GetAll().ToList();
            var response = _mapper.Map<List<FeedbackModel>>(entities.ToList());
            return new ResponseModel<List<FeedbackModel>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //GetID
        public ResponseModel<FeedbackModel> GetSingle(string id)
        {
            var feedbackEntity = _feedbackrepository.GetSingle(x => x.Id.Equals(id));
            var responsefeedbackModel = _mapper.Map<FeedbackModel>(feedbackEntity);
            return new ResponseModel<FeedbackModel>
            {
                Data = responsefeedbackModel,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //GetbymemberID
        public ResponseModel<IQueryable<Feedback>> GetfeedbackbyMemberID(string? id)
        {
            var response = _feedbackrepository.Get(x => x.MemberId == id);

            return new ResponseModel<IQueryable<Feedback>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //GetbyrealID
        public ResponseModel<IQueryable<Feedback>> GetfeedbackbyrealestateID(string? id)
        {
            var response = _feedbackrepository.Get(x => x.RealestateId == id);

            return new ResponseModel<IQueryable<Feedback>>
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        
    }
}
