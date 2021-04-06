using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EmployeeApi.Models
{
    public class User
    {
        public long Id { get; set; }
        public string EmpCode { get; set; }
        public string Fname { get; set; }
        public string Lname { get; set; }
        public string UserName { get; set; }
        public bool? IsAdmin { get; set; }
        public string FullName { get { return Fname +' '+ Lname; } }
        public string Token { get; set; }

    }
}
