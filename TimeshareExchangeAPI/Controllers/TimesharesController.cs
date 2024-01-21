using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TimeshareExchangeAPI.Entities;

namespace TimeshareExchangeAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TimesharesController : ControllerBase
    {
        private readonly TimeshareExchangeContext _context;

        public TimesharesController(TimeshareExchangeContext context)
        {
            _context = context;
        }

        // GET: api/Timeshares
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Timeshare>>> GetTimeshares()
        {
          if (_context.Timeshares == null)
          {
              return NotFound();
          }
            return await _context.Timeshares.ToListAsync();
        }

        // GET: api/Timeshares/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Timeshare>> GetTimeshare(string id)
        {
          if (_context.Timeshares == null)
          {
              return NotFound();
          }
            var timeshare = await _context.Timeshares.FindAsync(id);

            if (timeshare == null)
            {
                return NotFound();
            }

            return timeshare;
        }

        // PUT: api/Timeshares/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTimeshare(string id, Timeshare timeshare)
        {
            if (id != timeshare.Id)
            {
                return BadRequest();
            }

            _context.Entry(timeshare).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TimeshareExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Timeshares
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Timeshare>> PostTimeshare(Timeshare timeshare)
        {
          if (_context.Timeshares == null)
          {
              return Problem("Entity set 'TimeshareExchangeContext.Timeshares'  is null.");
          }
            _context.Timeshares.Add(timeshare);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (TimeshareExists(timeshare.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetTimeshare", new { id = timeshare.Id }, timeshare);
        }

        // DELETE: api/Timeshares/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTimeshare(string id)
        {
            if (_context.Timeshares == null)
            {
                return NotFound();
            }
            var timeshare = await _context.Timeshares.FindAsync(id);
            if (timeshare == null)
            {
                return NotFound();
            }

            _context.Timeshares.Remove(timeshare);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TimeshareExists(string id)
        {
            return (_context.Timeshares?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
