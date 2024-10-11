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
            return await _authProvider.GetCurrentUser();
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
