using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Controllers
{
    [ApiController]
    public class PayoutRequestController :ControllerBase
    {
        private readonly IPayoutService _paymentService;

    public PayoutRequestController(IPayoutService paymentService)
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

    


    [HttpPost]
    [Route("api/[controller]/CreatePayout")]
    public IActionResult AddPayment(PayoutrequestModel payment)
    {
            var responseModel = _paymentService.CreatePayment(payment);
        return Ok(responseModel);
    }

    [HttpPut]
    [Route("API/[controller]/UpdatePayoutSta")]
    public async Task<IActionResult> UpdateStatus(string id, Payoutsta status)
    {
        var responseModel = _paymentService.UpdateSta(id, status);
        return Ok(responseModel);
    }

    [HttpGet]
    [Route("api/[controller]/GetPayoutByID")]
    public IActionResult GetID(string id)
    {
        var responseModel = _paymentService.GetSingle(id);
        return Ok(responseModel);
    }


}
}
