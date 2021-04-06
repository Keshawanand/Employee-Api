using EmployeeApi.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace EmployeeApi.Controllers
{
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private EmployeeDBContext Db;
        private IConfiguration _config;

        public AuthController(EmployeeDBContext dBContext, IConfiguration config)
        {
            Db = dBContext;
            _config = config;
        }

        [HttpPost,Route("login")]
        public IActionResult login(Login login)
        {
            if (login == null)
                return BadRequest("Invalid Client request");
            var UserCredential = Db.Employee.FirstOrDefault(x => x.UserName == login.UserName && x.Password == login.Password);
            if(UserCredential !=null)
            {
                var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config.GetValue<string>("jwt:Key")));
                var signinCredential = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha256);
                var tokendetails = new JwtSecurityToken(
                 issuer: "https://localhost:44339",
                 audience: "https://localhost:44339",
                 claims: new[] { new Claim("Id", UserCredential.Id.ToString()) },
                 expires:System.DateTime.Now.AddMinutes(30),
                 signingCredentials:signinCredential
                ) ;

                var tokenString = new JwtSecurityTokenHandler().WriteToken(tokendetails);
                User user = new User();
                var emp = Db.Employee.FirstOrDefault(x => x.Id == UserCredential.Id);
                user.Id = emp.Id;
                user.UserName = emp.UserName;
                user.EmpCode = emp.EmpCode;
                user.Fname = emp.EmpFname;
                user.Lname = emp.EmpLname;
                user.IsAdmin = emp.IsAdmin;
                user.Token = tokenString;
                return Ok(new { user= user });
            }
            return Unauthorized();
        }

        [HttpGet]
        [Route("user")]
        [Authorize]
        public User GetCurrentUser()
        {
            var jwt = HttpContext.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            var tokenHandler = new JwtSecurityTokenHandler();
            var secretKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config.GetValue<string>("jwt:Key")));
            tokenHandler.ValidateToken(jwt, new TokenValidationParameters
            {
                IssuerSigningKey = secretKey,
                ValidateIssuerSigningKey = true,
                ValidateIssuer = false,
                ValidateAudience = false
            }, out SecurityToken validatedToken);

            //var userId = validatedToken.Id;
            var currentUser = HttpContext.User;
            Int64 userId = 0;
            if (currentUser.HasClaim(c => c.Type == "Id"))
            {
                userId = Convert.ToInt64(currentUser.Claims.FirstOrDefault(c => c.Type == "Id").Value);
            }

            User user = new User();
            var emp = Db.Employee.FirstOrDefault(x => x.Id == userId);
            user.Id = emp.Id;
            user.UserName = emp.UserName;
            user.EmpCode = emp.EmpCode;
            user.Fname = emp.EmpFname;
            user.Lname = emp.EmpLname;
            user.IsAdmin = emp.IsAdmin;
            return user;
        }
    }
}
