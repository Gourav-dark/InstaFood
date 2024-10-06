using InstaFood.App.Authentication;
using InstaFood.Shared.Services;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.Extensions.Logging;

namespace InstaFood.App
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
            //adding new Services
            builder.Services.AddHttpClient();
            builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri("https://www.instafood.somee.com/") });
            builder.Services.AddAuthorizationCore();
            builder.Services.AddScoped<CustomAuthenticationStateProvider>();
            builder.Services.AddScoped<AuthenticationStateProvider>(provider => provider.GetRequiredService<CustomAuthenticationStateProvider>());
            builder.Services.AddScoped<AppManager>();
            //builder.Services.AddScoped<AuthenticationStateProvider, CustomAuthenticationStateProvider>();
            //builder.Services.AddScoped<AppManager>();
            builder.Services.AddScoped<IAuthService, AuthService>();
            builder.Services.AddScoped<IProductService, ProductService>();
            builder.Services.AddScoped<ICartService, CartService>();
            //Ending new services
            builder.Services.AddMauiBlazorWebView();

#if DEBUG
    		builder.Services.AddBlazorWebViewDeveloperTools();
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
