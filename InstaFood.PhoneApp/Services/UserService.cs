using InstaFood.DataAccess.Models;
using InstaFood.Shared.DTO;
using InstaFood.Shared.Wrappers;
using System.Diagnostics;
using System.Net.Http.Json;
using System.Net.Security;
using System.Text.Json;

namespace InstaFood.PhoneApp.Services
{
    public class UserService:IUserService
    {
        private readonly HttpClient _httpClient;
        private readonly string _baseAddress;
        private readonly string _url;
        public UserService()
        {
            HttpClientHandler clientHandler = new HttpClientHandler();
            clientHandler.ServerCertificateCustomValidationCallback = (Sender, Cert, Chain, SslPolicyErrors) => { return true; };
            _httpClient = new HttpClient(clientHandler);

            _baseAddress = DeviceInfo.Platform == DevicePlatform.Android ? "http://10.0.2.2:7182" : "https://localhost:7182";
            _url = $"{_baseAddress}/api";
        }
        public async Task<Response<User>> Login(LoginDTO obj)
        {
            if (Connectivity.Current.NetworkAccess != NetworkAccess.Internet)
            {
                Debug.WriteLine("No internet access.");
                return null;
            }
            try
            {
                //var response = await _httpClient.PostAsJsonAsync<LoginDTO>("/Users/login", obj);
                HttpResponseMessage response = await _httpClient.PostAsJsonAsync<LoginDTO>($"{_url}/Users/login",obj);
                var result = await response.Content.ReadFromJsonAsync<Response<User>>();
                return result;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public async Task<Response<User>> SignUp(UserDTO obj)
        {
            var response = await _httpClient.PostAsJsonAsync("/users", obj);
            var result = await response.Content.ReadFromJsonAsync<Response<User>>();
            return result;
        }
    }
}
