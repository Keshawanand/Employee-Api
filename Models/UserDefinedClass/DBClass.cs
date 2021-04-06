using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeApi.Models
{
    public partial class EmployeeDBContext : DbContext
    {
        public virtual DbSet<DashBoardLeaves> DashBoardLeaves { get; set; }
        public virtual DbSet<LeaveTransactions> SpGetEmployeeLeaveTransactionDetails { get; set; }
        public virtual DbSet<LeaveTypewiseEmployeeLeave> spGetEmployeeLeavebyLeaveType { get; set; }
        public virtual DbSet<EmployeeLeaveRequestLog> spGetEmployeeLeaveRequest { get; set; }
    }
}
