using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IAccountService
    {
        public ResponseModel SignUp(AccountRequestModel signUpModel);

        public ResponseModel GetAll();
        public ResponseModel GetAccountByName(string? name);
        public ResponseModel Signin(string? username, string? password);
        public ResponseModel GetSingle(string id);
        public ResponseModel UpdateAccount(string id, AccountRequestModel accountModel);
        public ResponseModel UpdateAccountStatus(string id, Accountsta accountModel);

    }
}
