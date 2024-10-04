using Microsoft.AspNetCore.Components.Authorization;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;

namespace InstaFood.App.Authentication
{
    public class CustomAuthenticationStateProvider : AuthenticationStateProvider
    {
        //private readonly HttpClient _httpClient;
        //public CustomAuthenticationStateProvider(HttpClient httpClient)
        //{
        //    _httpClient = httpClient;
        //}
        private ClaimsPrincipal anonymous = new ClaimsPrincipal(new ClaimsIdentity());
        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            try
            {
                string? getUserTokenFromStorage = await SecureStorage.Default.GetAsync("UserToken");
                if (string.IsNullOrEmpty(getUserTokenFromStorage))
                    return await Task.FromResult(new AuthenticationState(anonymous));

                var claimsPrincipal = new ClaimsPrincipal(GetUserClaimsIdentity(getUserTokenFromStorage));
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
            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));
        }

        public async Task LogoutAsync()
        {
            SecureStorage.Default.Remove("UserToken");
            var claimsPrincipal = new ClaimsPrincipal(new ClaimsIdentity());
            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));
        }
        private ClaimsIdentity GetUserClaimsIdentity(string token)
        {
            var handler = new JwtSecurityTokenHandler();
            var readToken = handler.ReadJwtToken(token);
            var claims = readToken.Claims;
            return new ClaimsIdentity(claims, "CustomAuth");
        }
    }
}
