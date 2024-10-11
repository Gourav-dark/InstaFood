using InstaFood.Shared.DTO;
using Microsoft.AspNetCore.Components.Authorization;
using System.IdentityModel.Tokens.Jwt;
using System.Net.Http.Headers;
using System.Security.Claims;

namespace InstaFood.App.Authentication
{
    public class CustomAuthenticationStateProvider : AuthenticationStateProvider
    {
        private readonly HttpClient _httpClient;
        public CustomAuthenticationStateProvider(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }
        private ClaimsPrincipal anonymous = new ClaimsPrincipal(new ClaimsIdentity());
        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            try
            {
                string? getUserTokenFromStorage = await SecureStorage.Default.GetAsync("UserToken");
                if (string.IsNullOrEmpty(getUserTokenFromStorage))
                {
                    _httpClient.DefaultRequestHeaders.Authorization = null;
                    return await Task.FromResult(new AuthenticationState(anonymous));
                }

                var claimsPrincipal = new ClaimsPrincipal(GetUserClaimsIdentity(getUserTokenFromStorage));
                _httpClient.DefaultRequestHeaders.Authorization =
                    new AuthenticationHeaderValue("Bearer", getUserTokenFromStorage);
                return await Task.FromResult(new AuthenticationState(claimsPrincipal));
            }
            catch
            {
                return await Task.FromResult(new AuthenticationState(anonymous));
            }
        }

        public async Task UpdateAuthenticationState(string? userToken)
        {
            ClaimsPrincipal claimsPrincipal;
            if (!string.IsNullOrEmpty(userToken))
            {
                await SecureStorage.Default.SetAsync("UserToken", userToken);

                claimsPrincipal = new ClaimsPrincipal(GetUserClaimsIdentity(userToken));
            }
            else
            {
                SecureStorage.Default.Remove("UserToken");
                claimsPrincipal = anonymous;
            }
            _httpClient.DefaultRequestHeaders.Authorization =
                   new AuthenticationHeaderValue("Bearer", userToken);
            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));
        }
        public async Task LogoutAsync()
        {
            SecureStorage.Default.Remove("UserToken");
            var claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity());
            _httpClient.DefaultRequestHeaders.Authorization = null;
            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));
        }
        private ClaimsIdentity GetUserClaimsIdentity(string token)
        {
            var handler = new JwtSecurityTokenHandler();
            var readToken = handler.ReadJwtToken(token);
            var claims = readToken.Claims;
            return new ClaimsIdentity(claims, "CustomAuth");
        }
        public async Task<CurrentUser> GetCurrentUser()
        {
            var authState = await GetAuthenticationStateAsync();
            ClaimsPrincipal user = authState.User;

            if (user.Identity.IsAuthenticated)
            {
                var userId = user.FindFirst(ClaimTypes.NameIdentifier)?.Value;
                var name = user.FindFirst(ClaimTypes.Name)?.Value;
                var email = user.FindFirst(ClaimTypes.Email)?.Value;
                var role = user.FindFirst(ClaimTypes.Role)?.Value;

                return new CurrentUser
                {
                    IsAuthenticated = true,
                    UserId = userId,
                    Name = name,
                    Email = email,
                    Role = role
                };
            }
            return new CurrentUser { IsAuthenticated = false };
        }
    }
}
