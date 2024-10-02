using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;
using System.Net.Http.Json;

namespace InstaFood.Shared.Services
{
    public class AuthService:IAuthService
    {
        private readonly HttpClient _httpClient;
        public AuthService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        public async Task<Response<User>> Login(LoginDTO obj)
        {
            try
            {
                var response = await _httpClient.PostAsJsonAsync<LoginDTO>("/api/Users/login", obj);
                var result = await response.Content.ReadFromJsonAsync<Response<User>>();
                return result;
            }
            catch(Exception ex)
            {
                return null;
            }
        }
        public async Task<Response<User>> SignUp(UserDTO obj)
        {
            try
            {
                var response = await _httpClient.PostAsJsonAsync<UserDTO>("/api/users", obj);
                var result = await response.Content.ReadFromJsonAsync<Response<User>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
