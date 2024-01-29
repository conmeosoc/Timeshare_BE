using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IRealestateService
    {
        public ResponseModel<List<RealestateModel>> GetAll();
        public ResponseModel<IQueryable<Realestate>> GetRealestatebyname(string? id);

        public ResponseModel<Realestate> GetSingle(string id);
        public ResponseModel     UpdateRealestate(string id, TimeshareModel accountModel);
    }
}
