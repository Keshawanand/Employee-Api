using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace EmployeeApi.Models
{
    public partial class EmployeeLeaveDetails
    {
        public long Id { get; set; }
        public long? EmpId { get; set; }
        public DateTime? LeaveFrom { get; set; }
        public DateTime? LeaveTo { get; set; }
        public string Reason { get; set; }
        public bool? IsApproved { get; set; }
        public DateTime PostedDate { get; set; }
        public long? LeaveType { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public long? Approvedby { get; set; }
    }
}
