using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
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

        [HttpGet]
        [Route("api/[controller]/GetbyMemberID")]

        public IActionResult GetbyMemberID(string id)
        {
            var responseModel = _paymentService.GetByMemberID(id);
            return Ok(responseModel);
        }

        /*[HttpPost]
        [Route("api/[controller]/PutPayment")]
        public IActionResult CreatePayment([FromBody] PaymentModel paymentModel)
        {
            if (paymentModel == null)
            {
                return BadRequest("Invalid payment data");
            }

            // Gọi phương thức CreatePayment với đối tượng paymentModel
            var responseModel = _paymentService.CreatePayment(paymentModel);

            // Trả về kết quả cho client
            return Ok(responseModel);
        }*/

        [HttpPost]
        [Route("api/[controller]/CreatePayment")]
        public IActionResult AddBooking(PaymentRequestModel booking)
        {
            var responseModel = _paymentService.CreatePayment(booking);
            return Ok(responseModel);
        }
    }
}