using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeApi.Models
{
    public class EmployeWiseLeave
    {
        [Key]
        public int Id { get; set; }
        public string LeaveType { get; set; }
        public double LeaveCount { get; set; }
    }
}
