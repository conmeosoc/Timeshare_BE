using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Controllers
{
    [ApiController]
    public class FeedbacksController : ControllerBase
    {
        private readonly IFeedbackService _feedService;

        public FeedbacksController(IFeedbackService feedbackService)
        {
            _feedService = feedbackService;
        }


        // GET: api/Accounts
        [HttpGet]
        [Route("api/[controller]/GetAll")]
        public IActionResult GetAllAccounts()
        {
            var responseModel = _feedService.GetAll();
            return Ok(responseModel);
        }

        [HttpPost]
        [Route("api/[controller]/Createfeedback")]
        public IActionResult AddFeedback(FeedbackModel feedback)
        {
            var responseModel = _feedService.CreateFeedback(feedback);
            return Ok(responseModel);
        }


        // GET: api/Accounts/5
        [HttpGet]
        [Route("api/[controller]/GetbyID")]

        public IActionResult GetAccountbyID(string id)
        {
            var responseModel = _feedService.GetSingle(id);
            return Ok(responseModel);
        }

        // PUT: api/Accounts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpGet]
        [Route("api/[controller]/GetbyMemberID")]

        public async Task<IActionResult> GetbymemberID(string id)
        {
            var responseModel = _feedService.GetfeedbackbyMemberID(id);
            return Ok(responseModel);
        }


        // POST: api/Accounts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754

        // DELETE: api/Accounts/5


    } 
}

