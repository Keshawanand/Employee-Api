using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace EmployeeApi.Models
{
    public partial class CurrentFinancialYear
    {
        public long Id { get; set; }
        public string CurrentFinancialYear1 { get; set; }
        public DateTime StartFrom { get; set; }
        public DateTime? EndTo { get; set; }
        public bool? IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
