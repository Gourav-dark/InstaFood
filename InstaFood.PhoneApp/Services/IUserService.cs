using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;

namespace InstaFood.PhoneApp.Services
{
    public interface IUserService
    {
        Task<Response<User>> Login(LoginDTO obj);
        Task<Response<User>> SignUp(UserDTO obj);
    }
}
