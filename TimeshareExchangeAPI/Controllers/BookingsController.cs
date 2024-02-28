using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Controllers
{
    [ApiController]
    public class BookingsController : ControllerBase
    {
        private readonly IBookingService _bookService;

        public BookingsController(IBookingService bookService)
        {
            _bookService = bookService;
        }


        // GET: api/Accounts
        [HttpGet]
        [Route("api/[controller]/GetAll")]
        public IActionResult GetAllAccounts()
        {
            var responseModel = _bookService.GetAll();
            return Ok(responseModel);
        }

        [HttpPost]
        [Route("api/[controller]/Createbooking")]
        public IActionResult AddBooking(BookingRequestModel booking)
        {
            var responseModel = _bookService.CreateBooking(booking);
            return Ok(responseModel);
        }


        // GET: api/Accounts/5
        [HttpGet]
        [Route("api/[controller]/GetbyID")]

        public IActionResult GetAccountbyID(string id)
        {
            var responseModel = _bookService.GetSingle(id);
            return Ok(responseModel);
        } 
        [HttpGet]
        [Route("api/[controller]/GetbyMemberID")]

        public IActionResult GetbookingbyMemberID(string id)
        {
            var responseModel = _bookService.GetByMemberID(id);
            return Ok(responseModel);
        }


    }
}
