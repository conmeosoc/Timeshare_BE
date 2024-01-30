using AutoMapper;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore.Update;
using Microsoft.IdentityModel.Tokens;
using System.Configuration;
using System.IdentityModel.Tokens.Jwt;
using System.Runtime;
using System.Security.Claims;
using System.Text;
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
        public ResponseModel<Account> SignUp(AccountRequestModel signUpModel)
        {
            var userEntity = _mapper.Map<Account>(signUpModel);
            var existUserSignUp = _accountRepository.GetSingle(x => x.Username.Equals(signUpModel.Username));
            if (existUserSignUp != null)
            {
                return new ResponseModel<Account>
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
            return new ResponseModel<Account>
            {
                Data = userEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }

        //Get ALL
        public ResponseModel<List<AccountModel>> GetAll()
        {
            var entities = _accountRepository.GetAll().ToList();
            var response = _mapper.Map<List<AccountModel>>(entities.ToList());
            return new ResponseModel<List<AccountModel>>
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
            return new ResponseModel<Account>
            {
                Data = AccountEntity,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        public ResponseModel<Token> Signin(string username, string password)
        {

            var AccountEntity = _accountRepository.GetSingle(x => x.Username == username && x.Password == password);
            if(AccountEntity == null)
            {
                return new ResponseModel<Token>
                {
                    MessageError = "Sai username hoac password",
                    StatusCode = StatusCodes.Status404NotFound
                };

            };                
            var responseAccountModel = _mapper.Map<AccountModel>(AccountEntity);
            Token resToken = GenerateJSONWebToken(responseAccountModel);
            
            return new ResponseModel<Token>
            {
                Data = resToken,
                MessageError = "",
                StatusCode = StatusCodes.Status200OK
            };
        }
        private static Token GenerateJSONWebToken(AccountModel account)
        {
            DateTime expires = DateTime.Now.AddSeconds(60000);
            var securityKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes("eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJ0aGFvbmhtIiwiVXNlcm5hbWUiOiJKYXZhSW5Vc2UiLCJleHAiOjE3MDY1MTMyNzMsImlhdCI6MTcwNjUxMzI3M30.YWO4zbj19dDtiECHpJMXscZJJipmeKBlZjzCystgr_4\r\n"));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
        new Claim(JwtRegisteredClaimNames.Name, account.Username),
        new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
    };
            //
            var token = new JwtSecurityToken(
                issuer: account.Username,
                audience: account.FullName,
                claims,
                expires: expires,
                signingCredentials: credentials);
            //
            var encodetoken = new JwtSecurityTokenHandler().WriteToken(token);
            //
            Token tokenres = new Token()
            {
                AccessToken = encodetoken,
                TokenType = "jwt",
                ExpiresIn = expires,
                Id = account.Id,
                FullName = account.FullName,
                Address = account.Address,
                Phone = account.Phone,
                Sex = account.Sex,
                Status = account.Status                
            };
            //
            return tokenres;
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
            return new ResponseModel<Account>
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
            return new ResponseModel<Account> { 
                Data = Account,
                StatusCode = StatusCodes.Status200OK
            };
        }
        //Delete
        public ResponseModel DeleteAccount(string id)
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
            _accountRepository.Delete(Account);
            return new ResponseModel<Account>
            {
                MessageError = "Xoa thanh cong",
                StatusCode = StatusCodes.Status200OK
            };
        }

    }
}
