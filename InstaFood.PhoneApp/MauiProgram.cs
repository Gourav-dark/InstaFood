using InstaFood.PhoneApp.Authentication;
using InstaFood.PhoneApp.Services;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.Extensions.Logging;

namespace InstaFood.PhoneApp
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });
            builder.Services.AddHttpClient();
            //builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri("https://localhost:7182/") });
            builder.Services.AddMauiBlazorWebView();
            builder.Services.AddScoped<AuthenticationStateProvider, CustomAuthenticationStateProvider>();

            //bootstrap
            builder.Services.AddBlazorBootstrap();
            builder.Services.AddAuthorizationCore();
            // Http Services
            //builder.Services.AddScoped<IAuthService, AuthService>();
            builder.Services.AddScoped<IUserService, UserService>();

#if DEBUG
            builder.Services.AddBlazorWebViewDeveloperTools();
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
