using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IFeedbackService
    {
        public ResponseModel<List<FeedbackModel>> GetAll();
        public ResponseModel<IQueryable<Feedback>> GetfeedbackbyMemberID(string? id);
        public ResponseModel<Feedback> CreateFeedback(FeedbackModel signUpModel);
        public ResponseModel<FeedbackModel> GetSingle(string id);
    }
}
