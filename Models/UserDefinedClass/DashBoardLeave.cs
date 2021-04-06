using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeApi.Models
{
    public class DashBoardLeaves
    {
        [Key]
        public long EmpId { get; set; }
        public double RemainingLeaves { get; set; }
        public int EmployeeonLeaveToday { get; set; }
        public int PendingLeave { get; set; }
        public int TotalEmployee { get; set; }
    }
}
