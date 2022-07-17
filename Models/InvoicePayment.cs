using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace BillingSystem.Models
{
    public partial class InvoicePayment
    {
        public InvoicePayment()
        {
            InversePreviousPaymentNavigation = new HashSet<InvoicePayment>();
            PaymentItems = new HashSet<PaymentDetail>();
        }

        public long Id { get; set; }
        public long Student { get; set; }
        [DataType(DataType.Date)]
        [Required]
        public DateTime Date { get; set; }
        public decimal TotalCost { get; set; }
        public decimal Paid { get; set; }
        [DisplayName("Total Debt")]
        public decimal Remaining { get; set; }
        public long? PreviousPayment { get; set; }
        public string? Notes { get; set; }
        [DisplayName("Previous Payment")]
        public virtual InvoicePayment? PreviousPaymentNavigation { get; set; }
        [DisplayName("Student")]
        public virtual Student? StudentNavigation { get; set; } = null!;

        public virtual ICollection<InvoicePayment>? InversePreviousPaymentNavigation { get; set; }
        [DisplayName("Item")]
        public virtual ICollection<PaymentDetail> PaymentItems { get; set; }
    }
}
