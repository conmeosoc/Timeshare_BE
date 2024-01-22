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
            var AccountEntity = _accountRepository.GetSingle(x => id.Equals(x.Id));
            if (AccountEntity == null)
            {
                return new ResponseModel
                {
                    MessageError = "Khong tim thay",
                    StatusCode = StatusCodes.Status404NotFound
                };
            }
            _mapper.Map(requestAccountModel, AccountEntity);
            _accountRepository.Update(AccountEntity);
            return new ResponseModel
            {
                StatusCode = StatusCodes.Status200OK
            };
        }



    }
}
