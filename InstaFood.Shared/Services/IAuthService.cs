using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;

namespace InstaFood.Shared.Services
{
    public interface IAuthService
    {
        Task<Response<User>> Login(LoginDTO obj);
        Task<Response<User>> SignUp(UserDTO obj);
    }
}
