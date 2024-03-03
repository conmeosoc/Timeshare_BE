using Microsoft.AspNetCore.Mvc;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Controllers
{

    [ApiController]
    public class PaymentController : ControllerBase
    {
        private readonly IPaymentService _paymentService;

        public PaymentController(IPaymentService paymentService)
        {
            _paymentService = paymentService;
        }


        // GET: api/Accounts
        [HttpGet]
        [Route("api/[controller]/GetAll")]
        public IActionResult GetAll()
        {
            var responseModel = _paymentService.GetAll();
            return Ok(responseModel);
        }


    }
}