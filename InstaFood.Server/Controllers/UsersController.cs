using Microsoft.AspNetCore.Mvc;
using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;
using Microsoft.IdentityModel.Tokens;
using System.Data;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace InstaFood.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IConfiguration _config;
        public UsersController(IUnitOfWork unitOfWork,IConfiguration config)
        {
            _unitOfWork = unitOfWork;
            _config = config;
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(string id)
        {
            try
            {
                User user = await _unitOfWork.user.GetAsync(x => x.UserId == id);
                if (user !=null)
                {
                    return Ok(new Response<User>(user));
                }
                return NotFound(
                    new Response<User>()
                    {
                        Succeeded = false,
                        Message = "Id not Found."
                    });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPost]
        public async Task<IActionResult> SignUp(UserDTO user)
        {
            User existUser=await _unitOfWork.user.GetAsync(x=>x.Email==user.Email);
            string? AdminCode = _config["SecureAdmin:Code"];
            if (existUser == null)
            {
                User newUser = new User() {
                     Email = user.Email,
                     Name = user.Name,
                     Password = user.Password,
                     Role = (AdminCode==user.AdminCode)?"Admin":"Customer"
                };
                await _unitOfWork.user.AddAsync(newUser);
                await _unitOfWork.Save();
                return Ok(new Response<User>(newUser) { Message = "Account successfully created."});
            }
            return NotFound(
                new Response<User>()
                {
                    Succeeded = false,
                    Message = "Already have Account."
                });
        }
        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginDTO l)
        {
            User existUser = await _unitOfWork.user.GetAsync(x => x.Email == l.Email);
            if (existUser != null && existUser.Password == l.Password) 
            {
                return Ok(
                    new Response<User>() 
                    { 
                        Message = "Login Successfully.",
                        Token=jwtTokenGenerator(existUser.Name,existUser.Email,existUser.Role),
                        Succeeded=true,
                    });
            }
            return NotFound(
                new Response<User>()
                {
                    Succeeded = false,
                    Message = "Incorrect email or password."
                });
        }
        //JWT with Role Base Token Generate--------------------
        private string jwtTokenGenerator(string? name,string? email,string? role)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["JWT:Key"]));
            var credential = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);
            var claims = new[]
            {
                    new Claim(ClaimTypes.Name, name),
                    new Claim(ClaimTypes.Email,email),
                    new Claim(ClaimTypes.Role,role),
            };
            var token = new JwtSecurityToken(
                issuer: _config["JWT:Issuer"],
                audience: _config["JWT:Audience"],
                claims: claims,
                expires: DateTime.Now.AddMinutes(30),
                signingCredentials: credential
                );
            var jwt = new JwtSecurityTokenHandler().WriteToken(token);
            return jwt;
        }
    }
}
