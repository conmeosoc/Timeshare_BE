using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Service.IService
{
    public interface IAccountService
    {
        public ResponseModel<Account> SignUp(AccountRequestModel signUpModel);
        public ResponseModel<List<AccountModel>> GetAll();
        public ResponseModel<Token> Signin(string? username, string? password);
        public ResponseModel GetSingle(string id);
        public ResponseModel UpdateAccount(string id, AccountRequestModel accountModel);
        public ResponseModel DeleteAccount(string id);
        public ResponseModel UpdateAccountStatus(string id, Accountsta accountModel);

    }
}
