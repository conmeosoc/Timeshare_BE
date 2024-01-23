using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IRealestateService
    {
        public ResponseModel GetAll();
        public ResponseModel GetRealestatebyname(string? id);

        public ResponseModel GetSingle(string id);
        public ResponseModel UpdateRealestate(string id, TimeshareModel accountModel);
    }
}
