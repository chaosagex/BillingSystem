using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using BillingSystem.Data;
using BillingSystem.Models;

namespace BillingSystem.Controllers
{
    public class PaymentDetailsController : Controller
    {
        private readonly InvoiceSystemContext _context;

        public PaymentDetailsController(InvoiceSystemContext context)
        {
            _context = context;
        }

        // GET: PaymentDetails
        public async Task<IActionResult> Index()
        {
            var invoiceSystemContext = _context.PaymentDetails.Include(p => p.SchoolNavigation);
            return View(await invoiceSystemContext.ToListAsync());
        }

        // GET: PaymentDetails/Details/5
        public async Task<IActionResult> Details(long? id)
        {
            if (id == null || _context.PaymentDetails == null)
            {
                return NotFound();
            }

            var paymentDetail = await _context.PaymentDetails
                .Include(p => p.SchoolNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (paymentDetail == null)
            {
                return NotFound();
            }

            return View(paymentDetail);
        }

        // GET: PaymentDetails/Create
        public IActionResult Create()
        {
            ViewData["School"] = new SelectList(_context.Schools, "Id", "Name");
            return View();
        }

        // POST: PaymentDetails/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Type,Amount,School,Year,StudentType,Grade")] PaymentDetail paymentDetail)
        {
            if (ModelState.IsValid)
            {
                _context.Add(paymentDetail);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["School"] = new SelectList(_context.Schools, "Id", "Name", paymentDetail.School);
            return View(paymentDetail);
        }

        // GET: PaymentDetails/Edit/5
        public async Task<IActionResult> Edit(long? id)
        {
            if (id == null || _context.PaymentDetails == null)
            {
                return NotFound();
            }

            var paymentDetail = await _context.PaymentDetails.FindAsync(id);
            if (paymentDetail == null)
            {
                return NotFound();
            }
            ViewData["School"] = new SelectList(_context.Schools, "Id", "Name", paymentDetail.School);
            return View(paymentDetail);
        }

        // POST: PaymentDetails/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(long id, [Bind("Id,Name,Type,Amount,School,Year,StudentType,Grade")] PaymentDetail paymentDetail)
        {
            if (id != paymentDetail.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(paymentDetail);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PaymentDetailExists(paymentDetail.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["School"] = new SelectList(_context.Schools, "Id", "Name", paymentDetail.School);
            return View(paymentDetail);
        }

        // GET: PaymentDetails/Delete/5
        public async Task<IActionResult> Delete(long? id)
        {
            if (id == null || _context.PaymentDetails == null)
            {
                return NotFound();
            }

            var paymentDetail = await _context.PaymentDetails
                .Include(p => p.SchoolNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (paymentDetail == null)
            {
                return NotFound();
            }

            return View(paymentDetail);
        }

        // POST: PaymentDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(long id)
        {
            if (_context.PaymentDetails == null)
            {
                return Problem("Entity set 'InvoiceSystemContext.PaymentDetails'  is null.");
            }
            var paymentDetail = await _context.PaymentDetails.FindAsync(id);
            if (paymentDetail != null)
            {
                _context.PaymentDetails.Remove(paymentDetail);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PaymentDetailExists(long id)
        {
          return (_context.PaymentDetails?.Any(e => e.Id == id)).GetValueOrDefault();
        }
        
    }
}
