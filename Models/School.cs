using System;
using System.Collections.Generic;

namespace BillingSystem.Models
{
    public partial class School
    {
        public School()
        {
            PaymentDetails = new HashSet<PaymentDetail>();
            Students = new HashSet<Student>();
        }

        public long Id { get; set; }
        public string Name { get; set; } = null!;

        public virtual ICollection<PaymentDetail> PaymentDetails { get; set; }
        public virtual ICollection<Student> Students { get; set; }
    }
}
