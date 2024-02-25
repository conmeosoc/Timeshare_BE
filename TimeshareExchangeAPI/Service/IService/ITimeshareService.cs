using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface ITimeshareService
    {
        public ResponseModel<List<TimeshareModel>> GetAll();
        public ResponseModel<IQueryable<Timeshare>> GetTimeshareByRealestate(string? id);
        public ResponseModel<Timeshare> CreateTimeshare(TimeshareModel signUpModel);

        public ResponseModel<Timeshare> GetSingle(string id);
        public ResponseModel UpdateTimeshare(string id, TimeshareModel accountModel);
    }
}
