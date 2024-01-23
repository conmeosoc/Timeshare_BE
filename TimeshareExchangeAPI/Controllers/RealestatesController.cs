using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RealestatesController : ControllerBase
    {
        private readonly IRealestateService _realestateService;

        public RealestatesController(IRealestateService realestateService)
        {
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

        // PUT: api/Accounts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut]
        [Route("api/[controller]/UpdateAccount")]

        public async Task<IActionResult> PutTimeshare(string id, TimeshareModel timeshare)
        {
            var responseModel = _realestateService.UpdateRealestate(id, timeshare);
            return Ok(responseModel);
        }

        // POST: api/Accounts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754

        // DELETE: api/Accounts/5


    }
}
