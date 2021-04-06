using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeApi.Models
{
    public class LeaveTransactions
    {
        [Key]
        public long Id { get; set; }
        public long EmpId { get; set; }
        public string LeaveType { get; set; }
        public double LeaveCount { get; set; }

        public DateTime? DateFrom { get; set; }

        public DateTime? DateTo { get; set; }

        public string DrCr { get; set; }
        public string Reason  { get; set; }
    }
}
