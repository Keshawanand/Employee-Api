using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace EmployeeApi.Models
{
    public partial class EmployeeLeaveLedger
    {
        public long Id { get; set; }
        public long EmpId { get; set; }
        public int LeaveType { get; set; }
        public string Reason { get; set; }
        public double LeaveCount { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public int DrCr { get; set; }
        public DateTime? CreatedDate { get; set; }
        public long CreatedBy { get; set; }
    }
}
