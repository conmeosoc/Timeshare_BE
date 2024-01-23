using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface ITimeshareService
    {
        public ResponseModel GetAll();
        public ResponseModel GetTimeshareByRealestate(string? id);

        public ResponseModel GetSingle(string id);
        public ResponseModel UpdateTimeshare(string id, TimeshareModel accountModel);
    }
}
