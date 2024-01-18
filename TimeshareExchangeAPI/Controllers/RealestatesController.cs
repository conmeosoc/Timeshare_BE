using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TimeshareExchangeAPI.Repository.Models;

namespace TimeshareExchangeAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RealestatesController : ControllerBase
    {
        private readonly TimeshareExchangeContext _context;

        public RealestatesController(TimeshareExchangeContext context)
        {
            _context = context;
        }

        // GET: api/Realestates
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Realestate>>> GetRealestates()
        {
          if (_context.Realestates == null)
          {
              return NotFound();
          }
            return await _context.Realestates.ToListAsync();
        }

        // GET: api/Realestates/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Realestate>> GetRealestate(string id)
        {
          if (_context.Realestates == null)
          {
              return NotFound();
          }
            var realestate = await _context.Realestates.FindAsync(id);

            if (realestate == null)
            {
                return NotFound();
            }

            return realestate;
        }

        // PUT: api/Realestates/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutRealestate(string id, Realestate realestate)
        {
            if (id != realestate.Id)
            {
                return BadRequest();
            }

            _context.Entry(realestate).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RealestateExists(id))
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

        // POST: api/Realestates
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Realestate>> PostRealestate(Realestate realestate)
        {
          if (_context.Realestates == null)
          {
              return Problem("Entity set 'TimeshareExchangeContext.Realestates'  is null.");
          }
            _context.Realestates.Add(realestate);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (RealestateExists(realestate.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetRealestate", new { id = realestate.Id }, realestate);
        }

        // DELETE: api/Realestates/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteRealestate(string id)
        {
            if (_context.Realestates == null)
            {
                return NotFound();
            }
            var realestate = await _context.Realestates.FindAsync(id);
            if (realestate == null)
            {
                return NotFound();
            }

            _context.Realestates.Remove(realestate);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool RealestateExists(string id)
        {
            return (_context.Realestates?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
