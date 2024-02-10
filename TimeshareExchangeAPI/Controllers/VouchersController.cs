using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Controllers
{
   [ApiController]
    public class VouchersController : ControllerBase
    {
        private readonly IVoucherService _voucherService;

    public VouchersController(IVoucherService bookService)
    {
            _voucherService = bookService;
    }


    // GET: api/Accounts
    [HttpGet]
    [Route("api/[controller]/GetAll")]
    public IActionResult GetAllAccounts()
    {
        var responseModel = _voucherService.GetAll();
        return Ok(responseModel);
    }

    [HttpPost]
    [Route("api/[controller]/Createvoucher")]
    public IActionResult AddBooking(Voucher booking)
    {
        var responseModel = _voucherService.CreateVoucher(booking);
        return Ok(responseModel);
    }


    // GET: api/Accounts/5
    [HttpGet]
    [Route("api/[controller]/GetbyID")]

    public IActionResult GetAccountbyID(string id)
    {
        var responseModel = _voucherService.GetSingle(id);
        return Ok(responseModel);
    }


}
}
