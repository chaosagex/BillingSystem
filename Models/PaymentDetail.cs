using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace BillingSystem.Models
{
    public partial class PaymentDetail
    {
        public PaymentDetail()
        {
            Invoices = new HashSet<InvoicePayment>();
        }

        public long Id { get; set; }
        public string Name { get; set; } = null!;
        public int Type { get; set; }
        public decimal Amount { get; set; }
        [NotMapped]
        public bool selected { get; set; }
        public long School { get; set; }
        public string Year { get; set; } = null!;
        public short StudentType { get; set; }
        public short Grade { get; set; }
        [DisplayName("School")]
        public virtual School? SchoolNavigation { get; set; } = null!;
        public virtual ICollection<InvoicePayment> Invoices { get; set; }
    }
}
