using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeApi.Models
{
    public class EmployeeLeaveRequestLog
    {
        public long Id { get; set; }
        public long EmpId { get; set; }
        public string EmpName { get; set; }
        public DateTime? LeaveFrom { get; set; }
        public DateTime? LeaveTo { get; set; }
        public string ShiftFrom { get; set; }
        public string ShiftTo { get; set; }
        public string Reason { get; set; }
        public double? LeaveCount { get; set; }
        public string LeaveStatus { get; set; }
        public DateTime? PostedDate { get; set; }
        public string LeaveType { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public string Approvedby { get; set; }
    }
}
