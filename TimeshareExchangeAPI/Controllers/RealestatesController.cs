using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Controllers
{
    [ApiController]
    public class RealestatesController : ControllerBase
    {
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly IRealestateService _realestateService;

        public RealestatesController(IWebHostEnvironment webHostEnvironment, IRealestateService realestateService)
        {
            _webHostEnvironment = webHostEnvironment;
            _realestateService = realestateService;
        }
        
        // GET: api/Accounts
        [HttpGet]
        [Route("api/[controller]/GetAll")]
        public IActionResult GetAllTimeshare()
        {
            var responseModel = _realestateService.GetAll();
            return Ok(responseModel);
        }

        // GET: api/Accounts/5
        [HttpGet]
        [Route("api/[controller]/GetbyRealestateID")]

        public IActionResult GetRealestatebyID(string id)
        {
            var responseModel = _realestateService.GetSingle(id);
            return Ok(responseModel);
        } 
        [HttpGet]
        [Route("api/[controller]/GetbyMemberID")]

        public IActionResult GetRealestatebymemberID(string id)
        {
            var responseModel = _realestateService.GetBymemberID(id);
            return Ok(responseModel);
        }

        // PUT: api/Accounts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut]
        //[Route("api/[controller]/UpdateAccount")]

        //public async Task<IActionResult> PutTimeshare(string id, RealestateRequestModel timeshare)
        //{
        //    var responseModel = _realestateService.UpdateRealestate(id, timeshare);
        //    return Ok(responseModel);
        //}
        [HttpPost]
        [Route("API/[controller]/CreateRealestate")]
        public async Task<IActionResult> PostTimeshare([FromForm] RealestateRequestModel requestProductModel)    {
            var responseModel = _realestateService.CreateRealestate(_webHostEnvironment, requestProductModel);
            return Ok(responseModel);
        }
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754

        // DELETE: api/Accounts/5
        [HttpPut]
        [Route("API/[controller]/UpdateRealestateSta")]
        public async Task<IActionResult> UpdateStatus(string id, RealestateSta status)
        {
            var responseModel = _realestateService.UpdateSta(id, status);
            return Ok(responseModel);
        }

    }
}
