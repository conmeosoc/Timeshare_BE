using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TimeshareExchangeAPI.Entities;
using TimeshareExchangeAPI.Repository.Models;
using TimeshareExchangeAPI.Service.IService;

namespace TimeshareExchangeAPI.Controllers
{
    [ApiController]
    public class TimesharesController : ControllerBase
    {
        private readonly ITimeshareService _timeshareService;

        public TimesharesController(ITimeshareService timeshareService)
        {
            _timeshareService = timeshareService;
        }

        // GET: api/Accounts
        [HttpGet]
        [Route("api/[controller]/GetAll")]
        public IActionResult GetAllTimeshare()
        {
            var responseModel = _timeshareService.GetAll();
            return Ok(responseModel);
        }

        // GET: api/Accounts/5
        [HttpGet]
        [Route("api/[controller]/GetbyRealestateID")]

        public IActionResult GetTimesharebyRealestateID(string id)
        {
            var responseModel = _timeshareService.GetTimeshareByRealestate(id);
            return Ok(responseModel);
        }
        [HttpGet]
        [Route("api/[controller]/GetbyID")]

        public IActionResult GetTimesharebyID(string id)
        {
            var responseModel = _timeshareService.GetSingle(id);
            return Ok(responseModel);
        }
        [HttpGet]
        [Route("api/[controller]/GetbyMemberID")]

        public IActionResult GetTimesharebyMemberID(string id)
        {
            var responseModel = _timeshareService.GetByMemberID(id);
            return Ok(responseModel);
        }

        // PUT: api/Accounts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut]
        [Route("api/[controller]/UpdateTimeshare")]

        public async Task<IActionResult> PutTimeshare(string id, TimeshareRequestModel timeshare)
        {
            var responseModel = _timeshareService.UpdateTimeshare(id, timeshare);
            return Ok(responseModel);
        }

        // POST
        [HttpPost]
        [Route("api/[controller]/CreateTimeshare")]
        public async Task<IActionResult> PostTimeshare(TimeshareRequestModel timeshare)
        {
            var responseModel = _timeshareService.CreateTimeshare(timeshare);
            return Ok(responseModel);
        }
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754

        // DELETE: api/Accounts/5
        [HttpPut]
        [Route("api/[controller]/ExchangeTimeshare")]
        public async Task<IActionResult> ExchangeTimeshare(string id1, string id2)
        {
            var responseModel = _timeshareService.ExchangeTimeshare(id1, id2);
            return Ok(responseModel);
        }
        [HttpPut]
        [Route("api/[controller]/UpdateTimeshareSta")]
        public async Task<IActionResult> Updatesta(string id, Timesharesta status)
        {
            var responseModel = _timeshareService.UpdateSta(id, status);
            return Ok(responseModel);
        }
    } 
    }
