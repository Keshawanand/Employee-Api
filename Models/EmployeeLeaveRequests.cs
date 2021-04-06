using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace EmployeeApi.Models
{
    public partial class EmployeeLeaveRequests
    {
        public long Id { get; set; }
        public long EmpId { get; set; }
        public DateTime? LeaveFrom { get; set; }
        public DateTime? LeaveTo { get; set; }
        public string ShiftFrom { get; set; }
        public string ShiftTo { get; set; }
        public string Reason { get; set; }
        public double? LeaveCount { get; set; }
        public short? ApprovedStatusId { get; set; }
        public DateTime? PostedDate { get; set; }
        public int? LeaveType { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public long? Approvedby { get; set; }
    }
}
