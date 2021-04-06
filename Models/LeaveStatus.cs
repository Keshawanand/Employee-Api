using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace EmployeeApi.Models
{
    public partial class LeaveStatus
    {
        public int Id { get; set; }
        public string LeaveStatus1 { get; set; }
        public bool? IsActive { get; set; }
        public DateTime? CreatedDateTime { get; set; }
        public long? CreatedBy { get; set; }
        public DateTime? UpdatedDatetime { get; set; }
        public long? UpdatedBy { get; set; }
    }
}
