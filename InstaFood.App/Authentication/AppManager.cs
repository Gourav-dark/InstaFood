using InstaFood.Shared.DTO;

namespace InstaFood.App.Authentication
{
    public class AppManager
    {
        private readonly CustomAuthenticationStateProvider _authProvider;
        public AppManager(CustomAuthenticationStateProvider authProvider)
        {
            _authProvider = authProvider;
        }

        public CurrentUser GetCurrentUser()
        {
            return _authProvider.GetCurrentUser();
        }
        public async Task LoginAppManager(string Token)
        {
            await _authProvider.UpdateAuthenticationState(Token);
        }
        public async Task LogoutAppManager()
        {
            await _authProvider.LogoutAsync();
        }
    }
}
