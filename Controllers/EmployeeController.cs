using EmployeeApi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;

namespace EmployeeApi.Controllers
{
    [Route("api/employee")]
    [ApiController]
    [Authorize]
    public class EmployeeController : ControllerBase
    {
        private EmployeeDBContext Db;
        public long UserId=0;
        public EmployeeController(EmployeeDBContext dBContext)
        {
            Db = dBContext;
            HttpContext c = new HttpContextAccessor().HttpContext;
            if (c.User.HasClaim(c => c.Type == "Id"))
            {
                UserId = Convert.ToInt64(c.User.Claims.FirstOrDefault(c => c.Type == "Id").Value);
            }

        }
        

        [HttpPost]
        [Route("saveemployee")]
        public async Task<ActionResult<Employee>> SaveEmployee([FromBody] Employee employee)
        {
            try
            {
                employee.CreatedDate = DateTime.Now;
                Db.Employee.Add(employee);
                await Db.SaveChangesAsync();
                return Ok(employee);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        [HttpGet]
        [Route("getallemployee")]
        public ActionResult<IEnumerable<object>> GetAllEmployee()
        {
            return  Db.Employee.Select(x=>new {x.Id, x.EmpFname, x.EmpLname, x.EmpCode, x.Doj, x.Dob, x.ContactNo, x.Gender, x.IsAdmin,x.IsActive, x.RefDesignation }).ToList();
        }
        [HttpGet]
        [Route("getdesignations")]
        public ActionResult<IEnumerable<object>> GetDesignations()
        {
            return Db.Designation.Where(x=>x.IsActive==true).Select(x => new { x.Id,x.Description}).ToList();
        }

        [HttpPost]
        [Route("postleaveledger")]
        public async Task<ActionResult<EmployeeLeaveLedger>> AddLeaveLedger([FromBody] EmployeeLeaveLedger employeeLeaveLedger)
        {
            try
            {
                var currentUser = HttpContext.User;
                Int64 userId = 0;
                if (currentUser.HasClaim(c => c.Type == "Id"))
                {
                    userId = Convert.ToInt64(currentUser.Claims.FirstOrDefault(c => c.Type == "Id").Value);
                }
                if(userId==0)
                    return BadRequest();

                employeeLeaveLedger.CreatedBy = userId;
                Db.EmployeeLeaveLedger.Add(employeeLeaveLedger);
                await Db.SaveChangesAsync();

                return Ok(employeeLeaveLedger);
            }
            catch(Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpPost]
        [Route("approveleave")]
        public async Task<ActionResult<EmployeeLeaveLedger>> ApproveLeave([FromBody] ApproveRequestInput approveRequestInput)
        {
            try
            {
                var currentUser = HttpContext.User;
                Int64 userId = 0;
                if (currentUser.HasClaim(c => c.Type == "Id"))
                {
                    userId = Convert.ToInt64(currentUser.Claims.FirstOrDefault(c => c.Type == "Id").Value);
                }
                if (userId == 0)
                    return BadRequest();
                EmployeeLeaveRequests employeerequest= Db.EmployeeLeaveRequests.FirstOrDefault(x => x.Id == approveRequestInput.RequestId && x.ApprovedStatusId !=1);
                if (employeerequest != null)
                {
                    employeerequest.Approvedby = userId;
                    employeerequest.ApprovedDate = DateTime.Now;
                    employeerequest.ApprovedStatusId = 1;
                    EmployeeLeaveLedger employeeLeaveLedger = new EmployeeLeaveLedger();
                    employeeLeaveLedger.EmpId = employeerequest.EmpId;
                    employeeLeaveLedger.DrCr = 0;
                    employeeLeaveLedger.LeaveType = Convert.ToInt32(employeerequest.LeaveType);
                    employeeLeaveLedger.DateFrom = employeerequest.LeaveFrom;
                    employeeLeaveLedger.DateTo = employeerequest.LeaveTo;
                    employeeLeaveLedger.CreatedBy = userId;
                    employeeLeaveLedger.Reason = employeerequest.Reason;
                    employeeLeaveLedger.LeaveCount = Convert.ToDouble(employeerequest.LeaveCount);
                    Db.EmployeeLeaveLedger.Add(employeeLeaveLedger);
                    await Db.SaveChangesAsync();
                    return Ok(employeeLeaveLedger);
                }
                else
                {
                    return BadRequest();
                }

               
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpPost]
        [Route("LeaveRequest")]
        public async Task<ActionResult> LeaveRequest([FromBody] EmployeeLeaveRequests employeeLeave)
        {
            try
            {
                var currentUser = HttpContext.User;
                Int64 userId = 0;
                if (currentUser.HasClaim(c => c.Type == "Id"))
                {
                    userId = Convert.ToInt64(currentUser.Claims.FirstOrDefault(c => c.Type == "Id").Value);
                }
                if (userId == 0)
                    return BadRequest();
                employeeLeave.EmpId = userId;
                employeeLeave.ApprovedStatusId = 2;
                Db.EmployeeLeaveRequests.Add(employeeLeave);
                await Db.SaveChangesAsync();

                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpPost]
        [Route("leaverequestlog")]
        public async Task<ActionResult> LeaveRequestLogByEmployee()
        {
            try
            {
                var currentUser = HttpContext.User;
                Int64 userId = 0;
                if (currentUser.HasClaim(c => c.Type == "Id"))
                {
                    userId = Convert.ToInt64(currentUser.Claims.FirstOrDefault(c => c.Type == "Id").Value);
                }
                if (userId == 0)
                    return BadRequest();

                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@EmpID",SqlDbType=System.Data.SqlDbType.BigInt, Value = userId }
                };
                var response = await Db.spGetEmployeeLeaveRequest.FromSqlRaw("exec spGetEmployeeLeaveRequest @EmpID", parms.ToArray()).ToListAsync();

                return Ok(response);

            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpPost]
        [Route("employeeallleaverequest")]
        public async Task<ActionResult> EmployeeAllLeaverequest()
        {
            try
            {
                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@EmpID",SqlDbType=System.Data.SqlDbType.BigInt, Value = DBNull.Value }
                };
                var response = await Db.spGetEmployeeLeaveRequest.FromSqlRaw("exec spGetEmployeeLeaveRequest @EmpID", parms.ToArray()).ToListAsync();

                return Ok(response);

            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("getEmployee")]
        [Authorize]
        public object GetCurrentUser(int Id)
        {
            return Db.Employee.Where(y => y.IsActive == true && y.Id==Id).Select(x => new { x.EmpFname, x.EmpLname, x.EmpCode, x.Doj, x.Dob, x.ContactNo, x.Gender, x.IsAdmin });
        }
        [HttpGet]
        [Route("getleavetypes")]
        [Authorize]
        public object GetLeaveTypes()
        {
            return Db.LeaveTypes.Where(y => y.IsActive == true ).Select(x => new { x.Id, x.LeaveType}).ToList();
        }

        [HttpPost]
        [Route("dashboardleavedata")]
        [Authorize]
        public async Task<object> DashBoardLeaveData()
        {
            try
            {
                var currentUser = HttpContext.User;
                Int64 userId = 0;
                if (currentUser.HasClaim(c => c.Type == "Id"))
                {
                    userId = Convert.ToInt64(currentUser.Claims.FirstOrDefault(c => c.Type == "Id").Value);
                }
                if (userId == 0)
                    return BadRequest();

                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@EmpID",SqlDbType=System.Data.SqlDbType.BigInt, Value = userId }
                };
                var  response= (await Db.DashBoardLeaves.FromSqlRaw("exec SpGetLeaveDetails @EmpID", parms.ToArray()).ToListAsync()).FirstOrDefault(); 

                return Ok(response);
            }
            catch(Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpPost]
        [Route("eployeeleavestransaction")]
        [Authorize]
        public async Task<object> EployeeLeavesTransaction()
        {
            try
            {
                var currentUser = HttpContext.User;
                Int64 userId = 0;
                if (currentUser.HasClaim(c => c.Type == "Id"))
                {
                    userId = Convert.ToInt64(currentUser.Claims.FirstOrDefault(c => c.Type == "Id").Value);
                }
                var U = UserId;

                if (userId == 0)
                    return BadRequest();
                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@EmpID",SqlDbType=System.Data.SqlDbType.BigInt, Value = userId }
                };
                var response = await Db.SpGetEmployeeLeaveTransactionDetails.FromSqlRaw("exec SpGetEmployeeLeaveTransactionDetails @EmpID", parms.ToArray()).ToListAsync();

                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("leavetypewiseemployeeleaves/{Id}")]
        [Authorize]
        public async Task<ActionResult<LeaveTypewiseEmployeeLeave>> LeaveTypewiseEmployeeLeaves(int Id)
        {
            try
            {
                var currentUser = HttpContext.User;
                Int64 userId = 0;
                if (currentUser.HasClaim(c => c.Type == "Id"))
                {
                    userId = Convert.ToInt64(currentUser.Claims.FirstOrDefault(c => c.Type == "Id").Value);
                }
                var U = UserId;

                if (userId == 0)
                    return BadRequest();
                
                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@LeaveTypeId",SqlDbType=System.Data.SqlDbType.Int, Value = Id },
                    new SqlParameter { ParameterName = "@EmpID",SqlDbType=System.Data.SqlDbType.BigInt, Value = userId }
                };
                var response = (await Db.spGetEmployeeLeavebyLeaveType.FromSqlRaw("exec spGetEmployeeLeavebyLeaveType @LeaveTypeId, @EmpID", parms.ToArray()).ToListAsync()).FirstOrDefault();

                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("employeewiseleave/{Id}")]
        [Authorize]
        public async Task<ActionResult<LeaveTypewiseEmployeeLeave>> employeewiseleave(int Id)
        {
            try
            {
                List<SqlParameter> parms = new List<SqlParameter>
                {
                    new SqlParameter { ParameterName = "@EmpID",SqlDbType=System.Data.SqlDbType.BigInt, Value = Id }
                };
                var response = (await Db.spGetEmployeeLeavebyLeaveType.FromSqlRaw("exec spGetEmployeeLeavebyLeaveType @EmpID", parms.ToArray()).ToListAsync()).FirstOrDefault();

                return Ok(response);
            }
            catch (Exception ex)
            {
                return BadRequest(ex);
            }
        }


    }
}
