using AutoMapper;
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
        public ResponseModel SignUp(AccountModel signUpModel)
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
            _accountRepository.Create(userEntity);
            userEntity.Id = Guid.NewGuid().ToString();
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

        //Update
        public ResponseModel UpdateAccount(string id, AccountModel requestAccountModel)
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
            _accountRepository.Update(Account);
            return new ResponseModel
            {
                StatusCode = StatusCodes.Status200OK
            };
        }



    }
}
