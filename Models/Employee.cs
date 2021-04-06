using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace EmployeeApi.Models
{
    public partial class Employee
    {
        public long Id { get; set; }
        public string EmpCode { get; set; }
        public string EmpFname { get; set; }
        public string EmpLname { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Gender { get; set; }
        public string ContactNo { get; set; }
        public DateTime? Dob { get; set; }
        public DateTime? Doj { get; set; }
        public bool? IsAdmin { get; set; }
        public long? RefDesignation { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Passport { get; set; }
        public string EmergancyContact { get; set; }
        public string PanCard { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? UpdatedDateTime { get; set; }
    }
}
