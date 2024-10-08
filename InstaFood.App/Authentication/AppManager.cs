using InstaFood.Shared.DTO;
using Microsoft.AspNetCore.Components.Authorization;
using System.Security.Claims;
using System.Threading.Tasks;

namespace InstaFood.App.Authentication
{
    public class AppManager
    {
        private readonly CustomAuthenticationStateProvider _authProvider;

        public AppManager(AuthenticationStateProvider authProvider)
        {
            _authProvider = (CustomAuthenticationStateProvider)authProvider;
        }

        public async Task<CurrentUser> GetCurrentUser()
        {
            var authState = await _authProvider.GetAuthenticationStateAsync();
            var user = authState.User;

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

        public async Task LoginAppManager(string token)
        {
            await _authProvider.UpdateAuthenticationState(token);
        }

        public async Task LogoutAppManager()
        {
            await _authProvider.LogoutAsync();
        }
    }
}
