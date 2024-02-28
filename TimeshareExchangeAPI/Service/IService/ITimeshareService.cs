using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface ITimeshareService
    {
        public ResponseModel<List<TimeshareModel>> GetAll();
        public ResponseModel<IQueryable<Timeshare>> GetTimeshareByRealestate(string? id);
        public ResponseModel<Timeshare> CreateTimeshare(TimeshareRequestModel signUpModel);
        public ResponseModel<Timeshare> ExchangeTimeshare(string id1, string id2);
        public ResponseModel<Timeshare> GetByMemberID(string id);

        public ResponseModel<Timeshare> GetSingle(string id);
        public ResponseModel UpdateTimeshare(string id, TimeshareRequestModel accountModel);
    }
}
