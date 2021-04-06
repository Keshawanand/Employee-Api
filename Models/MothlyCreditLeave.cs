using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace EmployeeApi.Models
{
    public partial class MothlyCreditLeave
    {
        public int Id { get; set; }
        public int? LeaveType { get; set; }
        public double? MonthlyLeaves { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? CreatedDateTime { get; set; }
        public long? Createdby { get; set; }
        public long? Updatedby { get; set; }
        public DateTime? UpdatedDateTime { get; set; }
    }
}
