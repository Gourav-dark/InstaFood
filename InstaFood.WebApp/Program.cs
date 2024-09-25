using Blazored.LocalStorage;
using InstaFood.WebApp.Authentication;
using InstaFood.Shared.Services;
using InstaFood.WebApp;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri("https://www.instafood.somee.com/") });

//add Service for AuthenticationStateProvider
builder.Services.AddAuthorizationCore();
builder.Services.AddCascadingAuthenticationState();
builder.Services.AddScoped<AuthenticationStateProvider, CustomAuthenticationStateProvider>();
builder.Services.AddBlazoredLocalStorage();

//Blazor Boostrap
builder.Services.AddBlazorBootstrap();

//Http services
builder.Services.AddScoped<IAuthService, AuthService>();


await builder.Build().RunAsync();
