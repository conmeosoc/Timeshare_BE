using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IRealestateService
    {
        public ResponseModel<List<RealestateModel>> GetAll();
        public ResponseModel<IQueryable<Realestate>> GetRealestatebyname(string? id);
        public ResponseModel CreateRealestate(IWebHostEnvironment webHostEnvironment, RealestateRequestModel requestProductModel);
        public ResponseModel<Realestate> GetSingle(string id);
        public ResponseModel UpdateSta(String id, RealestateSta status);
        public ResponseModel<Realestate> GetBymemberID(string id);

        public ResponseModel UpdateRealestate(string id, RealestateRequestModel accountModel);
    }
}
