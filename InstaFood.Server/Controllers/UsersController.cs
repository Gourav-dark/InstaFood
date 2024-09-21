using Microsoft.AspNetCore.Mvc;
using InstaFood.BusinessLogic.Repositories.Abstract;
using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;

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
        //[HttpGet]
        //public async Task<IActionResult> GetAll()
        //{
        //    try
        //    {
        //        IEnumerable<User> objs = await _unitOfWork.user.GetAllAsync();
        //        if (objs.Count() > 0)
        //        {
        //            return Ok(objs);
        //        }
        //        return NoContent();
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest(ex.Message);
        //    }
        //}
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
        public async Task<IActionResult> Post(UserDTO user)
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
                return Ok(new Response<User>(existUser) { Message = "Login Successfully." });
            }
            return NotFound(
                new Response<User>()
                {
                    Succeeded = false,
                    Message = "Account not Found."
                });
        }        
    }
}
