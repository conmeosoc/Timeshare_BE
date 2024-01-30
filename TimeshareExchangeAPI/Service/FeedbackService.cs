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
        public ResponseModel<IQueryable<FeedbackModel>> GetfeedbackbyMemberID(string? id)
        {
            var response = _feedbackrepository.Get(x => x.MemberId == id);
            var responsefeedbackModel = _mapper.Map<IQueryable<FeedbackModel>>(response);

            return new ResponseModel<IQueryable<FeedbackModel>>
            {
                Data = responsefeedbackModel,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //Getby
    }
}
