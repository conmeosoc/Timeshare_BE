using AutoMapper;
using Microsoft.AspNetCore.Http;
using System.Runtime;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Generic;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Service
{
    public class AccountService : IAccountService
    {
        private readonly IGenericRepository<Account> _accountRepository;
        private readonly IMapper _mapper;

        public AccountService(IGenericRepository<Account> repositoryBase, IMapper mapper)
        {
            _accountRepository = repositoryBase;
            _mapper = mapper;

        }
        public ResponseModel SignUp(AccountRequestModel signUpModel)
        {
            var userEntity = _mapper.Map<Account>(signUpModel);
            var existUserSignUp = _accountRepository.GetSingle(x => x.Username.Equals(signUpModel.Username));
            if (existUserSignUp != null)
            {
                return new ResponseModel
                {
                    MessageError = "Username đã tồn tại",
                    StatusCode = StatusCodes.Status400BadRequest
                };
            }
            userEntity.Id = Guid.NewGuid().ToString();
            _accountRepository.Create(userEntity);

            //var sendEmailModel = new SendMailModel()
            //{
            //    Content = "Code: " + userEntity.VerifyEmail,
            //    ReceiveAddress = userEntity.userEmail,
            //    Subject = "Verify Account",
            //};
            //_emailService.SendEmail(sendEmailModel);
            return new ResponseModel
            {
                Data = userEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }


        //Get ALL
        public ResponseModel GetAll()
        {
            var entities = _accountRepository.GetAll().ToList();
            var response = _mapper.Map<List<AccountModel>>(entities.ToList());
            return new ResponseModel
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        public ResponseModel GetAccountByName(string? name)
        {
            var response = _accountRepository.Get(x => x.FullName == name);
            return new ResponseModel
            {
                Data = response,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        //GetID
        public ResponseModel GetSingle(string id)
        {
            var AccountEntity = _accountRepository.GetSingle(x => x.Id.Equals(id));
            var responseAccountModel = _mapper.Map<AccountModel>(AccountEntity);
            return new ResponseModel
            {
                Data = AccountEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        public ResponseModel Signin(string username, string password)
        {
            var AccountEntity = _accountRepository.GetSingle(x => x.Username == username && x.Password == password);
            if(AccountEntity == null)
            {
                return new ResponseModel
                {
                    MessageError = "Sai username hoac password",
                    StatusCode = StatusCodes.Status404NotFound
                };

            };                
            var responseAccountModel = _mapper.Map<AccountModel>(AccountEntity);

            return new ResponseModel
            {
                Data = AccountEntity,
                MessageError = "Dang nhap thanh cong!",
                StatusCode = StatusCodes.Status200OK
            };
        }
        //Update
        public ResponseModel UpdateAccount(string id, AccountRequestModel requestAccountModel)
        {
            var Account = _accountRepository.GetSingle(x => id.Equals(x.Id));
            if (Account == null)
            {
                return new ResponseModel
                {
                    MessageError = "Khong tim thay",
                    StatusCode = StatusCodes.Status404NotFound
                };
            }
            _mapper.Map(requestAccountModel, Account);
            Account.Id = id;
            _accountRepository.Update(Account);
            return new ResponseModel
            {
                Data = Account,
                StatusCode = StatusCodes.Status200OK
            };
        }
        public ResponseModel UpdateAccountStatus(string id, Accountsta account) 
        {
            var Account = _accountRepository.GetSingle(x => id.Equals(x.Id));
            if (Account == null)
            {
                return new ResponseModel
                {
                    MessageError = "Khong tim thay",
                    StatusCode = StatusCodes.Status404NotFound
                };
            }
            _mapper.Map(account, Account);
            Account.Id = id;
            _accountRepository.Update(Account);
            return new ResponseModel
            {
                Data = Account,
                StatusCode = StatusCodes.Status200OK
            };
        }


    }
}
