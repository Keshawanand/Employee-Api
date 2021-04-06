using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeApi.Models
{
    public class LeaveTypewiseEmployeeLeave
    {
        [Key]
        public long EmpId  { get; set; }
        public int LeavetypeId { get; set; }
        public double RemainingLeaves { get; set; }
    }
}
