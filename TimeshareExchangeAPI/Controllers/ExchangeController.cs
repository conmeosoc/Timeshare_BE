using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Controllers
{
    [ApiController]
    public class ExchangeController : ControllerBase
    {
        private readonly IExchangeService _exchangeService;

        public ExchangeController(IExchangeService bookService)
        {
            _exchangeService = bookService;
        }


        // GET: api/Accounts
        [HttpGet]
        [Route("api/[controller]/GetAll")]
        public IActionResult GetAllAccounts()
        {
            var responseModel = _exchangeService.GetAll();
            return Ok(responseModel);
        }
        //getid
        [HttpGet]
        [Route("api/[controller]/GetExchangebyID")]
        public IActionResult Getbyid(string id)
        {
            var responseModel = _exchangeService.GetSingle(id);
            return Ok(responseModel);
        }
        //getmemid
        [HttpGet]
        [Route("api/[controller]/GetExchangebymemberID")]
        public IActionResult Getbymemid(string memberid)
        {
            var responseModel = _exchangeService.Getbymemid(memberid);
            return Ok(responseModel);
        } 
        [HttpPut]
        [Route("api/[controller]/Updatestatus")]
        public IActionResult Updatesta(string id, Exchangesta voucher)
        {
            var responseModel = _exchangeService.Updatesta(id,voucher);
            return Ok(responseModel);
        }
        [HttpPost]
        [Route("api/[controller]/CreateExchange")]
        public IActionResult create(ExchangeRequestModel signUpModel)
        {
            var responseModel = _exchangeService.CreateExchange(signUpModel);
            return Ok(responseModel);
        }

    }
}
