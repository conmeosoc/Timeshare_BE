using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IAccountService
    {
        public ResponseModel GetAll();
        public ResponseModel GetAccountByName(string? name);

        public ResponseModel GetSingle(string id);
        public ResponseModel UpdateAccount(string id, AccountModel accountModel);

    }
}
