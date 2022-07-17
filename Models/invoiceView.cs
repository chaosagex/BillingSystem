using Microsoft.AspNetCore.Mvc.Rendering;

namespace BillingSystem.Models
{
    public class invoiceView
    {
        public InvoicePayment invoice { get; set; }
        public virtual List<PaymentDetail> items  { get; set; }
}
}
