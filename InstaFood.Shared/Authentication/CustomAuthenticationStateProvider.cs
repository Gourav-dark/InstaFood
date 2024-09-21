using Blazored.LocalStorage;
using Microsoft.AspNetCore.Components.Authorization;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text.Json;

namespace InstaFood.App.Authentication
{
    public class CustomAuthenticationStateProvider : AuthenticationStateProvider
    {
        private readonly ILocalStorageService _localStorage;
        private ClaimsPrincipal anonymous = new ClaimsPrincipal(new ClaimsIdentity());

        public CustomAuthenticationStateProvider(ILocalStorageService localStorage)
        {
            _localStorage = localStorage;
        }

        public override async Task<AuthenticationState> GetAuthenticationStateAsync()
        {
            try
            {
                string? getUserTokenFromStorage = await _localStorage.GetItemAsStringAsync("UserToken");
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
                await _localStorage.SetItemAsStringAsync("UserToken", userToken);

                claimsPrincipal = new ClaimsPrincipal(GetUserClaimsIdentity(userToken));
            }
            else
            {
                await _localStorage.RemoveItemAsync("UserToken");
                claimsPrincipal = anonymous;
            }
            NotifyAuthenticationStateChanged(Task.FromResult(new AuthenticationState(claimsPrincipal)));
        }

        public async Task LogoutAsync()
        {
            await _localStorage.RemoveItemAsync("UserToken");
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
