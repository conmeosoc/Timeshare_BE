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

        public IActionResult GetTimesharebyID(string id)
        {
            var responseModel = _timeshareService.GetSingle(id);
            return Ok(responseModel);
        }

        // PUT: api/Accounts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut]
        [Route("api/[controller]/UpdateTimeshare")]

        public async Task<IActionResult> PutTimeshare(string id, TimeshareModel timeshare)
        {
            var responseModel = _timeshareService.UpdateTimeshare(id, timeshare);
            return Ok(responseModel);
        }

        // POST: api/Accounts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754

        // DELETE: api/Accounts/5


    } 
    }
