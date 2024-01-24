using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Controllers
{
    [ApiController]
    public class AccountsController : ControllerBase
    {
        private readonly IAccountService _accountService;

        public AccountsController(IAccountService accountService)
        {
            _accountService = accountService;
        }
        [HttpPost]
        [Route("api/[controller]/SignUpUser")]
        public IActionResult CreateUser(AccountRequestModel signUpModel)
        {
            var responseModel =  _accountService.SignUp(signUpModel);
            return Ok(responseModel);
        }

        // GET: api/Accounts
        [HttpGet]
        [Route("api/[controller]/GetAll")]
        public IActionResult GetAllAccounts()
        {
            var responseModel = _accountService.GetAll();
            return Ok(responseModel);
        }
        

        // GET: api/Accounts/5
        [HttpGet]
        [Route("api/[controller]/GetbyID")]

        public IActionResult GetAccountbyID(string id)
        {
            var responseModel = _accountService.GetSingle(id);
            return Ok(responseModel);
        }

        // PUT: api/Accounts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut]
        [Route("api/[controller]/UpdateAccount")]

        public async Task<IActionResult> PutAccount(string id, AccountRequestModel account)
        {
            var responseModel = _accountService.UpdateAccount(id, account);
            return Ok(responseModel);
        }

        // POST: api/Accounts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754

        // DELETE: api/Accounts/5

        [HttpPut]
        [Route("api/[controller]/UpdateAccountStatus")]

        public async Task<IActionResult> PutAccountSta(string id, Accountsta account)
        {
            var responseModel = _accountService.UpdateAccountStatus(id, account);
            return Ok(responseModel);
        }

    }
}
