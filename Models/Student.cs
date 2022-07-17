using System;
using System.Collections.Generic;

namespace BillingSystem.Models
{
    public partial class Student
    {
        public Student()
        {
            InvoicePayments = new HashSet<InvoicePayment>();
        }

        public long Id { get; set; }
        public string Name { get; set; } = null!;
        public long School { get; set; }
        public short Grade { get; set; }
        public short Type { get; set; }

        public virtual School SchoolNavigation { get; set; } = null!;
        public virtual ICollection<InvoicePayment> InvoicePayments { get; set; }
    }
}
